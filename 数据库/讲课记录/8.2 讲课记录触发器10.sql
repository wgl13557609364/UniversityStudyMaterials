/* 第八章  数据库
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
               on update cascade on delete cascade 
)
GO

CREATE TABLE C
(
	CNO CHAR(4) NOT NULL PRIMARY KEY,
	CNAME CHAR(20),
	TEACHER CHAR(20)
)
go

create table classes
(
Sdept CHAR(20),
amount int
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

--8.2 触发器
--一、DML  数据库操纵语言  insert update delete 对表的数据进行操作

--例：当学生表的数据发生变化时，发出提示信息

CREATE TRIGGER T_CHANGE
ON S
FOR INSERT,UPDATE,DELETE
AS
PRINT '学生表信息发生变化'


--  1、 After触发器
      -- After触发器要求只有执行某一操作insert、update、delete之后触发器才被触发，且只能定义在表上，包括以下三种类型的触发器：
     --1）insert触发器     2）update触发器      3）delete触发器 
     
    --按专业统计新生的报到人数
    --1、学生表 s  统计信息 classes
      select *from classes
     
      --初始化表格统计表
      insert into classes
      select sdept,COUNT(sdept)  from s
      group by sdept
      
      --触发器
      create trigger t_count
      on s
      after insert --after 等价于 for
      as
      update classes set amount=amount+1
      where sdept =(select sdept from inserted)
      --FOR = AFTER 相同,操作后AFTER 指定触发器仅在触发 SQL 语句中指定的所有操作都已成功执行时才被触发
   
      
       select *from classes --前
       insert into s(SNO,sdept) values('s57','机电工程') --这行代码执行完之后触发触发器
       select *from classes --后
       
       --2、INSTEAD OF 触发器，  INSTEAD OF 触发器触发时只执行触发器内部的SQL语句
       
        CREATE TRIGGER T_WAKE
		ON S
		INSTEAD OF  INSERT
		AS
		PRINT '检测到正有数据录入！'
		
		insert into s(SNO,sdept) values('s58','计算机')
		/*–当录入数据时，触发器仅执行本身的SQL语句，因触发器本身没有INSERT语句，
		所以 S表的数据不会发生变化*/
        --例：向s表中插入数据时，检查学号是否已存在，如存在则不允许插入。
         create trigger check1
         on s
         instead of insert
         as 
           if exists(select *from s where SNO=(select SNO from inserted)) --是否存在学号           
           begin
              rollback transaction --撤销一个事务
              print '学生的学号已经存在，不能重复输入'           
           end
           else
           begin
              insert into s select * from inserted
              print '学生输入成功！' 
           end
           
           insert into s(SNO,sdept) values('s58','计算机')  
           
        --问题：
       ---解决专业人数自动统计的问题：当向学生信息表(s)中删除一条学生信息时，
       ---自动更新专业人数（classes）。   
        
        --delete    s->deleted
        create trigger del_s
        on s
        for delete   --for 等价after
        as
        update classes set amount=amount-1
        where sdept =(select sdept from deleted)        
        
       select *from classes --前
       delete from s where SNO='s58' --这行代码执行完之后触发触发器
       select *from classes --后
       
       
       --问题：禁止修改学生信息表(s)中“学号”等重要的字段，其它字段可修改。
       create trigger up_s
       on s
       for update
       as
       if(UPDATE(sno))
       begin
           rollback transaction --撤销修改学号的操作
           print '禁止修改学号'
       end
       else
       begin
         print '信息修改成功！'
       end
       
       --修改学号，触发器保护，修改失败
       update s set SNO='s100'    where SNO='s10'  
       
       --修改姓名等信息，触发器不保护，可以修改
       update s set SName='小小米哥'   where SNO='s10' 
       
       
      
      
-- 二、DDL触发器   数据库定义语言（ create  alter  drop）   
---作用：对数据库，表，视图，存储过程，触发器等结构操作

CREATE TRIGGER trigger_name
 ON ｛ALL SERVER|DATABASE｝
FOR {EVENT_TYPE}
 AS 
  T-SQL语句
  
  
-- 问题：禁止删除和修改学生信息表(s)。
	CREATE TRIGGER DDL_DEL
	ON DATABASE
	FOR  ALTER_TABLE,DROP_TABLE
	AS 
	PRINT '严重警告：此为系统数据表不能删除！'
	ROLLBACK transaction --撤销所有修改，删除操作

   drop table sc
   
    --触发器的修改 alter
    alter TRIGGER DDL_DEL
	ON DATABASE
	FOR  DROP_TABLE
	AS 
	PRINT '严重警告：此为系统数据表不能删除！'
	ROLLBACK transaction
	
	--触发器的删除 drop trigger 名字  
    drop trigger up_s
  

        
         
           
           
           
           

select * from s
select * from sc
