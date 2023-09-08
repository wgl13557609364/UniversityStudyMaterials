
--方法1：鼠标右键
--1、新建数据库 jwgl
--2、新建表student  sno学号  not null, sname姓名,sex性别，age年龄
--3、录入信息，鼠标右键
--4、查询，鼠标右键

--方法2：书写代码
/*、使用T_SQL语句注意事项：
	1、代码执行：F5，代码分析：Ctrl+F5。
	2、必须在全英文状态下输入代码。
	3、字符串：用单引号，语句之间用逗号隔开。
	4、执行代码不区分英文大小写。
	5、-- 单行注释，/*    */多行注释
	6、行号和字体设置（工具->选项：环境和文本编辑器）
*/
--1、建立数据库
create database www
go

--2、选择数据库
--语法：use 数据库的名字
use www
go

--3、创建表

--语法：
/*create table 名字
 (
 列1 数据类型（长度） 约束（check（））,
 列2 数据类型（长度） 约束
 
  )*/
  
  create table student
  (
   sno nchar(3) not null check(len(sno)=3),
   sname nchar(50),
   sex nchar(2) check(sex='男' or sex='女'),
   age int check(age >0 and age<150),
   primary key(sno)
  )
 
 
 --5、数据的录入
 
-- insert into 表（列1，列2，.....）  values(列1，列2，....)
insert into student(sno,sname,sex,age)  values('131','小强','男',18)
insert into student(sno,sname,sex,age)  values('132','小明','男',18)
insert into student(sno,sname,sex,age)  values('133','小青','女',18)
insert into student(sno,sname,sex,age)  values('134','小花','女',18)
insert into student(sno,sname,sex,age)  values('135','小狗','男',18)

--6、数据的查询

select *from student

 





