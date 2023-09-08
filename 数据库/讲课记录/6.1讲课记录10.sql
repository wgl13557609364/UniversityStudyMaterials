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


--6.1数据的简单查询

/*SELECT语句的功能非常强大，其选项也非常丰富。
SELECT [ALL|DISTINCT][TOP n[PERCENT]]<目标列表达式>[, … n]    [INTO <新表名>]
FROM <表名>|<视图名>[, … n]
[WHERE <条件表达式>]
[GROUP BY <列名l>
[HAVING <条件表达式>]]
[ORDER BY <列名2>[ASC|DESC]]；  */

--找输出，找数据源，看条件，写代码

--1、查询指定列   
--例 查询全体学生的学号与姓名
select sno,sname from s

--2、查询全部列  
--例 查询全体学生的详细记录。 
select *from s

--3、查询经过计算的值 
--例 查询全体学生的姓名及其出生年份。
--获取系统时间：getdate（）
select GETDATE()
--获取年份
select YEAR(GETDATE())
select sname,YEAR(GETDATE())-age 出生年份 from s

--别名常用方式：
--（1）sno 学号
--（2）sno as 学号
--（3）学号=sno

select sno 学号,sname 姓名,sex 性别,nation 民族,age 年龄,sdept 系 from s

--带有WHERE子句的查询

--4、比较大小 (比较运算符 )  >,<,=,>=,<=,<>,!=

--例 查询考试成绩有不及格的学生的学号。
select Sno,grade 
from SC
where  GRADE <60

--5、 确定范围（BETWEEN…AND…（闭区间）和NOT BETWEEN…AND（开区间））

--例 查询年龄在20～23岁（包括20岁和23岁）之间的学生的姓名、系别和年龄
select sname,sdept,age 
from s
where  AGE  between 20 and 23

select sname,sdept,age 
from s
where AGE >=20 and AGE <=23

--6、确定集合(IN ,NOT IN)
--例 查询计算机系、电子信息系和物流管理系学生的姓名和性别。 

select sno,sex,sdept 
from s
where SDEPT  in('计算机','电子信息','物流管理')

select sno,sex,sdept 
from s
where SDEPT='计算机' or SDEPT='电子信息' or SDEPT='物流管理'

--7、字符匹配(  like, not like )  % 代表任意字符串  _ 代表一个字符

--例 查询所有姓李的学生的姓名、学号和性别。
select sno,sname,sex 
from s
where SNAME like '李%'     

--例 查询姓“李”且全名至多为3个汉字的学生的姓名。     
select sno,sname,sex 
from s
where SNAME like '李__'  


--8、涉及空值的查询例（NULL 或NOT NULL）(重点注意)
--例 查询缺少成绩的学生的学号和相应的课程号。

select sno,cno,grade
from SC
where GRADE is  null -- 不能用于=

--9、多重条件查询（AND和OR）

--例 查询计算机系年龄在22岁以下的学生姓名。 

select sname,SDEPT,age
from s
where SDEPT='计算机' and age<22

--10、ORDER BY（排序） asc（升序,默认） desc（降序）
--例 查询选修了课程号为“C1”课程的学生的学号及其成绩，查询结果按分数的降序排列。
select sno,grade 
from SC
where CNO='c1'
order by GRADE desc
 
select sno,sex,sdept 
from s
where SDEPT  in('计算机','电子信息','物流管理')
order by SDEPT asc

--11、GROUP BY（分类） 
--(1)统计本班男女生的人数（s表）
select sex,COUNT(sex) 人数 
from s
group by sex

--(2)统计本班各民族的人数（s表）
select nation,COUNT(*) 人数
from s
group by nation

--(3)统计本班各民族人数超过3人的民族
select nation,COUNT(*) 人数
from s
group by nation
having COUNT(*)>3  --先分组，后判断的时候，用group by ... having

--12、输出前n行 top n
--例 从SC表中输出学习“C1”课程的成绩前3名学生的学号和成绩。

select top 3 sno,grade 
from SC
where CNO='c1'
order by GRADE desc

--13、查询结果集输出到新建表中（into）。  --DISTINCT 隐藏重复的元祖
 --例  将表SC中所有成绩不及格学生的学号都存入NPASS表中。
 select DISTINCT sno into NPASS from SC
 where GRADE<60
 
 select *from npass
 
 select * from sc
 
 
 --14、并集查询
 
 CREATE TABLE    R
(
A CHAR (2),
B CHAR (2),
C CHAR (2)
)
go
CREATE TABLE   W
(
A CHAR (2),
B CHAR (2),
C CHAR (2)
)

INSERT INTO R VALUES('a','b','c')
INSERT INTO R VALUES('d','a','f')
INSERT INTO R VALUES('c','b','d')
INSERT INTO w VALUES('b','g','a')
INSERT INTO w VALUES('d','a','f')
INSERT INTO w VALUES('b','g','a')

select * into newT from 
(select * from R
union 
select * from w)a

select *from newt
 
--15、交运算
--例 查询既选修了“C1”课程又选修了“C2”课程的学生的学号。
select  sno from SC  where CNO='c1'
intersect
select  sno from SC  where CNO='c2'

select * into newi from 
(select  sno from SC  where CNO='c1'
intersect
select  sno from SC  where CNO='c2') a

--16、差运算
--例 查询选修了“C1”课程但没有选修“C3”课程的学生的学号。     
     SELECT SNO FROM SC WHERE CNO='C1'
     EXCEPT
     SELECT SNO FROM SC WHERE CNO='C3'


select * from sc



















select *from s
select *from C
select *from sc