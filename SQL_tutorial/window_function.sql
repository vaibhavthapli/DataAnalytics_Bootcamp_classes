# Window Functions 

select * 
from employee_demographics;

select gender, avg(salary) as avg_salary
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender ;

select dem.first_name, dem.last_name, gender, avg(salary) as avg_salary
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by dem.first_name, dem.last_name, gender ;


-- use window function

select dem.first_name, dem.last_name, gender, avg(salary) over(partition by gender)
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
;

---- 
select dem.first_name, dem.last_name, gender, 
sum(salary) over(partition by gender)
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
# rolling total

select dem.first_name, dem.last_name, gender, 
sum(salary) over(partition by gender order by dem.employee_id) as Rolling_Total
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
---- Row_Numnber & Rank

select dem.first_name, dem.last_name, gender, salary,
row_number() over(order by salary desc) as row_num,
rank() over( order by salary desc) as rank_num,
dense_rank() over( order by salary desc) as dense_rank_num
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
# Lag and Lead


SELECT *,
LAG(salary) OVER(PARTITION BY department ORDER BY employee_id)
FROM employees
;

SELECT *, lag_col - salary AS pay_discrepancy
FROM
(SELECT *,
LEAD(salary) OVER(PARTITION BY department ORDER BY employee_id) AS lag_col
FROM employees) AS lag_table
;


SELECT *, IF(salary > lag_col, 'More','Less')
FROM
(SELECT *,
LEAD(salary) OVER(PARTITION BY department ORDER BY employee_id) AS lag_col
FROM employees) AS lag_table
;