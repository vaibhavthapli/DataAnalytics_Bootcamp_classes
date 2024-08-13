-- String Functions

select length("skyfall");

select first_name, length(first_name)
from employee_demographics
order by 2;

select upper("sky");
select lower("SKY");

-- trim

select trim('  sky   ');
select rtrim('     sky           ');

-- left & right
select first_name, left(first_name,4)
from employee_demographics;

select first_name, right(first_name,4)
from employee_demographics;

select first_name, substring(first_name,3,2) -- third position then 2
from employee_demographics;

select first_name,birth_date, substring(birth_date,6,2) as birth_month
from employee_demographics;

-- replace

select first_name, replace(first_name,'a','z')
from employee_demographics;

-- locate

select locate('a','Vaibhav');

select first_name, locate('An',first_name)
from employee_demographics;

-- concatinate

select first_name, last_name,
concat(first_name,' ',last_name) as full_name
from employee_demographics;



