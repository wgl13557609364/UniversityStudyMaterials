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


--6.1���ݵļ򵥲�ѯ

/*SELECT���Ĺ��ܷǳ�ǿ����ѡ��Ҳ�ǳ��ḻ��
SELECT [ALL|DISTINCT][TOP n[PERCENT]]<Ŀ���б��ʽ>[, �� n]    [INTO <�±���>]
FROM <����>|<��ͼ��>[, �� n]
[WHERE <�������ʽ>]
[GROUP BY <����l>
[HAVING <�������ʽ>]]
[ORDER BY <����2>[ASC|DESC]]��  */

--�������������Դ����������д����

--1����ѯָ����   
--�� ��ѯȫ��ѧ����ѧ��������
select sno,sname from s

--2����ѯȫ����  
--�� ��ѯȫ��ѧ������ϸ��¼�� 
select *from s

--3����ѯ���������ֵ 
--�� ��ѯȫ��ѧ�����������������ݡ�
--��ȡϵͳʱ�䣺getdate����
select GETDATE()
--��ȡ���
select YEAR(GETDATE())
select sname,YEAR(GETDATE())-age ������� from s

--�������÷�ʽ��
--��1��sno ѧ��
--��2��sno as ѧ��
--��3��ѧ��=sno

select sno ѧ��,sname ����,sex �Ա�,nation ����,age ����,sdept ϵ from s

--����WHERE�Ӿ�Ĳ�ѯ

--4���Ƚϴ�С (�Ƚ������ )  >,<,=,>=,<=,<>,!=

--�� ��ѯ���Գɼ��в������ѧ����ѧ�š�
select Sno,grade 
from SC
where  GRADE <60

--5�� ȷ����Χ��BETWEEN��AND���������䣩��NOT BETWEEN��AND�������䣩��

--�� ��ѯ������20��23�꣨����20���23�֮꣩���ѧ����������ϵ�������
select sname,sdept,age 
from s
where  AGE  between 20 and 23

select sname,sdept,age 
from s
where AGE >=20 and AGE <=23

--6��ȷ������(IN ,NOT IN)
--�� ��ѯ�����ϵ��������Ϣϵ����������ϵѧ�����������Ա� 

select sno,sex,sdept 
from s
where SDEPT  in('�����','������Ϣ','��������')

select sno,sex,sdept 
from s
where SDEPT='�����' or SDEPT='������Ϣ' or SDEPT='��������'

--7���ַ�ƥ��(  like, not like )  % ���������ַ���  _ ����һ���ַ�

--�� ��ѯ���������ѧ����������ѧ�ź��Ա�
select sno,sname,sex 
from s
where SNAME like '��%'     

--�� ��ѯ�ա����ȫ������Ϊ3�����ֵ�ѧ����������     
select sno,sname,sex 
from s
where SNAME like '��__'  


--8���漰��ֵ�Ĳ�ѯ����NULL ��NOT NULL��(�ص�ע��)
--�� ��ѯȱ�ٳɼ���ѧ����ѧ�ź���Ӧ�Ŀγ̺š�

select sno,cno,grade
from SC
where GRADE is  null -- ��������=

--9������������ѯ��AND��OR��

--�� ��ѯ�����ϵ������22�����µ�ѧ�������� 

select sname,SDEPT,age
from s
where SDEPT='�����' and age<22

--10��ORDER BY������ asc������,Ĭ�ϣ� desc������
--�� ��ѯѡ���˿γ̺�Ϊ��C1���γ̵�ѧ����ѧ�ż���ɼ�����ѯ����������Ľ������С�
select sno,grade 
from SC
where CNO='c1'
order by GRADE desc
 
select sno,sex,sdept 
from s
where SDEPT  in('�����','������Ϣ','��������')
order by SDEPT asc

--11��GROUP BY�����ࣩ 
--(1)ͳ�Ʊ�����Ů����������s��
select sex,COUNT(sex) ���� 
from s
group by sex

--(2)ͳ�Ʊ���������������s��
select nation,COUNT(*) ����
from s
group by nation

--(3)ͳ�Ʊ����������������3�˵�����
select nation,COUNT(*) ����
from s
group by nation
having COUNT(*)>3  --�ȷ��飬���жϵ�ʱ����group by ... having

--12�����ǰn�� top n
--�� ��SC�������ѧϰ��C1���γ̵ĳɼ�ǰ3��ѧ����ѧ�źͳɼ���

select top 3 sno,grade 
from SC
where CNO='c1'
order by GRADE desc

--13����ѯ�����������½����У�into����  --DISTINCT �����ظ���Ԫ��
 --��  ����SC�����гɼ�������ѧ����ѧ�Ŷ�����NPASS���С�
 select DISTINCT sno into NPASS from SC
 where GRADE<60
 
 select *from npass
 
 select * from sc
 
 
 --14��������ѯ
 
 CREATE TABLE    R
(
A CHAR (2),
B CHAR (2),
C CHAR (2)
)
go
CREATE TABLE   W
(
A CHAR (2),
B CHAR (2),
C CHAR (2)
)

INSERT INTO R VALUES('a','b','c')
INSERT INTO R VALUES('d','a','f')
INSERT INTO R VALUES('c','b','d')
INSERT INTO w VALUES('b','g','a')
INSERT INTO w VALUES('d','a','f')
INSERT INTO w VALUES('b','g','a')

select * into newT from 
(select * from R
union 
select * from w)a

select *from newt
 
--15��������
--�� ��ѯ��ѡ���ˡ�C1���γ���ѡ���ˡ�C2���γ̵�ѧ����ѧ�š�
select  sno from SC  where CNO='c1'
intersect
select  sno from SC  where CNO='c2'

select * into newi from 
(select  sno from SC  where CNO='c1'
intersect
select  sno from SC  where CNO='c2') a

--16��������
--�� ��ѯѡ���ˡ�C1���γ̵�û��ѡ�ޡ�C3���γ̵�ѧ����ѧ�š�     
     SELECT SNO FROM SC WHERE CNO='C1'
     EXCEPT
     SELECT SNO FROM SC WHERE CNO='C3'


select * from sc



















select *from s
select *from C
select *from sc