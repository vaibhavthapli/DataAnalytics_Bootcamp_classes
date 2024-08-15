# Triggers and Events

select *
from employee_demographics; 

select *
from employee_salary;


--- insert data in salary table and want automatically update in demographics table

DROP TRIGGER IF EXISTS employee_insert2;
-----

delimiter $$
create trigger employee_insert
	after insert on employee_salary  #insert
    for each row 
begin
	-- Insert into employee_demographics
	insert into employee_demographics (employee_id, first_name, last_name)
    values (new.employee_id, new.first_name, new.last_name);
    
   
end $$

delimiter ;

insert into employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
values(14,'vaibhav', 'Saperstein', 'fight' , 2000000, null);

select *
from employee_salary;

select *
from employee_demographics; 


# Events

-- checks every day/month to delete those people who are over age of 60

delimiter $$
create event delete_retirees
# on schedule every 1 month
on schedule every 30 second
do
begin
	delete
    from employee_demographics
    where age >=60;
end $$

delimiter ;

show variables like 'event%';


