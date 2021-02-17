use employees;
select * from dept_manager;
# using a subquery to find their names:
select e.first_name, e.last_name
from employees e
where e.emp_no in (select dm.emp_no from dept_manager dm);

# IN (efficient with small amounts of data)
select * from dept_manager
where emp_no in (select emp_no 
from employees where hire_date 
between '1990-01-01' and '1995-01-01');

# EXISTS (efficient with large amounts of data)
select e.first_name, e.last_name from employees e where 
exists (select * from dept_manager dm where dm.emp_no = e.emp_no ) order by emp_no;

select first_name, last_name from employees where emp_no in
(select emp_no from titles where title = 'Assistant Engineer');
select e.first_name, e.last_name from employees e where
exists(select * from titles t where t.emp_no = e.emp_no and title = 'Assistant Engineer');
select count(title) from titles where title = 'Assistant Engineer';

# FROM 
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS Manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no < 10021
    GROUP BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS Manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020 AND e.emp_no < 10041
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS B;
    
create table if not exists emp_manager(
emp_no int not null,
dept_no char(4),
manager_no int not null);

insert into emp_manager select U.* from (select A.* from (select e.emp_no as emp_no, min(de.dept_no) as dept_no, 
(select emp_no from dept_manager where emp_no = 110022) as manager_no
from employees e join dept_emp de on de.emp_no = e.emp_no 
where e.emp_no < 10021 
group by e.emp_no)as A
union select B.* from(
select e.emp_no as emp_no, min(de.dept_no) as dept_no, 
(select emp_no from dept_manager where emp_no = 110039)
from employees e join dept_emp de on de.emp_no = e.emp_no
where e.emp_no > 10020 and e.emp_no < 10041
group by e.emp_no) as B
union select C.* from
(select e.emp_no as emp_no, min(de.dept_no) as dept_no,
(select emp_no from dept_manager where emp_no = 110039)
from employees e join dept_emp de on de.emp_no = e.emp_no
where e.emp_no = 110022) as C
union select D.* from
(select e.emp_no as emp_no, min(de.dept_no) as dept_no,
(select emp_no from dept_manager where emp_no = 110022)
from employees e join dept_emp de on de.emp_no = e.emp_no
where e.emp_no = 110039) as D) as U;
select * from emp_manager;