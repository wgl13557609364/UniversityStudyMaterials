create database jdgl
go
use jdgl
go
 create table student
 ( sno nchar(3) not null,
   sname nchar(50),
   sex nchar(2)  check(sex='男' or sex='女') ,
   age int check(age>0 and age<150),
   addr nchar(100),
   primary key(sno)
 )
 
 /*--修改的前提：在已有的表格上修改
 语法：ALTER  TABLE tableName 
   ADD|ALTER COLUMN|DROP COLUMN 字段名 
  --1、增加列 地址 addr
  alter table student add addr nchar(100)
  --2、删除列 addr
  alter table student  DROP COLUMN addr
  --3、修改sname de 数据类型以及长度
  alter table student ALTER COLUMN sname char(200)
  --4、性别约束，男或女
  alter table student 
  add constraint  stu_sex
  check(sex='男' or sex='女')  
  
  --5、增加主键约束
  alter table student 
  add constraint  stu_PK
  primary key(sno)
  */
  
  --三、简单查询
   select * from student 
   where sname='小强'
   
   --四、表数据的修改：增加、修改，删除
   --增加
   insert into student(sno,sname) values('127','小花')
   insert into student(sno,sname) values('128','小花')
   insert into student(sno,sname) values('129','小花')
   --改： 127  小花  改成 小花花
   update  student set sname='小花花' 
   where sno='127' --（危险命令，注意条件）
   
   --删除：删除学号为129 同学的信息
   delete from student  
   where sno='129' --（危险命令，注意条件）
   
   --五、数据表的备份
     
     select *  into stu110   from student  --把student的所有数据备份到stu110
     
     select *  into stu119   from student
     where sex='男'
   
  
  
  select * from stu119
  select * from student 
  
 
  
  

 
 
 
 
 
 
go 
 insert into student(sno,sname,sex,age) values('124','小强','男',35)
 insert into student(sno,sname,sex,age) values('124','小青','女',35)
 insert into student(sno,sname,sex,age) values('124','小王','男',35)
 
 exec sp_helpdb 
 exec sp_help 
--一、数据库结构的修改：create，alter，drop 
create database jdgl --创建  
--alter database jdgl   --修改
drop database jdgl --删除数据库jdgl

--二、表结构修改








