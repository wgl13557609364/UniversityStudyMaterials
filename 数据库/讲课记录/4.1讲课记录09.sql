use 
master
go 
if exists(select * from sys.databases where name='jwgl')
 drop database jwgl
 go
 create database jwgl
 go
 use jwgl
go
CREATE TABLE stuInfo
(
	stuNo char(8) not null primary key,
	stuName char(12),
	stuSex char(2),
	stuAge int,
	stuSeat int,
	stuAddr char(12),
	wriExam int,
	labExam int
)

go

	insert into stuInfo(stuName,stuNo,stuSex,stuAge,stuSeat,stuAddr,wriExam,labExam ) 
	select '������','s25301','��',18,1,'����',90,80  union
	select '���Ĳ�','s25302','��',19,2,'���',80,90  union
	select '��˹��','s25303','Ů',19,3,'�ӱ�',70,80  union
	select 'ŷ������','s25304','��',18,4,'�㶫',80,60  union
	select '÷����','s25305','Ů',28,5,'����',95,70  union
	select '����','s25306','��',19,6,'����',95,78  union
	select '����','s25307','Ů',18,7,'����',90,85  union
	select '����Ⱥ','s25308','��',19,6,'��ɽ',58,78  union
	select '������','s25309','��',18,7,'̩ɽ',40,85 union


select * from stuinfo


--������ 
select * from stuInfo

---һ����Ҫ��������
--1��print ����﷨
--2��SELECT��䣺�������,��ӡ�����

/*PRINT��䣺������ָ���豸����ʾ��Ϣ��
    ˵���������������������ֻ�У�char��nchar��varchar��nvarchar�Լ�
�ֲ�����@local_variable��ȫ�ֱ���@@VERSION�ȡ�
    �﷨��
     PRINT ��msg_str�� | @local_variable | |@@Funciton | string_expr
    ˵����
     ' msg_str '���ı����ַ�����
     @local_variable���ַ����͵ľֲ�������
     @@Funciton�������ַ�������ĺ�����
     string_expr���ַ������ʽ���Ϊ8000���ַ���*/
     
 print '���ֵ��ӿƼ���ѧ'    
 print @@version   --����ı�����
 select @@version  --��������񴰿�
 
 declare @age int
 set @age =150
 print '�������ϵͳ'
 print '-----------------------------------'
 print '�ҵ�����Ϊ��'+convert(char(4),@age) +'��'
 
 select '�ҵ�����Ϊ��'+convert(char(4),@age) +'��'  --���ɱ��е�һ��
 
--3��sql����еĿ����ַ�(��Ҫ���print���)
--�Ʊ���� CHAR(9) 
--���з��� CHAR(10) 
--�س����� CHAR(13)
--�����ַ�����+

print '-----------'+char(10)+ '------------------------'

--����
/*T-SQL�����еı�����Ϊȫ�ֱ����;ֲ��������ࡣ
ȫ�ֱ���
������@@������ȫ�ֱ���  �ص㣺ϵͳ�����ά�����û�ֻ�ܶ�ȡ
һ����@�����žֲ�����   �ص㣺�û������ʹ��
*/
--�����ֲ�����
   DECLARE   @������  ��������
--�����ĸ�ֵ 
	 SET @������ =ֵ   
     SELECT @������ = ֵ
 
 --��1��set��ֵ    
 declare @age int
 set @age =150
 print '�������ϵͳ'
 print '-----------------------------------'
 print '�ҵ�����Ϊ��'+convert(char(4),@age) +'��'
 
 --��2��select ��ֵ
 
 declare @name char(8)
 select @name=stuName from stuInfo
 where stuNo='s25301'
 print '��ѯ����ѧ�������ǣ�'+@name
 
--˵����Ҫ����������ȷ��ɸѡ���ļ�¼ֻ��1����û����������ʱ���������һ����¼��ֵ�� 
--���⣺��дT-SQL�������Ĳŵ�����ͬ����
declare @seat int 
select @seat =stuSeat 
from stuInfo 
where stuName='���Ĳ�'
select * 
from stuInfo
where (stuSeat=@seat-1) or (stuSeat=@seat+1)


--ȫ�ֱ�����Ӧ��
print @@SERVERNAME

print  'SQL Server�İ汾'+@@VERSION  --��ʾ�汾

print  '������������: '+@@SERVERNAME --��ʾ����

INSERT INTO stuInfo(stuName,stuNo,stuSex,stuAge) VALUES('����3','s25330','��','23')
--�������0��ʾ��һ�����ִ���д���
print '��ǰ�����:'+convert(varchar(5),@@ERROR)   
--�����Ϣ�������ʾ����ţ�����Ϊ��

UPDATE stuinfo SET stuAge=85  WHERE stuName='���Ĳ�'
print '��ǰ�����:'+convert(varchar(5),@@ERROR)   
--����޸���Ϣ����,����ʾ����ţ�����Ϊ��

INSERT INTO stuInfo(stuName,stuNo,stuSex,stuAge) VALUES('����4','s25333','��','23')
print '�ղű�����ѧԱ����λΪ:'+convert(varchar(5),@@IDENTITY )
--��ʾ�ող������λ�ţ���λ�ű������ȶ����Զ���ʶ identity(1,2)


--�����߼��������
/*SQL�е�IF-ELSE���
IF ��������
  BEGIN
    ���1
    ���2
    ����
  END
ELSE
 BEGIN
    ���1��
    ���2��
    ����
  END*/
  
  /*���⣺
      ͳ�Ʋ���ʾ�������ƽ���֣����ƽ������70���ϣ���ʾ���ɼ����㡰��
      ����ʾǰ����ѧԱ�Ŀ�����Ϣ�������70���£���ʾ������ɼ��ϲ��
      ����ʾ������ѧԱ�Ŀ�����Ϣ ��*/
      
      --1.��ƽ����
       declare @stuavg float
       select @stuavg=AVG(wriexam) from stuInfo
       print  '�����ƽ����Ϊ��'+convert(char(4), @stuavg)
       if(@stuavg>=70)
       print '����ɼ�����'
       
       
      









 
 
 select * from stuInfo
 
 
 
 




select @@version 

select * from stuInfo