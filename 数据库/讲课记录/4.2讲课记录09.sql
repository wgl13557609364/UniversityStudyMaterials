use master
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


--������ 4.2 �߼��������

�����߼��������
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
      ����ʾ�ȱ��Գɼ�ǰ����ѧԱ�Ŀ�����Ϣ�������70���£���ʾ������ɼ��ϲ��
      ����ʾ������ѧԱ�Ŀ�����Ϣ ��*/
      
      --1.��ƽ����
       declare @stuavg float
       select  @stuavg=AVG(wriexam) from stuInfo
       print  '�����ƽ����Ϊ��'+convert(char(4), @stuavg)
       if(@stuavg>=70)
       begin
		   print '����ɼ��ϲ�'       
		   select top 3 * from stuinfo
		   order by wriExam desc
       end
       else
       begin
			print '����ɼ�����'       
		   select top 3 * from stuinfo
		   order by wriExam asc       
       end
      
       
 --WHILEѭ�����
       
      /* SQL�е�WHILE���
		WHILE ��������
		  BEGIN
			���1
			���2
			����
			BREAK
		  END 
 BREAK��ʾ�˳�ѭ��
 ����ж�����䣬����ҪBEGIN-END���� 
 
		  */
--���⣺���ο��Գɼ��ϲ�ٶ�Ҫ��֣�ȷ��ÿ�˱��Զ�ͨ������ֹ���ܼ򵥣���ÿ�˶���2�֣�
--���Ƿ�ͨ�������û��ȫ��ͨ����ÿ���ټ�2�֣��ٿ��Ƿ�ͨ������˷�����֣�ֱ�������˶�ͨ��Ϊֹ ��

--1�����������������
 select   count(wriexam)  ����������  from stuInfo where wriExam<60
 
 --2�����ɼ��ӷ�  
 update stuInfo set wriexam=wriexam +2
 
 declare @num int
 while(1=1)
 begin
    select  @num=count(wriexam)  from stuInfo where wriExam<60
    if(@num>0)   
     update stuInfo 
     set wriexam=wriexam +2
     where wriexam<=98;--ÿ��ͬѧ�Լ���취���ƴ��� 
    else
    break; 
 end
 
--CASE��END���֧���

CASE 
  WHEN ����1 THEN  ���1
  WHEN ����2 THEN  ���2
  ����
  ELSE �������
END

/*���⣺
����������ABCDE�弶���������ʾ���Գɼ���
 A��:   90������
 B���� 80��89��
 C��:   70��79��
 D���� 60��69��
 E���� 60������*/

select stuNo,stuname,wriexam,�ȼ�=
case
  when wriexam between 90 and 100 then 'A'
   when wriexam between 80 and 89 then 'B'
    when wriexam between 70 and 79 then 'C'
     when wriexam between 0 and 69 then 'D'
     else 'E'
 end
from stuinfo


--������
SQLServer�涨������ǽ��⡢������䡢�Լ����Ǻ���ѧϰ�Ĵ洢���̺���ͼ�ȣ�
����������ĩβ��� GO �������־

