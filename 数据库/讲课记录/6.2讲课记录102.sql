--6.2 ���Ӳ�ѯ
--1��������õ�ʱ�����   table.���ԣ� �����������Ψһ�ģ�����д�ϱ�����
  --��������ѧ����ѧ�ţ�����,�γ̺ţ��ɼ�����s,sc��
  select s.sno,sname,cno,grade from s,sc
  where s.sno=sc.sno
--2�����Ӳ�ѯ 
    --��1�������Ӳ�ѯ --��ʾ��������������Ԫ��
   /* SELECT <Ŀ���б��ʽ> [, �� n]
    FROM <��1> INNER JOIN <��2>
    ON <�����������ʽ>[, �� n]*/
   
   -- ��  ��ѯÿ��ѧ������ѡ�޿γ̵����
   select s.*,sc.*
   from s inner join sc
   on s.sno=sc.sno   
   
   select s.*,sc.*
   from sc inner join s
   on s.sno=sc.sno
   
   
   --��  ��SC���У���ѯѡ�ޡ�C1���γ̳ɼ�����ѧ��Ϊ��S1��ͬѧ�ɼ�������ѧ��Ԫ�飬�����ɼ��������С�
	SELECT a.SNO,a.CNO,a.GRADE
	FROM SC a INNER JOIN SC b
	ON a.CNO='C1' AND a.GRADE>b.GRADE AND b.SNO='S1' AND b.CNO='C1'
	ORDER BY GRADE DESC
	
	
	--��  ��ѯ70������ѧ����ѧ�š�������ѡ�޿γ̺š�ѡ�޿γ����ͳɼ������漰����������ӷ����� 
	SELECT S.SNO,S.SNAME,SC.CNO,C.CNAME,SC.GRADE
	FROM S 
	JOIN SC
	ON S.SNO=SC.SNO AND GRADE>=70
	JOIN C 
	ON SC.CNO=C.CNO 
	
	--��ֵ��ѯ
	SELECT S.SNO,S.SNAME,SC.CNO,C.CNAME,SC.GRADE
	FROM S,sc,c
	where s.sno=sc.sno and c.cno=sc.cno and sc.grade>70
	


   
    
    
    --��2�������Ӳ�ѯ
   /*���������Ƕ�����������ߵı������ơ�����߱�Ԫ�����ұ߱�Ԫ�鲻ƥ��ʱ�����ұ߱����Ӧ��ֵȡNULL������ʽ���£�
    SELECT <Ŀ���б��ʽ>[, �� n]
    FROM <��1>LEFT[OUTER]JOIN <��2>[, �� n]
    ON <�����������ʽ>*/
    
   select s.*,sc.*
   from s left join sc
   on s.sno=sc.sno
   
   --(3) ��������(���ұ߱�������Ϊ��׼�� )
/*���������Ƕ����������ұߵı������ơ����ұ߱�Ԫ������߱�Ԫ�鲻ƥ��ʱ������߱����Ӧ��ֵȡNULL������ʽ���£�
SELECT <Ŀ���б��ʽ>[, �� n]
FROM <��1> RIGHT [OUTER] JOIN <��2>[, �� n]
ON <�����������ʽ>*/

 select * into s1 from s
 select * into sc1 from sc
 
 select * from sc1
 
 
   select s1.*,sc1.*
   from s1 right join sc1
   on s1.sno=sc1.sno
   
   --(4) ȫ�����ӣ��������ݶ���ʾ��
/*ȫ�������Ƕ������������������������ơ���һ�߱�Ԫ������һ�߱�Ԫ�鲻ƥ��ʱ��
����һ�߱����Ӧ��ֵȡNULL������ʽ���£�
SELECT <Ŀ���б��ʽ> [, �� n]
FROM <��1> FULL [OUTER] JOIN <��2>[, �� n]
ON <�����������ʽ>*/


   select s1.*,sc1.*
   from s1 full join sc1
   on s1.sno=sc1.sno

    
   --�����޹��Ӳ�ѯ
---�޹��Ӳ�ѯ��ִ�в������ڸ���ѯ����ִ�еĹ����ǣ�����ִ���Ӳ�ѯ��䣬
---�õ����Ӳ�ѯ��������ݸ�����ѯ���ʹ�á��޹��Ӳ�ѯ�жԸ���ѯû���κ����� 

--�� ��ѯ�롰��С�ա���ͬһ��ϵѧϰ��ѧ��ѧ�š�����������ϵ��
    --�����ѧ�š�����������ϵ
    --����Դ��s
    --�������롰��С�ա���ͬһ��ϵ --> ������С�����ڵ�ϵ���Ӳ�ѯ��-->ϵ
    select sno,sname,sdept 
    from s
    where sdept =(    
			select sdept from s
			where sname='��С��')
    --�޹��Ӳ�ѯ���Ӳ�ѯ�в���Ҫ�����ɵõ���ѯ���
    
    
    --�ò�ѯҲ������������������ɣ�
     SELECT b.SNO,b.SNAME,b.SDEPT 
     FROM S AS a JOIN S AS b 
     ON a.SDEPT=b.SDEPT AND a.SNAME='��С��'
     
     
     
     --��  ��ѯѡ���ˡ�C1���ſγ̵�ѧ��������������רҵ��    
     
     --(1)�Ӳ�ѯ����ѯѡ���ˡ�C1���ſγ̵�ѧ��
     select sno from sc where cno='c1'
     ---(2)����ѯ��
     select sname,sdept from s
     where sno in (  select sno from sc where cno='c1'   )
     --���Ӳ�ѯ������һ���������ʱ�򣬱����� in
     
     
     --��6.41 ��ѯ����ϵ�бȼ����ϵĳһѧ������С��ѧ�����������䡣
     --1�������ϵѧ�������䣺
     select age from s where SDEPT='�����'
     --2������ϵ��ѧ��     
     select sname,age,sdept 
     from s
     where sdept not in('�����')  and AGE< any (select age from s where SDEPT='�����')     
     --all ȫ��  any ����
     
     
     --max() ���ֵ  min()��Сֵ  
     select sname,age,sdept 
     from s
     where sdept not in('�����')  and AGE< (select max(age) from s where SDEPT='�����')
     
     
     --����Ӳ�ѯ
    ---������Ӳ�ѯ�У��Ӳ�ѯ��ִ�������ڸ���ѯ��������������Ӳ�ѯ��WHERE�Ӿ��������˸���ѯ�ı�
    --һ��������Ӳ�ѯ����ִ��û�н��
     --��  ��ѯÿһλѧ�����Լ�ƽ���ɼ��ߵ����гɼ����������ѧ����ѧ�š��γ̺źͳɼ���
     select sno,cno,grade 
     from sc a 
     where GRADE >(select AVG(grade) from sc b where a.SNO=b.sno)  
     
     --�޹��Ӳ�ѯ      
      select sc.sno,cno,grade from sc,(select SNO,AVG(grade) avgGrade from SC group by sno)  a
      where sc.sno=a.SNO and sc.GRADE>a.avgGrade 
     
     --����Ӳ�ѯ
     select  sno,cno,grade 
     from sc
     where GRADE >(select AVG(grade) 
                  from sc a 
                  group by sno
                  having sc.SNO=a.sno  ) 
                  
   ---- ����EXISTS���Ӳ�ѯ  ֻ�ж��Ӳ�ѯ��״̬�������ݷ�����True������false  �������ݲ��ޡ�
        --where ���ùؼ���       
                  
      IF EXISTS(SELECT * FROM SYS.DATABASES WHERE NAME='JXGL') 
      DROP DATABASE JXGL
    
      

   --��6.43 ��ѯ����ѡ���ˡ�C2���γ̵�������
    select sname from s
    where exists( select * from sc where CNO='c2' and s.SNO=sc.SNO)
    
   -- �޹��Ӳ�ѯʵ��  
   select sname from s where sno in (select sno from sc where CNO='c2')    

  
  
  
  
  select * from s  
  select * from sc  
  select * from c
  
  
  
