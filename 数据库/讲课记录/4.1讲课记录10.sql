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


--������ 
--�����ʾ����
--��Ҫ��������
--1��print ���
--2��select���

    /*PRINT��䣺������ָ���豸����ʾ��Ϣ��
    ˵���������������������ֻ�У�char��nchar��varchar��nvarchar�Լ��ֲ�����@��ȫ�ֱ���@@�ȡ�
    �﷨��
     PRINT ��msg_str�� | @local_variable | |@@Funciton | string_expr
    ˵����
     ' msg_str '���ı����ַ�����
     @local_variable���ַ����͵ľֲ�������
     @@Funciton�������ַ�������ĺ�����
     string_expr���ַ������ʽ���Ϊ8000���ַ���*/
     
     --1�����õ����
     print '���ֵ���'    --�ı���ʽ�������Ϣ����
     select   '���ֵ���' --���ݣ�����ʽ��������񴰿�
     
     --2���������������
     declare @age int
     set @age=150
     print '�����ж�ϵͳ'
     print '------------------------'     
     print '�ҵ�����Ϊ��' + convert(char(3),@age)+'��'
     
     
     declare @age int
     set @age=150
     select '�ҵ�����Ϊ��' + convert(char(3),@age)+'��'
     
    --���������������ֵ
    
	/*������Ϊ��
	�ֲ�������
	�ֲ����������Ա��@��Ϊǰ׺ ����@age int
	�ֲ�������ʹ��Ҳ�����������ٸ�ֵ 
	
	ȫ�ֱ�����
	ȫ�ֱ��������Ա��@ @��Ϊǰ׺����@@version
	ȫ�ֱ�����ϵͳ�����ά��������ֻ�ܶ�ȡ�������޸�ȫ�ֱ�����ֵ */
	
	 1�������ֲ�����
     DECLARE   @������  ��������
     ��ֵ 
	 SET @������ =ֵ 
     SELECT  @������ = ֵ

     
     declare @name char(8)
     set @name='����'
     print '������֣�'+@name
     
     --�ڲ�ѯ������ʱ����select��ֵ
     declare @name char(8)
     select @name=stuName from stuInfo where stuno='s25306'
     print '��ѯ���Ľ����:'+@name
     
     --��û������ʱ�����ؽ���ļ������һ��
     declare @name char(8)
     select @name=stuName from stuInfo
     print '��ѯ���Ľ����:'+@name
     
     
     --��дT-SQL�������Ĳŵ�����ͬ��
     --��ѯ����ͬѧ����λ��
     declare @seat int
     select @seat=stuseat 
     from stuinfo 
     where stuName='���Ĳ�' 
     select stuname 
     from stuInfo 
     where stuSeat =@seat-1 or stuSeat =@seat+1
     
     
     --2��ȫ�ֱ�����ʹ������@��־��Ϊǰ׺��ϵͳ�Ѿ�����ã��û�ֻ�ܵ��ò����޸ġ�
     
     1�� print @@version   
     2��print @@servername
     
    -- 3���������0��ʾ��һ�����ִ���д��������Ϣ�������ʾ����ţ�����Ϊ��
       INSERT INTO stuInfo(stuName,stuNo,stuSex,stuAge) VALUES('����4','s25331','��','23')
       print '��ǰ�����'+convert(varchar(5),@@ERROR) 
    --5��--��ʾ�ող������λ�ţ���λ�ű������ȶ����Զ���ʶ identity(1,2)   
	  INSERT INTO stuInfo(stuName,stuNo,stuSex,stuAge) VALUES('����4','s25331','��','23')
      print '�ղű�����ѧԱ����λΪ:'+convert(varchar(5),@@IDENTITY )
      insert into stuInfo(stuseat) select ID from stuInfo where stuNo='s25331' ?? 
      
      
      4.3 �߼��������  
      --IF��ELSE���
           
     --ͳ�Ʋ���ʾ�������ƽ���֣�
     --���ƽ������70���ϣ���ʾ���ɼ����㡰������ʾǰ����ѧԱ�Ŀ�����Ϣ��
     --�����70���£���ʾ������ɼ��ϲ������ʾ������ѧԱ�Ŀ�����Ϣ ��
     declare @avgexam float
     select  @avgexam=AVG(wriexam) from stuInfo 
     if( @avgexam>=70)
     begin
		 print '�ɼ�����'
		 select top 3 * from stuInfo
		 order by wriExam desc
     end
     else
     begin    
         if( @avgexam<70)
		 print '����ɼ��ϲ�'
		 select top 3 * from stuInfo
		 order by wriExam asc
     end
     
     
     
     
     
select * from stuinfo
