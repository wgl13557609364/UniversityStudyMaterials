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


select * from stuinfo


--第四章 
select * from stuInfo

---一、主要的输出语句
--1、print 语句语法
--2、SELECT语句：用于输出,打印结果。

/*PRINT语句：用于在指定设备上显示信息。
    说明：可以输出的数据类型只有：char、nchar、varchar、nvarchar以及
局部变量@local_variable和全局变量@@VERSION等。
    语法：
     PRINT ‘msg_str’ | @local_variable | |@@Funciton | string_expr
    说明：
     ' msg_str '：文本或字符串。
     @local_variable：字符类型的局部变量。
     @@Funciton：返回字符串结果的函数。
     string_expr：字符串表达式，最长为8000个字符。*/
     
 print '桂林电子科技大学'    
 print @@version   --输出文本窗口
 select @@version  --输出到网格窗口
 
 declare @age int
 set @age =150
 print '教务管理系统'
 print '-----------------------------------'
 print '我的年龄为：'+convert(char(4),@age) +'岁'
 
 select '我的年龄为：'+convert(char(4),@age) +'岁'  --看成表中的一列
 
--3、sql语句中的控制字符(主要针对print语句)
--制表符： CHAR(9) 
--换行符： CHAR(10) 
--回车符： CHAR(13)
--连接字符串：+

print '-----------'+char(10)+ '------------------------'

--变量
/*T-SQL程序中的变量分为全局变量和局部变量两类。
全局变量
两个“@@”符号全局变量  特点：系统定义和维护，用户只能读取
一个“@”符号局部变量   特点：用户定义和使用
*/
--声明局部变量
   DECLARE   @变量名  数据类型
--变量的赋值 
	 SET @变量名 =值   
     SELECT @变量名 = 值
 
 --（1）set赋值    
 declare @age int
 set @age =150
 print '教务管理系统'
 print '-----------------------------------'
 print '我的年龄为：'+convert(char(4),@age) +'岁'
 
 --（2）select 赋值
 
 declare @name char(8)
 select @name=stuName from stuInfo
 where stuNo='s25301'
 print '查询到的学生名字是：'+@name
 
--说明：要设置条件，确保筛选出的记录只有1条，没有条件限制时，返回最后一条记录的值。 
--问题：编写T-SQL查找李文才的左右同桌？
declare @seat int 
select @seat =stuSeat 
from stuInfo 
where stuName='李文才'
select * 
from stuInfo
where (stuSeat=@seat-1) or (stuSeat=@seat+1)


--全局变量的应用
print @@SERVERNAME

print  'SQL Server的版本'+@@VERSION  --显示版本

print  '服务器的名称: '+@@SERVERNAME --显示名称

INSERT INTO stuInfo(stuName,stuNo,stuSex,stuAge) VALUES('武松3','s25330','男','23')
--如果大于0表示上一条语句执行有错误
print '当前错误号:'+convert(varchar(5),@@ERROR)   
--如果信息有误会显示错误号，否则为零

UPDATE stuinfo SET stuAge=85  WHERE stuName='李文才'
print '当前错误号:'+convert(varchar(5),@@ERROR)   
--如果修改信息有误,会显示错误号，否则为零

INSERT INTO stuInfo(stuName,stuNo,stuSex,stuAge) VALUES('武松4','s25333','男','23')
print '刚才报名的学员，座位为:'+convert(varchar(5),@@IDENTITY )
--显示刚刚插入的座位号，座位号必须事先定义自动标识 identity(1,2)


--三、逻辑控制语句
/*SQL中的IF-ELSE语句
IF （条件）
  BEGIN
    语句1
    语句2
    ……
  END
ELSE
 BEGIN
    语句1；
    语句2；
    ……
  END*/
  
  /*问题：
      统计并显示本班笔试平均分，如果平均分在70以上，显示“成绩优秀“，
      并显示前三名学员的考试信息；如果在70以下，显示“本班成绩较差“，
      并显示后三名学员的考试信息 。*/
      
      --1.求平均分
       declare @stuavg float
       select @stuavg=AVG(wriexam) from stuInfo
       print  '本班的平均分为：'+convert(char(4), @stuavg)
       if(@stuavg>=70)
       print '本班成绩优秀'
       
       
      









 
 
 select * from stuInfo
 
 
 
 




select @@version 

select * from stuInfo