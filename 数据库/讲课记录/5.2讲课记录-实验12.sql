--5.2 数据库和表操作 
create database jdgl
go
use jdgl
go
 create table student
 ( sno nchar(3) not null,
   sname nchar(50),
   sex nchar(2) ,
   age int
 )
 
 go 
 insert into student(sno,sname,sex,age) values('124','小明','男',35)
 insert into student(sno,sname,sex,age) values('125','小明','男',35)
 insert into student(sno,sname,sex,age) values('126','小明','男',35)
  
 --一、数据库的分离和附加
 --二、数据库结构修改（DDL）： create，alter，drop 
 
 create database jw --建立数据库
 drop database jw  --删除数据库，危险命令
 drop database jdgl --必须用别的数据库用户
 
 --三、表的修改：1、结构的修改create,alter，drop 
                --2、数据的修改 create,alter,delete
      --说明：前提：修改已经存在的表
      
      --1、表结构的修改create,alter，drop 
      --（1）添加地址列：addr nchar(100)
      alter table student add addr nchar(100)
      --（2）删除列 addr
      alter table student drop column addr
      --（3）修改列 sname   nchar(20) 改成 nvarchar(200)
      alter table student   alter column sname nvarchar(200)
      --（4）约束：主键，“外键”和其他数据项的约束
      --增加主键约束，主键是唯一的。
      alter table student add constraint PK_student primary key(sno)
      --增加性别的约束
      alter table student add constraint student_sex check(sex='男' or sex='女')
      --增加年龄的约束
      alter table student add constraint student_age check(age>0 and age<150)
      --（5）删除表 
      drop table student
      
      --2、表内数据的修改
      --增加
      insert into student(sno,sname) values('127','小明')
      insert into student(sno,sname) values('128','小明')
      insert into student(sno,sname) values('129','小明')
      insert into student(sno,sname) values('130','小明')
      insert into student(sno,sname) values('131','小明')
      
     --查询 select * from student
      select * from student
      
     --修改：把学号为：127的同学改名 小明明 
     update  student set sname='xiaomingming' where sno='127'
     --这是一个危险命令，注意限制的条件
     
     --删除：表内数据用：delete    结构用drop
     --删除学号为：129 学生的所有信息         
     delete from student  where sno='129'     
     --这是一个危险命令，注意限制的条件
    
   --四、数据表的备份
     --备份表student的所有数据备份到表stu110
    select * into stu110 from student    
    select * into student from stu110 
   
     
     
      select * from student
      select * from stu110
 





