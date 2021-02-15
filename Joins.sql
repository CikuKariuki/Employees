use employees;
alter table departments drop column dept_manager;
select * from departments;
create table dept_dup (dept_no varchar(6) not null, dept_name varchar(30) null);
insert into dept_dup select * from departments;
select * from dept_dup;
alter table dept_dup change column dept_no dept_no varchar(6) null;
insert into dept_dup(dept_name) values ('Public Relations');
select * from dept_dup;
delete from dept_dup where dept_no = 'd002';
select * from dept_dup order by dept_no;
drop table if exists dept_manager_dup;
create table dept_manager_dup(
emp_no int not null, 
dept_no char(4),
from_date date not null,
to_date date);
insert into dept_manager_dup select * from dept_manager;
insert into dept_manager_dup(emp_no, from_date) 
values(999904, '2021-01-01'),
(999905, '2021-01-01'),
(999906, '2021-01-01'),
(999907, '2021-01-01');
delete from dept_manager_dup where dept_no = 'd001';

# INNER JOIN
select dm.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date 
from dept_manager dm
join employees e
on dm.emp_no = e.emp_no;

# LEFT JOIN 
# Find out if there is a manager whose last name is Markovitch, using left join. 
select e.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
from employees e
left join dept_manager dm
on dm.emp_no = e.emp_no
where e.last_name = 'Markovitch'
order by dept_no desc, emp_no;
select * from dept_manager;

# RIGHT JOIN
select s.emp_no, t.title, max(t.from_date) as from_date
from salaries s
right join titles t
on s.emp_no = t.emp_no
group by s.emp_no;

select * from titles;
select e.first_name, e.last_name, e.hire_date, t.title
from employees e
join titles t 
on e.emp_no = t.emp_no
where e.first_name = 'Margareta' and e.last_name = 'Markovitch';

# CROSS JOIN
select dm.*, d.* from dept_manager dm
cross join departments d
on dm.dept_no = d.dept_no
where dm.dept_no = 'd009';
select e.*, de.* from employees e
cross join dept_emp de
on e.emp_no = de.emp_no
where e.emp_no <= 10010
group by e.emp_no
order by e.emp_no;

# JOINING MORE THAN 2 TABLES
select e.first_name, e.last_name, e.hire_date, t.title, dm.from_date, d.dept_name
from employees e 
join titles t
on t.emp_no = e.emp_no
join dept_manager dm
on dm.emp_no = e.emp_no
join departments d
on dm.dept_no = d.dept_no
where t.title = 'Manager';
# How many M and F managers do we have in the db.
select e.gender, count(e.gender) from employees e
join dept_manager dm 
on dm.emp_no = e.emp_no
group by e.gender;
# or
select e.gender, count(dm.emp_no)
from employees e 
join dept_manager dm on dm.emp_no = e.emp_no
group by gender; 

# UNION V UNION ALL
select * from 
(select e.emp_no, e.first_name, e.last_name, null as dept_no, null as from_date
from employees e where last_name = 'Denis' 
union select null as emp_no, null as first_name, 
null as last_name, dm.dept_no, dm.from_date from dept_manager dm)
 as a order by -a.emp_no desc;