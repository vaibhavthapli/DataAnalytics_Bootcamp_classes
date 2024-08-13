-- Unions

select first_name,last_name
from employee_demographics
union
select first_name,last_name
from employee_salary;

-- use case

select first_name, last_name, "Old Man" as label
from employee_demographics
where age > 40 and gender = "Male"
union
select first_name, last_name, "Old Lady" as label
from employee_demographics
where age > 40 and gender = "Female"
union
select first_name, last_name, 'Highly Paid Employee' as label
from employee_salary
where salary > 70000
order by first_name , last_name
;