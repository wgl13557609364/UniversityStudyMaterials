--5.2 ���ݿ�ͱ���� 
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
 insert into student(sno,sname,sex,age) values('124','С��','��',35)
 insert into student(sno,sname,sex,age) values('125','С��','��',35)
 insert into student(sno,sname,sex,age) values('126','С��','��',35)
  
 --һ�����ݿ�ķ���͸���
 --�������ݿ�ṹ�޸ģ�DDL���� create��alter��drop 
 
 create database jw --�������ݿ�
 drop database jw  --ɾ�����ݿ⣬Σ������
 drop database jdgl --�����ñ�����ݿ��û�
 
 --��������޸ģ�1���ṹ���޸�create,alter��drop 
                --2�����ݵ��޸� create,alter,delete
      --˵����ǰ�᣺�޸��Ѿ����ڵı�
      
      --1����ṹ���޸�create,alter��drop 
      --��1����ӵ�ַ�У�addr nchar(100)
      alter table student add addr nchar(100)
      --��2��ɾ���� addr
      alter table student drop column addr
      --��3���޸��� sname   nchar(20) �ĳ� nvarchar(200)
      alter table student   alter column sname nvarchar(200)
      --��4��Լ������������������������������Լ��
      --��������Լ����������Ψһ�ġ�
      alter table student add constraint PK_student primary key(sno)
      --�����Ա��Լ��
      alter table student add constraint student_sex check(sex='��' or sex='Ů')
      --���������Լ��
      alter table student add constraint student_age check(age>0 and age<150)
      --��5��ɾ���� 
      drop table student
      
      --2���������ݵ��޸�
      --����
      insert into student(sno,sname) values('127','С��')
      insert into student(sno,sname) values('128','С��')
      insert into student(sno,sname) values('129','С��')
      insert into student(sno,sname) values('130','С��')
      insert into student(sno,sname) values('131','С��')
      
     --��ѯ select * from student
      select * from student
      
     --�޸ģ���ѧ��Ϊ��127��ͬѧ���� С���� 
     update  student set sname='xiaomingming' where sno='127'
     --����һ��Σ�����ע�����Ƶ�����
     
     --ɾ�������������ã�delete    �ṹ��drop
     --ɾ��ѧ��Ϊ��129 ѧ����������Ϣ         
     delete from student  where sno='129'     
     --����һ��Σ�����ע�����Ƶ�����
    
   --�ġ����ݱ�ı���
     --���ݱ�student���������ݱ��ݵ���stu110
    select * into stu110 from student    
    select * into student from stu110 
   
     
     
      select * from student
      select * from stu110
 





