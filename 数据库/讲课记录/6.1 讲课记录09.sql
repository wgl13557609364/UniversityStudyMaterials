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


--6.1 数据查询
--一、简单查询
--1、查询指定列
--例：查询全体学生的学号与姓名
select sno,sname from s 
--2、查询全部列  
select * from s

select top 3 * from s --top n 标识显示前n个元祖

--3、查询经过计算的值  
--例 查询全体学生的姓名及其出生年份

--getdate()获取当前系统时间
 select GETDATE() 
 select YEAR(GETDATE()) --输出年
 
 select sname,YEAR(GETDATE())-age 出生年份 from s
 --别名的使用，有三种方式
 --（1）sname 姓名   建议用这种方法
 --（2）sname as 姓名
 --（3）姓名=sname
 
select sno 学号,sname 姓名,sex 性别 from s

--4、带有WHERE子句的查询
/*比较大小 (比较运算符 )
WHERE子句由比较运算符构成。 

例 查询考试成绩有不及格的学生的学号。*/
select DISTINCT sno from SC 
where GRADE <60
--DISTINCT 表示隐藏重复的元组
--常见的比较运算符：> < =,>=,<=,!=(不等于) <>（不等于）
 
 --5、确定范围（BETWEEN…AND…(闭区间)和NOT BETWEEN…AND（开区间））
 --例 查询年龄在20～23岁（包括20岁和23岁）之间的学生的姓名、系别和年龄。 
 select sname,sdept,age 
 from s
 where AGE between 20 and 23 
 
  select sname,sdept,age 
 from s
 where AGE >=20 and AGE<= 23 
 
 --6、确定集合(IN ,NOT IN) 
--运算符IN可以用来查找属性值属于指定集合的元组。
--例 查询计算机系、电子信息系和物流管理系学生的姓名和性别。
select sname,sex,sdept
from s
where SDEPT  in('计算机','电子信息','物流管理') 

select sname,sex,sdept
from s
where SDEPT ='计算机' or SDEPT ='电子信息' or SDEPT ='物流管理' 

--7、字符匹配(  like, not like ) 模糊搜索
--例 查询所有姓李的学生的姓名、学号和性别。  
select sno,sname,sex
from s
where  SNAME like '李%'   --% 表示任意字符串 


--例 查询姓“李”且全名至多为3个汉字的学生的姓名。
select sno,sname,sex
from s
where  SNAME like '李__'  -- _表示一个字符

--8、涉及空值的查询例（NULL 或NOT NULL）
--例 查询缺少成绩的学生的学号和相应的课程号。

 select sno,cno 
 from sc
 where GRADE is null  --“is” 不能用“=”代替 
 
 select sno,cno 
 from sc
 where GRADE = null --（这种写法是错误的，切记！）
--9、多重条件查询（AND和OR）
--可用逻辑运算符AND和OR来联结多个查询条件。AND的优先级高于OR，但可以用括号改变优先级。

--例 查询计算机系年龄在22岁以下的学生姓名。
select sname
from s
where SDEPT='计算机' and AGE <22

--10、ORDER BY（排序） 默认升序（ASC）或降序（DESC）
--例 查询选修了课程号为“C1”课程的学生的学号及其成绩，查询结果按分数的降序排列。
select sno,grade 
from SC
where CNO='c1'
order by GRADE desc

select sname,sex,sdept
from s
where SDEPT  in('计算机','电子信息','物流管理') 
order by sdept


--10、GROUP BY（分组）
--例：按性别进行分类
  select sex,COUNT(sex) 
  from s
  group by sex
  
  --按专业进行分类并统计各专业人数
  select sdept,COUNT(sdept) 人数
  from s
  group by sdept

 --按“民族”分类并统计各民族的人数
 select nation,COUNT(nation) 人数
 from s
 group by nation 
 
 --例 查询选修每门课程的课程号及参加该门课程考试的学生总人数
 select cno,COUNT(cno) 人数
 from SC
 where grade is not null
 group by cno
 
--11、在查询中，如果是先分组，后统计的，用HAVING子句进行查询
----按“民族”分类，输出人数超过3人的民族
select nation,COUNT(*) 人数
from s
group by nation
having COUNT(*)>3    --本题用where来处理是否可行？

--12、查询结果集输出到新建表中 

select * into man1 from s
where sex='男' and age>=18

select * into  R1 from s



--13 集合并运算
--例：合并s1和r1,删除重复数据保存到 newS

select * into newS from
(select * from s1
union 
select * from r1)
s

select * from news

--14、集合交运算
--例 查询既选修了“C1”号课程又选修了“C2”号课程的学生的学号。     
     SELECT SNO  FROM SC WHERE CNO='C1'
     INTERSECT
     SELECT SNO  FROM SC WHERE CNO='C2'
     
     --将结果集保存到newC
     select * 
     into newC 
     from( 
     SELECT SNO  FROM SC WHERE CNO='C1'
     INTERSECT
     SELECT SNO  FROM SC WHERE CNO='C2') k
    
     select * from newC

--15、集合差运算

  --例  查询选修了“C1”号课程但没有选修“C3”号课程的学生的学号。
     
     SELECT SNO FROM SC WHERE CNO='C1'
     EXCEPT
     SELECT SNO FROM SC WHERE CNO='C3'
     
      --将结果集保存到newSC
     select * 
     into newSC 
     from( 
     SELECT SNO FROM SC WHERE CNO='C1'
     EXCEPT
     SELECT SNO FROM SC WHERE CNO='C3') a
  


 
select * from s
select * from C
select * from sc