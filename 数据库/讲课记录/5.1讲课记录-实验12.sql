
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
create database jdgl
--2��ѡ�����ݿ�
use jdgl
--3���鿴���ݿ����Ϣ
exec sp_helpdb
--4��������

--�﷨��
/*create table ����
 (
 ��1 �������ͣ����ȣ� Լ��,
 ��2 �������ͣ����ȣ� Լ��
 
  )*/
 create table student1
 ( sno nchar(3) not null,
   sname nchar(50),
   sex nchar(2) check(sex='��' or sex='Ů'),
   age int check(age>0 and age<=150)
 )
 
 --5�����ݵ�¼��
 insert into student1(sno,sname,sex,age) values('124','С��','��',35)
 insert into student1(sno,sname,sex,age) values('124','С��','��',35)
 insert into student1(sno,sname,sex,age) values('124','С��','��',35)
  





