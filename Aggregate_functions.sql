use employees;
select * from dept_emp;
# COUNT 
select count(distinct dept_no) from dept_emp;
select * from salaries limit 3;
# SUM 
select sum(salary) as total_salary from salaries where from_date > '1997-01-01';
# MIN and MAX
select min(emp_no), max(emp_no) from employees;
# AVERAGE
select avg(salary) from salaries where from_date > '1997-01-01';
# ROUND 
select round(avg(salary),2) from salaries where from_date > '1997-01-01';
# COALESCE and IFNULL
alter table departments add dept_manager varchar(30);
select * from departments;
alter table departments modify dept_name varchar(40) null;
insert into departments(dept_no) values ('d010'),('d011');
select dept_no, ifnull(dept_name, 'Not provided') as dept_name from departments;
select * from departments;
select dept_no, dept_name, coalesce(dept_manager, dept_name, 'Not Provided') as dept_manager from departments;
select dept_no, ifnull(dept_name, 'Not Provided') as dept_name, coalesce(dept_manager, dept_name, 'Not Provided') as dept_manager from departments;
