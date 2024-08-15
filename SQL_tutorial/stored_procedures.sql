# stored Procedures

select * 
from employee_salary;

# create  stored Procedures

create procedure large_salary()
select *
from employee_salary
where salary >= 50000;

# call the procedure
call large_salary();

------- Delimiter

delimiter $$
create procedure large_salary2()
Begin
	select *
	from employee_salary
	where salary >= 50000;
	select *
	from employee_salary
	where salary >= 10000;
end $$

delimiter ;

call large_salary2();

----  Prameter

delimiter $$
create procedure large_salary3(employee_id1 int)
Begin
	select salary
	from employee_salary
    where employee_id = employee_id1
	;
end $$

delimiter ;

call large_salary3(1)
