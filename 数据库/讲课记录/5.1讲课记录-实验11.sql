
--����1������Ҽ�
--1���½����ݿ� jwgl
--2���½���student  snoѧ��  not null, sname����,sex�Ա�age����
--3��¼����Ϣ������Ҽ�
--4����ѯ������Ҽ�

--����2����д����
/*��ʹ��T_SQL���ע�����
	1������ִ�У�F5�����������Ctrl+F5��
	2��������ȫӢ��״̬��������롣
	3���ַ������õ����ţ����֮���ö��Ÿ�����
	4��ִ�д��벻����Ӣ�Ĵ�Сд��
	5��-- ����ע�ͣ�/*    */����ע��
	6���кź��������ã�����->ѡ��������ı��༭����
*/
--1���������ݿ�
create database www
go

--2��ѡ�����ݿ�
--�﷨��use ���ݿ������
use www
go

--3��������

--�﷨��
/*create table ����
 (
 ��1 �������ͣ����ȣ� Լ����check������,
 ��2 �������ͣ����ȣ� Լ��
 
  )*/
  
  create table student
  (
   sno nchar(3) not null check(len(sno)=3),
   sname nchar(50),
   sex nchar(2) check(sex='��' or sex='Ů'),
   age int check(age >0 and age<150),
   primary key(sno)
  )
 
 
 --5�����ݵ�¼��
 
-- insert into ����1����2��.....��  values(��1����2��....)
insert into student(sno,sname,sex,age)  values('131','Сǿ','��',18)
insert into student(sno,sname,sex,age)  values('132','С��','��',18)
insert into student(sno,sname,sex,age)  values('133','С��','Ů',18)
insert into student(sno,sname,sex,age)  values('134','С��','Ů',18)
insert into student(sno,sname,sex,age)  values('135','С��','��',18)

--6�����ݵĲ�ѯ

select *from student

 





