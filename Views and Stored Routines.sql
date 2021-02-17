use employees;
select * from dept_emp;
select emp_no, from_date, to_date, count(emp_no) as num
from dept_emp group by emp_no having num > 1;

create or replace view w_dept_emp_latest_date as 
select emp_no, max(from_date) as from_date, max(to_date) as to_date
from dept_emp 
group by emp_no;

create or replace view w_manager_avg_salary as
select round(avg(s.salary),2) from salaries s join 
dept_manager dm on s.emp_no = dm.emp_no;

# STORED ROUTINES (Stored procedures and functions)

# STORED PROCEDURES
 drop procedure if exists select_employees;
delimiter $$
create procedure select_employees()
begin
select * from employees limit 1000;
end $$
delimiter ;
call select_employees();

drop procedure if exists avg_salary;
delimiter $$
create procedure avg_salary()
begin
select round(avg(salary),2) from salaries;
end $$
delimiter ;
call avg_salary();

# Stored procedures with an input parameter
drop procedure if exists emp_salary;
delimiter $$
create procedure emp_salary(in p_emp_no int)
begin
select e.first_name, e.last_name, s.salary, s.from_date, s.to_date
from employees e
join salaries s on s.emp_no = e.emp_no
where e.emp_no = p_emp_no;
end $$
delimiter ;
call emp_salary(110022);

# Stored procedure with an input and output parameter.
drop procedure if exists emp_avg_salary;
delimiter $$
create procedure emp_avg_salary(in p_emp_no int, out p_avg_salary decimal(10,2))
begin
select avg(salary) into
p_avg_salary from employees e
join salaries s on e.emp_no = s.emp_no
where e.emp_no = p_emp_no;
end $$
delimiter ;

drop procedure if exists emp_info;
delimiter $$
create procedure emp_info(in p_first_name varchar(20), in p_last_name varchar(20), out p_emp_no int)
begin
select e.emp_no into p_emp_no from employees e
where e.first_name = p_first_name and e.last_name = p_last_name;
end $$
delimiter ;

# USER DEFINED FUNCTIONS

