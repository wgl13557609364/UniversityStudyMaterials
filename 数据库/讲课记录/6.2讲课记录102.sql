--6.2 连接查询
--1、多表引用的时候，输出   table.属性， 属性如果不是唯一的，必须写上表名。
  --例：查找学生的学号，姓名,课程号，成绩。（s,sc）
  select s.sno,sname,cno,grade from s,sc
  where s.sno=sc.sno
--2、链接查询 
    --（1）内连接查询 --显示满足连接条件的元组
   /* SELECT <目标列表达式> [, … n]
    FROM <表1> INNER JOIN <表2>
    ON <连接条件表达式>[, … n]*/
   
   -- 例  查询每个学生及其选修课程的情况
   select s.*,sc.*
   from s inner join sc
   on s.sno=sc.sno   
   
   select s.*,sc.*
   from sc inner join s
   on s.sno=sc.sno
   
   
   --例  在SC表中，查询选修“C1”课程成绩高于学号为“S1”同学成绩的所有学生元组，并按成绩降序排列。
	SELECT a.SNO,a.CNO,a.GRADE
	FROM SC a INNER JOIN SC b
	ON a.CNO='C1' AND a.GRADE>b.GRADE AND b.SNO='S1' AND b.CNO='C1'
	ORDER BY GRADE DESC
	
	
	--例  查询70分以上学生的学号、姓名、选修课程号、选修课程名和成绩。（涉及三个表的连接方法） 
	SELECT S.SNO,S.SNAME,SC.CNO,C.CNAME,SC.GRADE
	FROM S 
	JOIN SC
	ON S.SNO=SC.SNO AND GRADE>=70
	JOIN C 
	ON SC.CNO=C.CNO 
	
	--等值查询
	SELECT S.SNO,S.SNAME,SC.CNO,C.CNAME,SC.GRADE
	FROM S,sc,c
	where s.sno=sc.sno and c.cno=sc.cno and sc.grade>70
	


   
    
    
    --（2）外链接查询
   /*左外连接是对连接条件左边的表不加限制。当左边表元组与右边表元组不匹配时，与右边表的相应列值取NULL。语句格式如下：
    SELECT <目标列表达式>[, … n]
    FROM <表1>LEFT[OUTER]JOIN <表2>[, … n]
    ON <连接条件表达式>*/
    
   select s.*,sc.*
   from s left join sc
   on s.sno=sc.sno
   
   --(3) 右外连接(以右边表格的数据为标准。 )
/*右外连接是对连接条件右边的表不加限制。当右边表元组与左边表元组不匹配时，与左边表的相应列值取NULL。语句格式如下：
SELECT <目标列表达式>[, … n]
FROM <表1> RIGHT [OUTER] JOIN <表2>[, … n]
ON <连接条件表达式>*/

 select * into s1 from s
 select * into sc1 from sc
 
 select * from sc1
 
 
   select s1.*,sc1.*
   from s1 right join sc1
   on s1.sno=sc1.sno
   
   --(4) 全外连接（所有数据都显示）
/*全外连接是对连接条件的两个表都不加限制。当一边表元组与另一边表元组不匹配时，
与另一边表的相应列值取NULL。语句格式如下：
SELECT <目标列表达式> [, … n]
FROM <表1> FULL [OUTER] JOIN <表2>[, … n]
ON <连接条件表达式>*/


   select s1.*,sc1.*
   from s1 full join sc1
   on s1.sno=sc1.sno

    
   --二、无关子查询
---无关子查询的执行不依赖于父查询。它执行的过程是：首先执行子查询语句，
---得到的子查询结果集传递给父查询语句使用。无关子查询中对父查询没有任何引用 

--例 查询与“李小刚”在同一个系学习的学生学号、姓名和所在系。
    --输出：学号、姓名和所在系
    --数据源：s
    --条件：与“李小刚”在同一个系 --> 查找李小刚所在的系（子查询）-->系
    select sno,sname,sdept 
    from s
    where sdept =(    
			select sdept from s
			where sname='李小刚')
    --无关子查询：子查询中不需要父表即可得到查询结果
    
    
    --该查询也可以用自身连接来完成：
     SELECT b.SNO,b.SNAME,b.SDEPT 
     FROM S AS a JOIN S AS b 
     ON a.SDEPT=b.SDEPT AND a.SNAME='李小刚'
     
     
     
     --例  查询选修了“C1”号课程的学生的姓名和所在专业。    
     
     --(1)子查询：查询选修了“C1”号课程的学生
     select sno from sc where cno='c1'
     ---(2)父查询：
     select sname,sdept from s
     where sno in (  select sno from sc where cno='c1'   )
     --当子查询返回是一个结果集的时候，必须用 in
     
     
     --例6.41 查询其它系中比计算机系某一学生年龄小的学生姓名和年龄。
     --1、计算机系学生的年龄：
     select age from s where SDEPT='计算机'
     --2、其他系的学生     
     select sname,age,sdept 
     from s
     where sdept not in('计算机')  and AGE< any (select age from s where SDEPT='计算机')     
     --all 全部  any 部分
     
     
     --max() 最大值  min()最小值  
     select sname,age,sdept 
     from s
     where sdept not in('计算机')  and AGE< (select max(age) from s where SDEPT='计算机')
     
     
     --相关子查询
    ---在相关子查询中，子查询的执行依赖于父查询，多数情况下是子查询的WHERE子句中引用了父查询的表。
    --一般情况下子查询单独执行没有结果
     --例  查询每一位学生比自己平均成绩高的所有成绩，并输出的学生的学号、课程号和成绩。
     select sno,cno,grade 
     from sc a 
     where GRADE >(select AVG(grade) from sc b where a.SNO=b.sno)  
     
     --无关子查询      
      select sc.sno,cno,grade from sc,(select SNO,AVG(grade) avgGrade from SC group by sno)  a
      where sc.sno=a.SNO and sc.GRADE>a.avgGrade 
     
     --相关子查询
     select  sno,cno,grade 
     from sc
     where GRADE >(select AVG(grade) 
                  from sc a 
                  group by sno
                  having sc.SNO=a.sno  ) 
                  
   ---- 带有EXISTS的子查询  只判断子查询的状态，有内容返回则True，否则false  返回内容不限。
        --where 不用关键字       
                  
      IF EXISTS(SELECT * FROM SYS.DATABASES WHERE NAME='JXGL') 
      DROP DATABASE JXGL
    
      

   --例6.43 查询所有选修了“C2”课程的姓名。
    select sname from s
    where exists( select * from sc where CNO='c2' and s.SNO=sc.SNO)
    
   -- 无关子查询实现  
   select sname from s where sno in (select sno from sc where CNO='c2')    

  
  
  
  
  select * from s  
  select * from sc  
  select * from c
  
  
  
