
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
create database jdgl
--2、选择数据库
use jdgl
--3、查看数据库的信息
exec sp_helpdb
--4、创建表

--语法：
/*create table 名字
 (
 列1 数据类型（长度） 约束,
 列2 数据类型（长度） 约束
 
  )*/
 create table student1
 ( sno nchar(3) not null,
   sname nchar(50),
   sex nchar(2) check(sex='男' or sex='女'),
   age int check(age>0 and age<=150)
 )
 
 --5、数据的录入
 insert into student1(sno,sname,sex,age) values('124','小明','男',35)
 insert into student1(sno,sname,sex,age) values('124','小明','男',35)
 insert into student1(sno,sname,sex,age) values('124','小明','男',35)
  





