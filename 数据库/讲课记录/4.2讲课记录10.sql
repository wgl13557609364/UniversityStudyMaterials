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

--逻辑控制语句
SQL中的WHILE语句
WHILE （条件）
  BEGIN
    语句1
    语句2
    ……
    BREAK
  END

--问题：本次考试成绩较差，假定要提分，确保每人笔试都通过。提分规则很简单，先每人都加2分，看是否都通过，如果没有全部通过，每人再加2分，再看是否都通过，
--如此反复提分，直到所有人都通过为止 。
 --1、查询不及格同学的个数 count（）
 
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
 
 
 --CASE－END多分支语句
 CASE 
  WHEN 条件1 THEN  结果1
  WHEN 条件2 THEN  结果2
  ……
  ELSE 其他结果
END



问题：
采用美国的ABCDE五级打分制来显示笔试成绩。
 A级:   90分以上
 B级： 80－89分
 C级:   70－79分
 D级： 60－69分
 E级： 60分以下
 
 select stuno,stuname,wriexam, 等级=
 case 
	 when wriexam  between 90 and 100  then 'A'
	 when wriexam  between 80 and 89  then 'B'
	 when wriexam  between 70 and 79  then 'C'
	 when wriexam  between 60 and 69  then 'D'
 else 'E'
 end 
from stuInfo

     /* 课堂练习
     请根据平均分和下面的评分规则，编写T-SQL语句查询学员的成绩，如上图所示。
      优 ：90分以上
      良 ：80－89分
      中 ：70－79分
      及格 ：60－69分
      不及格 ：60分以下*/


 select stuno,stuname, (wriexam+labexam)/2 平均分,等级=
 case 
	 when (wriexam+labexam)/2  between 90 and 100  then '优'
	 when (wriexam+labexam)/2  between 80 and 89  then '良'
	 when (wriexam+labexam)/2  between 70 and 79  then '中'
	 when (wriexam+labexam)/2  between 60 and 69  then '及格'
 else '不及格'
 end 
from stuInfo
 
--SQLServer存储过程规定：如果是建库、建表语句、以及我们后面学习的和视图等
--，则必须在语句末尾添加 GO 批处理标志




select * from stuinfo
