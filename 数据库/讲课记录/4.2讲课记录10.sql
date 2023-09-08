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

--�߼��������
SQL�е�WHILE���
WHILE ��������
  BEGIN
    ���1
    ���2
    ����
    BREAK
  END

--���⣺���ο��Գɼ��ϲ�ٶ�Ҫ��֣�ȷ��ÿ�˱��Զ�ͨ������ֹ���ܼ򵥣���ÿ�˶���2�֣����Ƿ�ͨ�������û��ȫ��ͨ����ÿ���ټ�2�֣��ٿ��Ƿ�ͨ����
--��˷�����֣�ֱ�������˶�ͨ��Ϊֹ ��
 --1����ѯ������ͬѧ�ĸ��� count����
 
 declare @num int
 while(1=1)
 begin
	 select @num =COUNT(wriexam) from stuInfo where wriExam<60
	 if(@num>0)
	 begin
		 update stuInfo set wriExam=wriExam+2 where  wriExam<99
		 update stuInfo set wriExam=wriExam+1 where  wriExam=99
	 end
	 else
	    break
 end
 
 
 --CASE��END���֧���
 CASE 
  WHEN ����1 THEN  ���1
  WHEN ����2 THEN  ���2
  ����
  ELSE �������
END



���⣺
����������ABCDE�弶���������ʾ���Գɼ���
 A��:   90������
 B���� 80��89��
 C��:   70��79��
 D���� 60��69��
 E���� 60������
 
 select stuno,stuname,wriexam, �ȼ�=
 case 
	 when wriexam  between 90 and 100  then 'A'
	 when wriexam  between 80 and 89  then 'B'
	 when wriexam  between 70 and 79  then 'C'
	 when wriexam  between 60 and 69  then 'D'
 else 'E'
 end 
from stuInfo

     /* ������ϰ
     �����ƽ���ֺ���������ֹ��򣬱�дT-SQL����ѯѧԱ�ĳɼ�������ͼ��ʾ��
      �� ��90������
      �� ��80��89��
      �� ��70��79��
      ���� ��60��69��
      ������ ��60������*/


 select stuno,stuname, (wriexam+labexam)/2 ƽ����,�ȼ�=
 case 
	 when (wriexam+labexam)/2  between 90 and 100  then '��'
	 when (wriexam+labexam)/2  between 80 and 89  then '��'
	 when (wriexam+labexam)/2  between 70 and 79  then '��'
	 when (wriexam+labexam)/2  between 60 and 69  then '����'
 else '������'
 end 
from stuInfo
 
--SQLServer�洢���̹涨������ǽ��⡢������䡢�Լ����Ǻ���ѧϰ�ĺ���ͼ��
--������������ĩβ��� GO �������־




select * from stuinfo
