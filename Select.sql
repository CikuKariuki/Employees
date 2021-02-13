use employees;
select dept_no from departments;
select * from departments;
select * from employees where first_name = "Elvis";
select * from employees where first_name = "Kellie" and gender = "F";
select * from employees where first_name = "Kellie" or first_name = "Aruna";
select * from employees where gender = 'F' and (first_name= "Kellie" or first_name = "Aruna");

# Use in to select 
select * from employees where first_name in("Denis", "Elvis");

# Select everyone but John, Mark or Jacob
select * from employees where first_name not in("John", "Mark", "Jacob");

# Like - Not Like
select * from employees where first_name like("Mark%");
select * from employees where hire_date like ("%2000%");
select * from employees where emp_no like ('1000_');
select * from employees where first_name like('%jack%');
select * from employees where first_name not like('%jack%');

# between - and
select * from salaries;
select * from salaries where salary between 66000 and 70000;
select * from salaries where emp_no not between 10004 and 10012 group by emp_no;
select * from departments where dept_no between 'd003' and 'd006';

#null - not null
select dept_name from departments where dept_no is not null;
select * from employees where first_name is null;

# Operators
select * from employees where gender = 'F' and hire_date >= '2000-01-01';
select * from salaries where salary > '150000';

select distinct hire_date from employees;
select count(salary) from salaries where salary >= 100000;
# number of managers in the company
select * from dept_manager;
select count(*) from dept_manager;

# Order and grouping
select * from employees order by hire_date; 
select salary, count(emp_no) as emps_with_same_salary from salaries where salary > 80000 
group by salary
order by salary;

# Having
select emp_no, avg(salary) from salaries group by emp_no having avg(salary) > 120000 
order by emp_no;
select *, avg(salary) as average_salary from salaries group by emp_no having avg(salary) > 120000;
select * from dept_emp;
select emp_no from dept_emp where from_date > '2000-01-01' group by emp_no 
having count(from_date) > 1;

# Limit
select * from employees limit 100;