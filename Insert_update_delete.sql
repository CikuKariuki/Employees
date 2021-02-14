use employees;
select * from employees limit 5;
insert into employees (emp_no, birth_date, first_name, last_name, gender, hire_date)
values(999901, '1986-04-21', 'John', 'Smith', 'M', '2011-01-01');
select * from employees order by emp_no desc limit 2;
select * from titles limit 10;
insert into employees values(999903, '1977-09-14', 'Jonathan', 'Creek', 'M', '1999-01-01');
insert into titles(emp_no, title, from_date) values(999903, 'Senior Engineer', '1999-10-01');
select * from titles order by emp_no desc;
select * from dept_emp limit 3;
insert into dept_emp values (999903, 'd005', '1999-10-01', '9999-01-01');
select * from dept_emp order by emp_no desc;
