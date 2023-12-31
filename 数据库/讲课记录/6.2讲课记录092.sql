--例  查询选修了“C1”号课程的学生的姓名和所在专业。
GO
SELECT SNAME,SDEPT 
FROM S
WHERE SNO IN
     (SELECT SNO
      FROM SC
      WHERE CNO='C1')
      
--例6.41 查询其它系中比计算机科学系（CS）某一学生年龄小的学生姓名和年龄。

--1、找出计算机系学生的年龄
    select age from s where SDEPT='计算机'
--2、其他系计算机系的年龄比较
    select sname,age,sdept 
    from s 
    where sdept not IN('计算机') and AGE< any(select age from s where SDEPT='计算机')
    --any 某一个  all 全部
    
    select sname,age,sdept 
    from s 
    where sdept not IN('计算机') and AGE< (select max(age) from s where SDEPT='计算机')
   
--二、相关子查询
    ---在相关子查询中，子查询的执行依赖于父查询，多数情况下是子查询的WHERE子句中引用
    ---了父查询的表。
    
    -- 例  查询每一位学生比自己平均成绩高的所有成绩，并输出的学生的学号、课程号和成绩
     --方法1：
      select sno,cno,grade 
      from SC a
      where GRADE >(  
					select AVG(grade) from SC 
					where a.SNO=sc.sno )
					
	--求每个学生的平均成绩
	   --方法2：
	  select sno,cno,grade 
      from SC a
      where GRADE >(select AVG(grade) from SC b group by sno having  a.SNO=b.sno )
      --方法3：
      select sno,cno,grade from sc,(select SNO 学号,AVG(grade) 平均成绩 
      from SC group by sno) as nt
      where sno=nt.学号 and GRADE>=nt.平均成绩
     
      
	--(2) 带有EXISTS的子查询  判断是否有结果 有true  没有flase
	
	
	IF EXISTS(SELECT * FROM SYS.DATABASES WHERE NAME='JXGL') 
	DROP DATABASE JXGL
	
	--例6.43 查询所有选修了“C2”课程的姓名
	  select sname 
	  from s
	  where EXISTS (select * from SC where sno=s.sno and CNO='c2')
	  -- EXISTS  前没有关键字段
	


   




select * from s
select * from sc
select * from c
