/* ������  ���ݿ�
 ѧ����ϵ   S(SNO,SNAME,AGE,SEX,SDEPT)
 �ɼ���ϵ   SC(SNO,CNO,GRADE)  
 �γ̹�ϵ   C(CNO,CNAME,TEACHER) */
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
	SEX CHAR(2) CHECK(SEX='��' OR SEX='Ů')  DEFAULT('��'),
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

INSERT INTO  s VALUES('S1','��ʤ��','Ů','��',23,'�����')
INSERT INTO  s VALUES('S2','ۢ����','Ů','��',20,'�����')
INSERT INTO  s VALUES('S3','���','Ů','��',20,'���繤��')
INSERT INTO  s VALUES('S4','����','Ů','��',21,'���繤��')
INSERT INTO  s VALUES('S5','������','Ů','��',22,'������Ϣ')
INSERT INTO  s VALUES('S6','������','��','��',19,'������Ϣ')
INSERT INTO  s VALUES('S8','����','��','��',18,'��������')
INSERT INTO  s VALUES('S9','ǿ��','��','��',19,'��������')
INSERT INTO  s VALUES('S10','С��','��','��',19,'��������')
INSERT INTO  s VALUES('S11','Сٻ','Ů','��',19,'�����')
INSERT INTO  s VALUES('S12','��С��','Ů','׳',20,'�����')
INSERT INTO  s VALUES('S13','��С��','Ů','����',20,'�����')

GO
INSERT INTO c VALUES('C1','C����','��ɽ')
INSERT INTO c VALUES('C2','��ɢ��ѧ','�����')
INSERT INTO c VALUES('C3','����ϵͳ','����')
INSERT INTO c VALUES('C4','���ݽṹ','����')
INSERT INTO c VALUES('C5','���ݿ�','����')
INSERT INTO c VALUES('C7','��Ϣ����','����')
INSERT INTO c VALUES('C8','Ӣ��','���')
INSERT INTO c VALUES('C9','��������ԭ��','һ�ƴ�ʦ')
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


--8.1 �洢����
   ��Ҫ����
 �洢���̸��� 
 �����洢���� 
 ���ô洢���� 
 ����洢���� 
 

create proc p_sex
@sex char(2)
as
select * from s
where SEX=@sex

exec p_sex Ů
--һ��ϵͳ�洢����
---��  �鿴���ݿ����������Ϣ
 sp_helpfile   --�鿴���ݿ�Ķ������
 sp_databases;  --�鿴���ݿ�����     
 sp_tables;      --�鿴��     
 sp_columns s; --�鿴�����
 
 --�� �ڶ����sys.objects�в�ѯ���ݿ�JXGL�����д洢���̡�       USE JXGL
  select * from sys.objects where type = 'P';
 --��  �ڽ�ѧ�������ݿ��У���ʾ��S���������Ϣ��
   sp_depends @objname = 'S' 
   
   
   --���������͵��ô洢����
   
  /* �洢���̶���
CREATE PROCDURE|PROC<�洢������>[;n]
      [<@�β���> <��������1>[, �� n]
[<@�����> <��������2>[OUTPUT][, �� n]
      [FOR REPLICATION]
    AS
<T-SQL���>|<����>
<@�β���>�������еĲ����� 
<@�����>��ָ����Ϊ�������֧�ֵĽ������
FOR REPLICATION��ʹ�ø�ѡ����Ĵ洢���̿������洢���̵�ɸѡ������ֻ���ڸ��ƹ�����ִ�С� */

--1�����������Ĵ洢����
 --������ͳ������
 create proc p_count
 as
 select nation,COUNT(nation)  ���� from s
 group by nation 
 
 exec p_count
 
 --2���������Ĵ洢����
 
 --��:���ý�ѧ�������ݿ����������������һ���洢����PS_GRADE�����ָ��ѧ�����������γ����ơ��ɼ���Ϣ
 create proc ps_grade
 @sname char(9)
 as
 select sname,cname,grade from s,SC,C
 where s.SNO=sc.SNO and c.CNO=sc.CNO and SNAME=@sname
 
 exec ps_grade ��ʤ��


--����һ���������Ĵ洢���̡�Insert_S�����������S���һ����Ԫ�顣

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

--�β�֮���ö��Ÿ��������һ���ββ��÷���

exec insert_s s50,С��1,��,��,18,�����
exec insert_s s51,С��2,��,��,18,�����
exec insert_s s52,С��3,��,��,18,�����
exec insert_s s53,С��4,��,��,18,�����
exec insert_s s54,С��5,��,��,18,�����
exec insert_s s55,С��6,��,��,18,�����

--3������������Ĵ洢���̣� OUTPUT����ָ������Ϊ�������

���ý�ѧ�������ݿ����������������һ���洢����PV_GRADE��
����һ��ѧ�������������ѧ������ѡ�޿γ̵�ƽ���ɼ���

select sname, AVG(grade) ƽ���� from  s,SC 
where s.SNO=sc.SNO and SNAME='��ʤ��'
group by sname


create proc p_avg
@sname char(9),--������β�
@s_avg real output --����õ��Ĳ���
as
select @s_avg=AVG(grade)  from s,SC
where s.SNO=sc.SNO and SNAME=@sname 

--����
declare  @s_avg real
exec p_avg ��ʤ��,@s_avg output
print '��ʤ���ƽ���ɼ�Ϊ:'+ str(@s_avg)



--��������洢���� 
--1���洢���̵��޸� Alter

 Alter proc insert_s
	@sno char(4),
	@sname char(9),
	@sex char(2)	
as
insert into  s(SNO,SNAME,sex) values(@sno,@sname,@sex)

--�洢���̵�ɾ�� drop 

drop proc p_avg


--��5 ʹ�ô���ͨ��������ļ򵥹��̡�

create PROCEDURE p_grade   
 @sno char(4)='s1%' --���������⣬���˼��
AS
sELECT S.SNO,SNAME,CNAME,GRADE 
FROM S,sc,c 
where S.SNO=SC.SNO AND  SC.CNO=C.CNO
and S.SNO = @sno 


exec p_grade s5  --�н��
  





 
select * from s