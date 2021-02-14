use employees;

# INSERT STATEMENT

select * from employees limit 5;
# insert new employees
insert into employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
values(999901, '1986-04-21', 'John', 'Smith', 'M', '2011-01-01');
select * from employees order by emp_no desc limit 2;
select * from titles limit 10;
insert into employees values(999903, '1977-09-14', 'Jonathan', 'Creek', 'M', '1999-01-01');
# insert new employee data to titles
insert into titles(emp_no, title, from_date) values(999903, 'Senior Engineer', '1999-10-01');
select * from titles order by emp_no desc;
select * from dept_emp limit 3;
# update dept_emp table. 
insert into dept_emp values (999903, 'd005', '1999-10-01', '9999-01-01');
select * from dept_emp order by emp_no desc;
select * from departments;
# insert new department into departments table. 
insert into departments values('d010', 'Business Analysis');
select * from departments order by dept_no desc;

# UPDATE STATEMENT
update departments set dept_name = 'Data Analysis' where dept_no = 'd010';
select * from departments order by dept_no desc;

# DELETE STATEMENT
delete from departments where dept_no = 'd010';
select * from departments order by dept_no desc;

# TRUNCATE V DROP
create table if not exists dept_dup(dept_no varchar(5), dept_name varchar(40));
insert into dept_dup select * from departments;
select * from dept_dup;
truncate dept_dup;
select * from dept_dup;
drop table dept_dup;
# Refresh list of tables from schema. The table should be non-existent. 