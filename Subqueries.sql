use employees;
select * from dept_manager;
# using a subquery to find their names:
select e.first_name, e.last_name
from employees e
where e.emp_no in (select dm.emp_no from dept_manager dm);

select * from dept_manager
where emp_no in (select emp_no 
from employees where hire_date 
between '1990-01-01' and '1995-01-01');
