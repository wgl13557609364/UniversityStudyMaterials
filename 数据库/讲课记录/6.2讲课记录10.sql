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
     
     
     --��6.41 ��ѯ����ϵ�бȼ����ϵ��һѧ������С��ѧ�����������䡣
     
     
     
     
     
     

     
     

    
    

  
  
  
  
  select * from s  
  select * from sc
  
  select * from c
  
  
  
