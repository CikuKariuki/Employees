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

