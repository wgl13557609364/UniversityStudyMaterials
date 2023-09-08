/* �ڰ���  ���ݿ�
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

--8.2 ������
--һ��DML  ���ݿ��������  insert update delete �Ա�����ݽ��в���

--������ѧ��������ݷ����仯ʱ��������ʾ��Ϣ

CREATE TRIGGER T_CHANGE
ON S
FOR INSERT,UPDATE,DELETE
AS
PRINT 'ѧ������Ϣ�����仯'


--  1�� After������
      -- After������Ҫ��ֻ��ִ��ĳһ����insert��update��delete֮�󴥷����ű���������ֻ�ܶ����ڱ��ϣ����������������͵Ĵ�������
     --1��insert������     2��update������      3��delete������ 
     
    --��רҵͳ�������ı�������
    --1��ѧ���� s  ͳ����Ϣ classes
      select *from classes
     
      --��ʼ�����ͳ�Ʊ�
      insert into classes
      select sdept,COUNT(sdept)  from s
      group by sdept
      
      --������
      create trigger t_count
      on s
      after insert --after �ȼ��� for
      as
      update classes set amount=amount+1
      where sdept =(select sdept from inserted)
      --FOR = AFTER ��ͬ,������AFTER ָ�����������ڴ��� SQL �����ָ�������в������ѳɹ�ִ��ʱ�ű�����
   
      
       select *from classes --ǰ
       insert into s(SNO,sdept) values('s57','���繤��') --���д���ִ����֮�󴥷�������
       select *from classes --��
       
       --2��INSTEAD OF ��������  INSTEAD OF ����������ʱִֻ�д������ڲ���SQL���
       
        CREATE TRIGGER T_WAKE
		ON S
		INSTEAD OF  INSERT
		AS
		PRINT '��⵽��������¼�룡'
		
		insert into s(SNO,sdept) values('s58','�����')
		/*�C��¼������ʱ����������ִ�б����SQL��䣬�򴥷�������û��INSERT��䣬
		���� S������ݲ��ᷢ���仯*/
        --������s���в�������ʱ�����ѧ���Ƿ��Ѵ��ڣ��������������롣
         create trigger check1
         on s
         instead of insert
         as 
           if exists(select *from s where SNO=(select SNO from inserted)) --�Ƿ����ѧ��           
           begin
              rollback transaction --����һ������
              print 'ѧ����ѧ���Ѿ����ڣ������ظ�����'           
           end
           else
           begin
              insert into s select * from inserted
              print 'ѧ������ɹ���' 
           end
           
           insert into s(SNO,sdept) values('s58','�����')  
           
        --���⣺
       ---���רҵ�����Զ�ͳ�Ƶ����⣺����ѧ����Ϣ��(s)��ɾ��һ��ѧ����Ϣʱ��
       ---�Զ�����רҵ������classes����   
        
        --delete    s->deleted
        create trigger del_s
        on s
        for delete   --for �ȼ�after
        as
        update classes set amount=amount-1
        where sdept =(select sdept from deleted)        
        
       select *from classes --ǰ
       delete from s where SNO='s58' --���д���ִ����֮�󴥷�������
       select *from classes --��
       
       
       --���⣺��ֹ�޸�ѧ����Ϣ��(s)�С�ѧ�š�����Ҫ���ֶΣ������ֶο��޸ġ�
       create trigger up_s
       on s
       for update
       as
       if(UPDATE(sno))
       begin
           rollback transaction --�����޸�ѧ�ŵĲ���
           print '��ֹ�޸�ѧ��'
       end
       else
       begin
         print '��Ϣ�޸ĳɹ���'
       end
       
       --�޸�ѧ�ţ��������������޸�ʧ��
       update s set SNO='s100'    where SNO='s10'  
       
       --�޸���������Ϣ���������������������޸�
       update s set SName='СС�׸�'   where SNO='s10' 
       
       
      
      
-- ����DDL������   ���ݿⶨ�����ԣ� create  alter  drop��   
---���ã������ݿ⣬����ͼ���洢���̣��������Ƚṹ����

CREATE TRIGGER trigger_name
 ON ��ALL SERVER|DATABASE��
FOR {EVENT_TYPE}
 AS 
  T-SQL���
  
  
-- ���⣺��ֹɾ�����޸�ѧ����Ϣ��(s)��
	CREATE TRIGGER DDL_DEL
	ON DATABASE
	FOR  ALTER_TABLE,DROP_TABLE
	AS 
	PRINT '���ؾ��棺��Ϊϵͳ���ݱ���ɾ����'
	ROLLBACK transaction --���������޸ģ�ɾ������

   drop table sc
   
    --���������޸� alter
    alter TRIGGER DDL_DEL
	ON DATABASE
	FOR  DROP_TABLE
	AS 
	PRINT '���ؾ��棺��Ϊϵͳ���ݱ���ɾ����'
	ROLLBACK transaction
	
	--��������ɾ�� drop trigger ����  
    drop trigger up_s
  

        
         
           
           
           
           

select * from s
select * from sc
