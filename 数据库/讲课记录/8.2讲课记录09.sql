--8.2 ������

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
      alter trigger t_count
      on s
      for insert --after �ȼ��� for
      as
      update classes set amount=amount+1
      where sdept =(select sdept from inserted)
      
       select *from classes --ǰ
       insert into s(SNO,sdept) values('s56','���繤��')
       select *from classes --��
      
      --2��INSTEAD OF ������ 
         --INSTEAD OF ����������ʱִֻ�д������ڲ���SQL��䣬����ִ�м���ô�������SQL��INSERT��UPDATE��DELETE��������ִ�д����������ȿ����ڱ��϶���INSTEAD OF��������Ҳ��������ͼ�϶��塣INSTEAD OF ����ǰִ�У��ڴ������ڲ���ɡ�

		CREATE TRIGGER T_WAKE
		ON S
		INSTEAD OF  INSERT
		AS
		PRINT '��⵽��������¼�룡'
		
		--/*�C��¼������ʱ����������ִ�б����SQL��䣬�򴥷�������û��INSERT��䣬���� S�����ݲ��ᷢ���仯
		
		 insert into s(SNO,sdept) values('s58','�����')
		 
		 select * from s
		 
		 --������s���в�������ʱ�����ѧ���Ƿ���ڣ��������������롣
		 create trigger checksno
		 on s
		 instead of insert
		 as		 
		 if exists(select * from s where SNO=(select SNO from inserted)) 
		 begin
		    rollback transaction  --��������
		    print 'ѧ���Ѿ����ڣ��벻Ҫ�ظ�¼��'	 
		 end		 
		 else		  
		 begin
		    insert into s select * from inserted
		    print 'ѧ����Ϣ¼��ɹ���'
		 end
		 
		 
		 insert into s values('s58','С��','Ů','��',18,'�����')
		 
		--2��DELETE��������ʹ��
		
		--���⣺���רҵ�����Զ�ͳ�Ƶ����⣺����ѧ����Ϣ��(student)��ɾ��һ��ѧ����Ϣʱ���Զ�����רҵ������classes��
		--������
		--��s��Ϣ���ϴ���DELETE������ 
		--��deleted��ʱ���л�ȡɾ���������С�
		--����ɾ���ļ�¼�Զ�ͳ��������
		create trigger del_s
		on s
		for delete
		as
		update classes set amount=amount-1
		where Sdept =(select Sdept from deleted)
		
	   select *from classes --ǰ
       delete from s where sno='s56'
       select *from classes --��
       
       --���⣺
       --���ɾ��s���һ����¼ʱ���Զ�ɾ��SC������֮��صĳɼ���Ϣ��
       
        create trigger del_sc
		on s
		for delete
		as
		delete from SC where SNO in(select sno from deleted)
		  
		delete from s where sno='s2'	
		select * from sc
		
		--3��update��������ʹ��
		
		--���⣺��ֹ�޸�ѧ����Ϣ��(student)�С�ѧ�š�����Ҫ���ֶ�
		 CREATE TRIGGER UP_STU
		 ON S
		 FOR UPDATE
		 AS
		   IF(UPDATE(sno))
		   BEGIN
			 PRINT('���ؾ��棺ѧ����Ϣ�����޸ģ�')
			 ROLLBACK TRANSACTION --��������
		   END
		  ELSE
		    BEGIN
  			  PRINT('�޸ĳɹ�')
		   END
		   
		   update s set sname='�ϻ�' where SNO='s10'
		   
		   
		   --DDL������ʹ��
		   CREATE TRIGGER trigger_name
			 ON ��ALL SERVER|DATABASE��
			FOR {EVENT_TYPE}
			 AS 
			  T-SQL���
			GO
          
          --���⣺��ֹɾ�����޸�ѧ����Ϣ��(student)��
            alter TRIGGER DDL_DEL
			ON DATABASE
			FOR  DROP_TABLE
			AS 
			PRINT '���ؾ��棺��Ϊϵͳ���ݱ���ɾ����'
			ROLLBACK
			
			drop table sc
			
			drop trigger deL_sc


 


		   


		

       
		
		
		
	