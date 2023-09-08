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

--6.2����ѯ

--1���ڶ���ѯ�У����Ҫ���ò�ͬ��ϵ�е�ͬ�����ԣ����á���ϵ��.������������ʽ��ʾ��
  --�������ѧ������Ϣ��������Ϣ��ѧ�ţ��������ɼ���Ϣ���γ̺ţ��ɼ���
  select s.sno,sname,cno,grade
  from s,sc
  where s.SNO=sc.sno
--2�����Ӳ�ѯ
--��1��������
  /*�������Ǵ�������ĵѿ������У�ѡ����������������Ԫ�顣
    SELECT <Ŀ���б��ʽ> [, �� n]
    FROM <��1> INNER JOIN <��2>
    ON <�����������ʽ>[, �� n]*/
    
  --������ѯÿ��ѧ������ѡ�޿γ̵����
     select s.SNO,sname,cno,grade
     from s inner join sc
     on s.SNO=sc.sno
     
 --�� ��ѯ�����ϵѧ����ѡ�γ̵Ŀγ̺ź�ƽ���ɼ��� 
  select cno, AVG(grade) ƽ����
  from s inner join sc
  on s.SNO=sc.sno and SDEPT='�����'
  group by CNO
  
  --��ֵ��ѯ
  select cno, AVG(grade) ƽ����
  from s,sc
  where s.SNO=sc.sno and SDEPT='�����'
  group by CNO
  
  
  --(2)������
 --���������У�����������Щ��������������Ԫ�飬����ĳЩ������������Ԫ��Ҳ������ڽ�����С� 

/*��A����������
     ���������Ƕ�����������ߵı������ơ�����߱�Ԫ�����ұ߱�Ԫ�鲻ƥ��ʱ�����ұ߱����Ӧ��ֵȡNULL��
����ʽ���£�
    SELECT <Ŀ���б��ʽ>[, �� n]
    FROM <��1>LEFT[OUTER]JOIN <��2>[, �� n]
    ON <�����������ʽ>*/
    
   -- ���� ��ѯÿ��ѧ������ѡ�޿γ̵ĳɼ��������δѡ�γ̵�ѧ����Ϣ��
   
   select s.SNO,sname,sc.* 
   from s left join sc
   on s.SNO=sc.sno
   
   /*(B) ��������(���ұ߱�������Ϊ��׼�� )
   ���������Ƕ����������ұߵı������ơ����ұ߱�Ԫ������߱�Ԫ�鲻ƥ��ʱ������߱����Ӧ��ֵȡNULL��
����ʽ���£�
	SELECT <Ŀ���б��ʽ>[, �� n]
	FROM <��1> RIGHT [OUTER] JOIN <��2>[, �� n]
	ON <�����������ʽ> */
	
   select s.SNO,sname,sc.* 
   from s right join sc
   on s.SNO=sc.sno
   
   select s1.*,sc1.* 
   from s1 right join sc1
   on s1.SNO=sc1.sno
   
   --(3) ȫ�����ӣ��������ݶ���ʾ��
/*ȫ�������Ƕ������������������������ơ���һ�߱�Ԫ������һ�߱�Ԫ�鲻ƥ��ʱ��
����һ�߱����Ӧ��ֵȡNULL������ʽ���£�
SELECT <Ŀ���б��ʽ> [, �� n]
FROM <��1> FULL [OUTER] JOIN <��2>[, �� n]
ON <�����������ʽ>*/

   select s1.*,sc1.* 
   from s1 full join sc1
   on s1.SNO=sc1.sno
   
   
   --�����Ӳ�ѯ��subquery����ָ��һ��SELECT��ѯ����а�����һ��SELECT��ѯ��䣬
   --��һ��SELECT���Ƕ�뵽��һ��SELECT����С����У�����SELECT����Ϊ����ѯ�����ѯ��
   --Ƕ���ڲ��SELECT����Ϊ�Ӳ�ѯ���ڲ�ѯ����ˣ��Ӳ�ѯҲ��ΪǶ�ײ�ѯ��nested query����
  
   --1���޹��Ӳ�ѯ���޹��Ӳ�ѯ��ִ�в������ڸ���ѯ
   -- ������ѯ�롰��С�ա���ͬһ��ϵ��ѧ��ѧ�š�����������ϵ��
   --�����ѧ��ѧ�š�����������ϵ
   select sno,sname,sdept 
   from s
   where SDEPT =( select sdept from s where SNAME='��С��'  )
   --����ִ���Ӳ�ѯ����ֱ�ӵõ���������޹��Ӳ�ѯ
   
   --����Դ��s
   --��������"��С��"��ͬһ��ϵ���Ӳ�ѯ��
   select sdept from s where SNAME='��С��'
   
   --�������Ӳ�ѯ��ɴ��⣬s a  s b    a, b����
    select a.sno,a.sname,a.sdept 
    from  s a join s b 
    on a.SDEPT=b.SDEPT and b.SNAME='��С��'  --b.SDEPT and b.SNAME='��С��' ��ʾ��С�����ڵ�ϵ
    
    
   -- ��:��ѯѡ���ˡ�C1���γ̵�ѧ��������������רҵ��
   select sname,sdept 
   from s 
   where SNO in( select sno from sc  where CNO='c1' ) 
   
      
   --��6.41 ��ѯ����ϵ�бȼ����ϵĳһѧ������С��ѧ������������ 
   
   select * 
   from s 
   where AGE < any(
   select age from s where SDEPT='�����') and SDEPT<>'�����'
       
      
   
  
   

    
    
   

   

   
   

  select * into s1 from s
  select * into sc1 from sc
  
  
   

  

     
     
     
     
  


select * from sc
select * from s
select * from c