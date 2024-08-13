# Subqueries

select * 
from employee_demographics;


select *
from employee_salary;

-----
select * from 
employee_demographics
where employee_id in
	(select employee_id
		from employee_salary
        where dept_id = 1)
;

select * 
from employee_salary;
#find avg salary
select first_name, salary,
(select avg(salary)
from employee_salary)
from employee_salary;


select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender;


# avg 
select *
from
(select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender) as Agg_table;

select avg(`max(age)`)
from
(select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender) as Agg_table
;