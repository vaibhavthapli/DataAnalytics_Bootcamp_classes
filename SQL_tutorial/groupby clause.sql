-- Group By

SELECT * 
FROM parks_and_recreation.employee_demographics;

SELECT gender
FROM parks_and_recreation.employee_demographics
group by gender
;

SELECT gender, avg(age)
FROM parks_and_recreation.employee_demographics
group by gender
;

SELECT occupation, salary
FROM parks_and_recreation.employee_salary
group by occupation, salary
;

SELECT gender, avg(age), max(age), min(age), count(age)
FROM parks_and_recreation.employee_demographics
group by gender
;

-- order by

select *
from parks_and_recreation.employee_demographics;

select *
from parks_and_recreation.employee_demographics
order by first_name;

select *
from parks_and_recreation.employee_demographics
order by first_name desc;

select *
from parks_and_recreation.employee_demographics
order by gender ,age;

select *
from parks_and_recreation.employee_demographics
order by age, gender;

select *
from parks_and_recreation.employee_demographics
order by 5,4
;