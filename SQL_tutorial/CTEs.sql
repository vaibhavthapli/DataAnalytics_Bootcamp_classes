# CTEs : Common table expression

select gender, avg(salary), max(salary), min(salary), count(salary)
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender;


--- apply CTEs

with CTE_EXAMPLE as
(
select gender, avg(salary) avg_sal, max(salary) max_avg, min(salary) min_avg, count(salary) count_sal
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender
)
select avg(avg_sal)
 from CTE_EXAMPLE
;


with CTE_EXAMPLE (Gender, AVG_Sal, Max_Sal, Min_Sal,Count_Sal) as
(
select gender, avg(salary) , max(salary), min(salary) , count(salary) 
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender
)
select *
 from CTE_EXAMPLE
;

--- subquery

select avg(avg_sal)
from (
select gender, avg(salary) avg_sal, max(salary) max_avg, min(salary) min_avg, count(salary) count_sal
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender
) example_subquery;


---- multiple CTEs

with CTE_EXAMPLE as
(
select employee_id, gender, birth_date
from employee_demographics 
where birth_date > '1985-01-01'
),
CTE_EXAMPLE2 as
(
select employee_id, salary
from employee_salary
where salary > 50000
)
select *
from CTE_EXAMPLE
join CTE_EXAMPLE2
	on CTE_EXAMPLE.employee_id = CTE_EXAMPLE2.employee_id
;

-----



