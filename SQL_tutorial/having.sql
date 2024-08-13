select *
from parks_and_recreation.employee_demographics;

-- Having vs Where

select gender, avg(age)
from parks_and_recreation.employee_demographics
where avg(age) >= 40
group by gender;

select gender, avg(age)
from parks_and_recreation.employee_demographics
group by gender
having avg(age) >40;

select *
from employee_salary;

select occupation, avg(salary)
from employee_salary
group by occupation
;

select occupation, avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation
;

select occupation, avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) >75000
;