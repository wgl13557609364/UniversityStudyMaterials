/* 第六章  数据库
 学生关系   S(SNO,SNAME,AGE,SEX,SDEPT)
 成绩关系   SC(SNO,CNO,GRADE)  
 课程关系   C(CNO,CNAME,TEACHER) */
USE MASTER
IF EXISTS(SELECT * FROM SYS.DATABASES WHERE NAME='JXGL') 
DROP DATABASE JXGL
GO
CREATE DATABASE JXGL
GO
USE JXGL
CREATE TABLE s(
	SNO CHAR(4) NOT NULL PRIMARY KEY,
	SNAME CHAR(9),
	SEX CHAR(2) CHECK(SEX='男' OR SEX='女')  DEFAULT('男'),
	NATION CHAR(10),
	AGE INT CHECK(AGE BETWEEN 0 AND 150),	
	SDEPT CHAR(20)
) 
GO

CREATE TABLE SC
(
	SNO CHAR(4),
	CNO CHAR(4),
	GRADE INT,
	CONSTRAINT PC_SC PRIMARY KEY(SNO,CNO) ,
               CONSTRAINT FK_SC_Student foreign key(sno)  references s(sno)
)
GO

CREATE TABLE C
(
	CNO CHAR(4) NOT NULL PRIMARY KEY,
	CNAME CHAR(20),
	TEACHER CHAR(20)
)

INSERT INTO  s VALUES('S1','雷胜珍','女','汉',23,'计算机')
INSERT INTO  s VALUES('S2','邰秋荣','女','侗',20,'计算机')
INSERT INTO  s VALUES('S3','左惠','女','汉',20,'机电工程')
INSERT INTO  s VALUES('S4','刘莉','女','侗',21,'机电工程')
INSERT INTO  s VALUES('S5','潘巧丽','女','侗',22,'电子信息')
INSERT INTO  s VALUES('S6','穆显钰','男','侗',19,'电信信息')
INSERT INTO  s VALUES('S8','李涛','男','苗',18,'物流管理')
INSERT INTO  s VALUES('S9','强哥','男','汉',19,'物流管理')
INSERT INTO  s VALUES('S10','小明','男','汉',19,'物流管理')
INSERT INTO  s VALUES('S11','小倩','女','汉',19,'计算机')
INSERT INTO  s VALUES('S12','李小刚','女','壮',20,'计算机')
INSERT INTO  s VALUES('S13','张小飞','女','汉族',20,'计算机')

GO
INSERT INTO c VALUES('C1','C语言','张山')
INSERT INTO c VALUES('C2','离散数学','令狐冲')
INSERT INTO c VALUES('C3','操作系统','郭靖')
INSERT INTO c VALUES('C4','数据结构','黄蓉')
INSERT INTO c VALUES('C5','数据库','李四')
INSERT INTO c VALUES('C7','信息基础','王五')
INSERT INTO c VALUES('C8','英语','杨过')
INSERT INTO c VALUES('C9','计算机组成原理','一灯大师')
GO

INSERT INTO SC VALUES('S1','C1',88)
INSERT INTO SC VALUES('S1','C2',78)
INSERT INTO SC VALUES('S2','C1',89)
INSERT INTO SC VALUES('S2','C2',94)
INSERT INTO SC VALUES('S2','C3',83)
INSERT INTO SC VALUES('S3','C1',73)
INSERT INTO SC VALUES('S3','C7',68)
INSERT INTO SC VALUES('S3','C4',88)
INSERT INTO SC VALUES('S3','C5',85)
INSERT INTO SC VALUES('S4','C2',65)
INSERT INTO SC VALUES('S4','C5',90)
INSERT INTO SC VALUES('S4','C6',79)
INSERT INTO SC VALUES('S5','C2',89)
INSERT INTO SC VALUES('S8','C1',78)
INSERT INTO SC VALUES('S10','C1',78)

select sname,YEAR(GETDATE())-AGE birthday from s

--6.2多表查询

--1、在多表查询中，如果要引用不同关系中的同名属性，即用“关系名.属性名”的形式表示。
  --输出所有学生的信息（个人信息：学号，姓名，成绩信息：课程号，成绩）
  select s.sno,sname,cno,grade
  from s,sc
  where s.SNO=sc.sno
--2、连接查询
--（1）内连接
  /*内连接是从两个表的笛卡尔积中，选出符合连接条件的元组。
    SELECT <目标列表达式> [, … n]
    FROM <表1> INNER JOIN <表2>
    ON <连接条件表达式>[, … n]*/
    
  --例：查询每个学生及其选修课程的情况
     select s.SNO,sname,cno,grade
     from s inner join sc
     on s.SNO=sc.sno
     
 --例 查询计算机系学生所选课程的课程号和平均成绩。 
  select cno, AVG(grade) 平均分
  from s inner join sc
  on s.SNO=sc.sno and SDEPT='计算机'
  group by CNO
  
  --等值查询
  select cno, AVG(grade) 平均分
  from s,sc
  where s.SNO=sc.sno and SDEPT='计算机'
  group by CNO
  
  
  --(2)外连接
 --在外连接中，不仅包含那些满足连接条件的元组，而且某些表不满足条件的元组也会出现在结果集中。 

/*（A）左外连接
     左外连接是对连接条件左边的表不加限制。当左边表元组与右边表元组不匹配时，与右边表的相应列值取NULL。
语句格式如下：
    SELECT <目标列表达式>[, … n]
    FROM <表1>LEFT[OUTER]JOIN <表2>[, … n]
    ON <连接条件表达式>*/
    
   -- 例： 查询每个学生及其选修课程的成绩情况（含未选课程的学生信息）
   
   select s.SNO,sname,sc.* 
   from s left join sc
   on s.SNO=sc.sno
   
   /*(B) 右外连接(以右边表格的数据为标准。 )
   右外连接是对连接条件右边的表不加限制。当右边表元组与左边表元组不匹配时，与左边表的相应列值取NULL。
语句格式如下：
	SELECT <目标列表达式>[, … n]
	FROM <表1> RIGHT [OUTER] JOIN <表2>[, … n]
	ON <连接条件表达式> */
	
   select s.SNO,sname,sc.* 
   from s right join sc
   on s.SNO=sc.sno
   
   select s1.*,sc1.* 
   from s1 right join sc1
   on s1.SNO=sc1.sno
   
   --(3) 全外连接（所有数据都显示）
/*全外连接是对连接条件的两个表都不加限制。当一边表元组与另一边表元组不匹配时，
与另一边表的相应列值取NULL。语句格式如下：
SELECT <目标列表达式> [, … n]
FROM <表1> FULL [OUTER] JOIN <表2>[, … n]
ON <连接条件表达式>*/

   select s1.*,sc1.* 
   from s1 full join sc1
   on s1.SNO=sc1.sno
   
   
   --二、子查询（subquery）是指在一个SELECT查询语句中包含另一个SELECT查询语句，
   --即一个SELECT语句嵌入到另一个SELECT语句中。其中，外层的SELECT语句称为父查询或外查询，
   --嵌入内层的SELECT语句称为子查询或内查询。因此，子查询也称为嵌套查询（nested query）。
  
   --1、无关子查询：无关子查询的执行不依赖于父查询
   -- 例：查询与“李小刚”在同一个系的学生学号、姓名和所在系。
   --输出：学生学号、姓名和所在系
   select sno,sname,sdept 
   from s
   where SDEPT =( select sdept from s where SNAME='李小刚'  )
   --单独执行子查询可以直接得到结果的是无关子查询
   
   --数据源：s
   --条件：与"李小刚"在同一个系（子查询）
   select sdept from s where SNAME='李小刚'
   
   --用内连接查询完成此题，s a  s b    a, b别名
    select a.sno,a.sname,a.sdept 
    from  s a join s b 
    on a.SDEPT=b.SDEPT and b.SNAME='李小刚'  --b.SDEPT and b.SNAME='李小刚' 表示李小刚所在的系
    
    
   -- 例:查询选修了“C1”课程的学生的姓名和所在专业。
   select sname,sdept 
   from s 
   where SNO in( select sno from sc  where CNO='c1' ) 
   
      
   --例6.41 查询其它系中比计算机系某一学生年龄小的学生姓名和年龄 
   
   select * 
   from s 
   where AGE < any(
   select age from s where SDEPT='计算机') and SDEPT<>'计算机'
       
      
   
  
   

    
    
   

   

   
   

  select * into s1 from s
  select * into sc1 from sc
  
  
   

  

     
     
     
     
  


select * from sc
select * from s
select * from c