/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM master.dbo.jobs

  --find 2nd highest max_salary

  select distinct max_salary 
  from jobs j1
  where 1=
  (select count(distinct max_salary) 
  from jobs j2 
  where j1.max_salary<j2.max_salary)

  select max_salary
  from jobs
  order by max_salary desc


  --monthly salary

  select max_salary/12 as "monthly salary" 
  from jobs

  --select first record from table

  Select * 
  from jobs 
  where job_id =1;

  ---select last record from table

  Select * 
  from jobs 
  where job_id= 
  (select max(job_id) 
  from jobs)

  --select last 5 records from table

select * 
from (
    select top 5 job_id 
    from jobs 
    order by job_id desc
) a 
order by job_id asc

--or

select * from jobs
where job_id > 
( (select COUNT(*) from jobs) - 5)

--top 3 salaries

select distinct max_salary 
from jobs a 
where 3 >= 
(select count(distinct max_salary) 
from jobs b 
where a.max_salary <= b.max_salary) 
order by a.max_salary desc;

--find min/max salary using union

Select max(max_salary) from jobs
Union
Select min(max_salary) from jobs;


SELECT *
FROM jobs
where job_id IN
	(SELECT job_id
	FROM jobs
	where max_salary = 5500)

--select ids over 300


 SELECT * 
  FROM [AdventureWorks2019].[Sales].[vStoreWithDemographics]
  where BusinessEntityID >
  (SELECT BusinessEntityID
  FROM [AdventureWorks2019].[Sales].[vStoreWithContacts]
  where BusinessEntityID = '300')

   