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


--8.1 存储过程
   主要内容
 存储过程概述 
 创建存储过程 
 调用存储过程 
 管理存储过程 
 

create proc p_sex
@sex char(2)
as
select * from s
where SEX=@sex

exec p_sex 女
--一、系统存储过程
---例  查看数据库对象的相关信息
 sp_helpfile   --查看数据库的定义情况
 sp_databases;  --查看数据库数量     
 sp_tables;      --查看表     
 sp_columns s; --查看表的列
 
 --例 在对象表sys.objects中查询数据库JXGL的所有存储过程。       USE JXGL
  select * from sys.objects where type = 'P';
 --例  在教学管理数据库中，显示表S的相关性信息。
   sp_depends @objname = 'S' 
   
   
   --二、创建和调用存储过程
   
  /* 存储过程定义
CREATE PROCDURE|PROC<存储过程名>[;n]
      [<@形参名> <数据类型1>[, … n]
[<@变参名> <数据类型2>[OUTPUT][, … n]
      [FOR REPLICATION]
    AS
<T-SQL语句>|<语句块>
<@形参名>：过程中的参数。 
<@变参名>：指定作为输出参数支持的结果集。
FOR REPLICATION：使用该选项创建的存储过程可用作存储过程的筛选器，且只能在复制过程中执行。 */

--1、不带参数的存储过程
 --按民族统计人数
 create proc p_count
 as
 select nation,COUNT(nation)  人数 from s
 group by nation 
 
 exec p_count
 
 --2、带参数的存储过程
 
 --例:利用教学管理数据库的三个基本表，创建一个存储过程PS_GRADE，输出指定学生的姓名及课程名称、成绩信息
 create proc ps_grade
 @sname char(9)
 as
 select sname,cname,grade from s,SC,C
 where s.SNO=sc.SNO and c.CNO=sc.CNO and SNAME=@sname
 
 exec ps_grade 雷胜珍


--创建一个带参数的存储过程“Insert_S”，用于向表S添加一个新元组。

if exists(select name  from sysobjects 
     where name='insert_s' and type='p')
     drop procedure insert_s
     go
create proc insert_s
	@sno char(4),
	@sname char(9),
	@sex char(2),
	@nation char(10),
	@age int,
	@sdept char(20)
as
insert into  s values(@sno,@sname,@sex,@nation,@age,@sdept)

--形参之间用逗号隔开，最后一个形参不用符号

exec insert_s s50,小明1,男,汉,18,计算机
exec insert_s s51,小明2,男,汉,18,计算机
exec insert_s s52,小明3,男,汉,18,计算机
exec insert_s s53,小明4,男,汉,18,计算机
exec insert_s s54,小明5,男,汉,18,计算机
exec insert_s s55,小明6,男,汉,18,计算机

--3、带输出参数的存储过程， OUTPUT用于指明参数为输出参数

利用教学管理数据库的三个基本表，创建一个存储过程PV_GRADE，
输入一个学生姓名，输出该学生所有选修课程的平均成绩。

select sname, AVG(grade) 平均分 from  s,SC 
where s.SNO=sc.SNO and SNAME='雷胜珍'
group by sname


create proc p_avg
@sname char(9),--输入的形参
@s_avg real output --输出用到的参数
as
select @s_avg=AVG(grade)  from s,SC
where s.SNO=sc.SNO and SNAME=@sname 

--调用
declare  @s_avg real
exec p_avg 雷胜珍,@s_avg output
print '雷胜珍的平均成绩为:'+ str(@s_avg)



--三、管理存储过程 
--1、存储过程的修改 Alter

 Alter proc insert_s
	@sno char(4),
	@sname char(9),
	@sex char(2)	
as
insert into  s(SNO,SNAME,sex) values(@sno,@sname,@sex)

--存储过程的删除 drop 

drop proc p_avg


--例5 使用带有通配符参数的简单过程。

create PROCEDURE p_grade   
 @sno char(4)='s1%' --这里有问题，大家思考
AS
sELECT S.SNO,SNAME,CNAME,GRADE 
FROM S,sc,c 
where S.SNO=SC.SNO AND  SC.CNO=C.CNO
and S.SNO = @sno 


exec p_grade s5  --有结果
  





 
select * from s