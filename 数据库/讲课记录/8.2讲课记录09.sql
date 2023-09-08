--8.2 触发器

--例：当学生表的数据发生变化时，发出提示信息

CREATE TRIGGER T_CHANGE
ON S
FOR INSERT,UPDATE,DELETE
AS
PRINT '学生表信息发生变化'


--  1、 After触发器
      -- After触发器要求只有执行某一操作insert、update、delete之后触发器才被触发，且只能定义在表上，包括以下三种类型的触发器：
     --1）insert触发器     2）update触发器      3）delete触发器 
     
    --按专业统计新生的报到人数
    --1、学生表 s  统计信息 classes
      select *from classes
     
      --初始化表格统计表
      insert into classes
      select sdept,COUNT(sdept)  from s
      group by sdept
      
      --触发器
      alter trigger t_count
      on s
      for insert --after 等价于 for
      as
      update classes set amount=amount+1
      where sdept =(select sdept from inserted)
      
       select *from classes --前
       insert into s(SNO,sdept) values('s56','机电工程')
       select *from classes --后
      
      --2、INSTEAD OF 触发器 
         --INSTEAD OF 触发器触发时只执行触发器内部的SQL语句，而不执行激活该触发器的SQL（INSERT、UPDATE、DELETE）而仅是执行触发器本身。既可以在表上定义INSTEAD OF触发器，也可以在视图上定义。INSTEAD OF 操作前执行，在触发器内部完成。

		CREATE TRIGGER T_WAKE
		ON S
		INSTEAD OF  INSERT
		AS
		PRINT '检测到正有数据录入！'
		
		--/*–当录入数据时，触发器仅执行本身的SQL语句，因触发器本身没有INSERT语句，所以 S的数据不会发生变化
		
		 insert into s(SNO,sdept) values('s58','计算机')
		 
		 select * from s
		 
		 --例：向s表中插入数据时，检查学号是否存在，如存在则不允许插入。
		 create trigger checksno
		 on s
		 instead of insert
		 as		 
		 if exists(select * from s where SNO=(select SNO from inserted)) 
		 begin
		    rollback transaction  --撤销事务
		    print '学号已经存在，请不要重复录入'	 
		 end		 
		 else		  
		 begin
		    insert into s select * from inserted
		    print '学生信息录入成功！'
		 end
		 
		 
		 insert into s values('s58','小明','女','汉',18,'计算机')
		 
		--2）DELETE触发器的使用
		
		--问题：解决专业人数自动统计的问题：当向学生信息表(student)中删除一条学生信息时，自动更新专业人数（classes）
		--分析：
		--在s信息表上创建DELETE触发器 
		--从deleted临时表中获取删除的数据行。
		--根据删除的记录自动统计人数。
		create trigger del_s
		on s
		for delete
		as
		update classes set amount=amount-1
		where Sdept =(select Sdept from deleted)
		
	   select *from classes --前
       delete from s where sno='s56'
       select *from classes --后
       
       --问题：
       --解决删除s表的一条记录时，自动删除SC表中与之相关的成绩信息。
       
        create trigger del_sc
		on s
		for delete
		as
		delete from SC where SNO in(select sno from deleted)
		  
		delete from s where sno='s2'	
		select * from sc
		
		--3）update触发器的使用
		
		--问题：禁止修改学生信息表(student)中“学号”等重要的字段
		 CREATE TRIGGER UP_STU
		 ON S
		 FOR UPDATE
		 AS
		   IF(UPDATE(sno))
		   BEGIN
			 PRINT('严重警告：学号信息不能修改！')
			 ROLLBACK TRANSACTION --撤销事务
		   END
		  ELSE
		    BEGIN
  			  PRINT('修改成功')
		   END
		   
		   update s set sname='老虎' where SNO='s10'
		   
		   
		   --DDL触发器使用
		   CREATE TRIGGER trigger_name
			 ON ｛ALL SERVER|DATABASE｝
			FOR {EVENT_TYPE}
			 AS 
			  T-SQL语句
			GO
          
          --问题：禁止删除和修改学生信息表(student)。
            alter TRIGGER DDL_DEL
			ON DATABASE
			FOR  DROP_TABLE
			AS 
			PRINT '严重警告：此为系统数据表不能删除！'
			ROLLBACK
			
			drop table sc
			
			drop trigger deL_sc


 


		   


		

       
		
		
		
	