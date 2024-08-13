-- Limit & Aliasing

select *
from employee_demographics
limit 3;

select *
from employee_demographics
order by age desc
limit 3;

select *
from employee_demographics
order by age desc
limit 1, 2
;

-- Alaising
select gender, avg(age)
from employee_demographics
group by gender;

select gender, avg(age) as avg_age
from employee_demographics
group by gender
having avg_age > 40
;