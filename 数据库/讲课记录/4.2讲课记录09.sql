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
	select '张秋丽','s25301','男',18,1,'北京',90,80  union
	select '李文才','s25302','男',19,2,'天津',80,90  union
	select '李斯文','s25303','女',19,3,'河北',70,80  union
	select '欧阳俊雄','s25304','男',18,4,'广东',80,60  union
	select '梅超风','s25305','女',28,5,'河南',95,70  union
	select '郭靖','s25306','男',19,6,'襄阳',95,78  union
	select '黄蓉','s25307','女',18,7,'襄阳',90,85  union
	select '岳不群','s25308','男',19,6,'华山',58,78  union
	select '左冷禅','s25309','男',18,7,'泰山',40,85 union


--第四章 4.2 逻辑控制语句

三、逻辑控制语句
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
      并显示比笔试成绩前三名学员的考试信息；如果在70以下，显示“本班成绩较差“，
      并显示后三名学员的考试信息 。*/
      
      --1.求平均分
       declare @stuavg float
       select  @stuavg=AVG(wriexam) from stuInfo
       print  '本班的平均分为：'+convert(char(4), @stuavg)
       if(@stuavg>=70)
       begin
		   print '本班成绩较差'       
		   select top 3 * from stuinfo
		   order by wriExam desc
       end
       else
       begin
			print '本班成绩优秀'       
		   select top 3 * from stuinfo
		   order by wriExam asc       
       end
      
       
 --WHILE循环语句
       
      /* SQL中的WHILE语句
		WHILE （条件）
		  BEGIN
			语句1
			语句2
			……
			BREAK
		  END 
 BREAK表示退出循环
 如果有多条语句，才需要BEGIN-END语句块 
 
		  */
--问题：本次考试成绩较差，假定要提分，确保每人笔试都通过。提分规则很简单，先每人都加2分，
--看是否都通过，如果没有全部通过，每人再加2分，再看是否都通过，如此反复提分，直到所有人都通过为止 。

--1、先求出不及格人数
 select   count(wriexam)  不及格人数  from stuInfo where wriExam<60
 
 --2、给成绩加分  
 update stuInfo set wriexam=wriexam +2
 
 declare @num int
 while(1=1)
 begin
    select  @num=count(wriexam)  from stuInfo where wriExam<60
    if(@num>0)   
     update stuInfo 
     set wriexam=wriexam +2
     where wriexam<=98;--每个同学自己想办法完善代码 
    else
    break; 
 end
 
--CASE－END多分支语句

CASE 
  WHEN 条件1 THEN  结果1
  WHEN 条件2 THEN  结果2
  ……
  ELSE 其他结果
END

/*问题：
采用美国的ABCDE五级打分制来显示笔试成绩。
 A级:   90分以上
 B级： 80－89分
 C级:   70－79分
 D级： 60－69分
 E级： 60分以下*/

select stuNo,stuname,wriexam,等级=
case
  when wriexam between 90 and 100 then 'A'
   when wriexam between 80 and 89 then 'B'
    when wriexam between 70 and 79 then 'C'
     when wriexam between 0 and 69 then 'D'
     else 'E'
 end
from stuinfo


--批处理
SQLServer规定：如果是建库、建表语句、以及我们后面学习的存储过程和视图等，
则必须在语句末尾添加 GO 批处理标志

