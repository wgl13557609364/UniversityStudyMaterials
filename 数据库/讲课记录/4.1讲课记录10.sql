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
	select '张秋丽','s25301','男',18,1,'北京',90,80  union
	select '李文才','s25302','男',19,2,'天津',80,90  union
	select '李斯文','s25303','女',19,3,'河北',70,80  union
	select '欧阳俊雄','s25304','男',18,4,'广东',80,60  union
	select '梅超风','s25305','女',28,5,'河南',95,70  union
	select '郭靖','s25306','男',19,6,'襄阳',95,78  union
	select '黄蓉','s25307','女',18,7,'襄阳',90,85  union
	select '岳不群','s25308','男',19,6,'华山',58,78  union
	select '左冷禅','s25309','男',18,7,'泰山',40,85 union


--第四章 
--输出显示数据
--主要的输出语句
--1、print 语句
--2、select语句

    /*PRINT语句：用于在指定设备上显示信息。
    说明：可以输出的数据类型只有：char、nchar、varchar、nvarchar以及局部变量@和全局变量@@等。
    语法：
     PRINT ‘msg_str’ | @local_variable | |@@Funciton | string_expr
    说明：
     ' msg_str '：文本或字符串。
     @local_variable：字符类型的局部变量。
     @@Funciton：返回字符串结果的函数。
     string_expr：字符串表达式，最长为8000个字符。*/
     
     --1）常用的输出
     print '桂林电子'    --文本形式输出到消息窗口
     select   '桂林电子' --数据（表）形式输出到网格窗口
     
     --2）输出变量的内容
     declare @age int
     set @age=150
     print '年龄判断系统'
     print '------------------------'     
     print '我的年龄为：' + convert(char(3),@age)+'岁'
     
     
     declare @age int
     set @age=150
     select '我的年龄为：' + convert(char(3),@age)+'岁'
     
    --二、定义变量并赋值
    
	/*变量分为：
	局部变量：
	局部变量必须以标记@作为前缀 ，如@age int
	局部变量的使用也是先声明，再赋值 
	
	全局变量：
	全局变量必须以标记@ @作为前缀，如@@version
	全局变量由系统定义和维护，我们只能读取，不能修改全局变量的值 */
	
	 1、声明局部变量
     DECLARE   @变量名  数据类型
     赋值 
	 SET @变量名 =值 
     SELECT  @变量名 = 值

     
     declare @name char(8)
     set @name='张三'
     print '你的名字：'+@name
     
     --在查询的数据时，用select赋值
     declare @name char(8)
     select @name=stuName from stuInfo where stuno='s25306'
     print '查询到的结果是:'+@name
     
     --当没有条件时，返回结果的集的最后一个
     declare @name char(8)
     select @name=stuName from stuInfo
     print '查询到的结果是:'+@name
     
     
     --编写T-SQL查找李文才的左右同桌
     --查询李文同学的座位号
     declare @seat int
     select @seat=stuseat 
     from stuinfo 
     where stuName='李文才' 
     select stuname 
     from stuInfo 
     where stuSeat =@seat-1 or stuSeat =@seat+1
     
     
     --2、全局变量都使用两个@标志作为前缀，系统已经定义好，用户只能调用不能修改。
     
     1、 print @@version   
     2、print @@servername
     
    -- 3、如果大于0表示上一条语句执行有错误，如果信息有误会显示错误号，否则为零
       INSERT INTO stuInfo(stuName,stuNo,stuSex,stuAge) VALUES('武松4','s25331','男','23')
       print '当前错误号'+convert(varchar(5),@@ERROR) 
    --5、--显示刚刚插入的座位号，座位号必须事先定义自动标识 identity(1,2)   
	  INSERT INTO stuInfo(stuName,stuNo,stuSex,stuAge) VALUES('武松4','s25331','男','23')
      print '刚才报名的学员，座位为:'+convert(varchar(5),@@IDENTITY )
      insert into stuInfo(stuseat) select ID from stuInfo where stuNo='s25331' ?? 
      
      
      4.3 逻辑控制语句  
      --IF－ELSE语句
           
     --统计并显示本班笔试平均分，
     --如果平均分在70以上，显示“成绩优秀“，并显示前三名学员的考试信息；
     --如果在70以下，显示“本班成绩较差“，并显示后三名学员的考试信息 。
     declare @avgexam float
     select  @avgexam=AVG(wriexam) from stuInfo 
     if( @avgexam>=70)
     begin
		 print '成绩优秀'
		 select top 3 * from stuInfo
		 order by wriExam desc
     end
     else
     begin    
         if( @avgexam<70)
		 print '本班成绩较差'
		 select top 3 * from stuInfo
		 order by wriExam asc
     end
     
     
     
     
     
select * from stuinfo
