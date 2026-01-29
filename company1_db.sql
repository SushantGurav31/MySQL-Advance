create database company1_db;

use company1_db;

create table employees (
	emp_id int,
    name varchar (50),
    email varchar (50),
    salary int,
    department varchar(50),
    join_date date 
);

alter table employees add primary key (emp_id);

alter table employees modify salary decimal(10,2);

alter table employees add status varchar(20) default "ACTIVE";

alter table employees rename column name to emp_name;

alter table employees rename to employee_master;

alter table employee_master drop column status;

drop table employee_master;


insert into employees values (101, 'amit', 'amit@gmail.com', 50000, 'IT', '2023-01-10' );

INSERT INTO employees VALUES
(102,'Neha', 'neha@gmail.com', 60000, 'HR', '2022-05-12'),
(103,'Raj', 'raj@gmail.com', 70000, 'IT', '2021-03-15');

insert into employees (emp_id,emp_name, salary) values (104,'Sita', 45000);

insert into employees values (105, 'Ravi', 'ravi@gmail.com', 40000, 'Finance', '2020-11-20');

insert into employees values 
(106, 'Anil', 'anil@gmail.com', 55000, 'IT', curdate());

insert into employees (emp_id,emp_name)
values (107, 'Pooja');

insert into employees_archive
select * from employees;

insert into employees values 
(108, 'Karan', null,null,null,null);

insert into employees values 
(109, 'Meera', 'meera@gmail.com', default, 'HR', '2024-02-01');

insert into employees values 
(101, 'Duplicate', 'duplicate.com', 30000,'IT' '2023-01-01');

select * from employees;

select emp_name, salary from employees ;

select distinct department from employees;

select * from employees where salary > 50000;

select * from employees where department = 'IT';

select * from employees where join_date > '2023-01-01';

select * from employees order by salary asc;

select * from employees order by join_date desc;

select * from employees where salary is null ;

select * from employees where salary between 30000 and 80000;

select * from employees where department in ('IT', 'HR');

select * from employees where salary != 50000;

select * from employees where emp_name like 'A%';

select * from employees where emp_name like 'n%';

select * from employees where emp_name like '%ar%';

select * from employees where department in ('IT', 'Finance');

select * from employees where department not in ('HR');

select * from employees where email is null ;

select * from employees where email is not null ;



-- Find total number of employees.
select count(*) as total_Emp from employees ;


-- Find average salary of employees.
select avg(salary) as avg_salary from employees ;


-- Find highest salary.
select max(salary) as highest_salary from employees ;


-- Find lowest salary.
select min(salary) as lowest_salary from employees ;


-- Find department-wise employee count.
select department, count(*) as employee_count from employees group by department;


-- Find department-wise average salary.
select department, avg(salary) as avg_salary from employees group by department;


-- Display departments having more than 3 employees.
select department from employees group by department having count(*) > 3 ;


-- Display total salary paid per department.
select department, sum(salary) from employees group by department;


-- Display departments with average salary greater than 60,000.
select department from employees group by department having avg(salary) > 6000;


-- Count employees joined in each year.
select year(join_date), count(*) from employees group by year (join_date);


-- Update salary of employee with emp_id = 101.
update employees set salary = 60000 where emp_id = 101;


-- Increase salary by 10% for IT department.
update employees set salary = salary * 1.10 where department = 'IT';


-- Update department to Admin where department is NULL.
update employees set department = 'Admin' where department is null ;


-- Update multiple columns in a single query.
update employees set salary = 50000, department = 'HR' where emp_id = 107;


-- Set salary to NULL for employees in HR.
update employees set salary = null where department = 'HR';


-- Delete employee with emp_id = 110.
delete from employees where emp_id = 110;


-- Delete employees with salary less than 20,000.
delete from employees where salary < 20000 ;


-- Delete employees whose department is NULL.
delete from employees where department is null;


-- Delete all employees (without dropping table).
delete from employees ;


-- Delete employees joined before 2020-01-01.
delete from employees where join_date < '2020=01-01';


-- Create table with PRIMARY KEY and NOT NULL.
create table example1 (
id int primary key,
name varchar (50) not null 
);


-- Create table with UNIQUE email constraint.
create table example2 (
email varchar(50) unique
);


-- Create table with DEFAULT salary.
create table example3 (
salary int default 20000
);


-- Create table with CHECK constraint on salary.
create table example4 (
salary int check (salary > 0)
);


-- Add FOREIGN KEY between employees and departments.
alter table employees add constraint fk_dept foreign key (department) references departments (dept_name);


-- Insert data violating PRIMARY KEY.
insert into example1 values(1, 'A');
insert into example1 values(1, 'b');


-- Insert data violating UNIQUE constraint.
insert into example2 values ('a@gmail.com'); 


-- Insert data violating FOREIGN KEY.
insert into employees values (200, 'x', 'x@gmail.com', 40000, 'Uknown', '2023-01-01');


-- Drop a constraint from a table.
alter table employees drop foreign key fk_dept;


-- Disable foreign key checks temporarily.
set foreign_key_checks = 0;


-- Create departments table.
create table department (
	d_id int primary key ,
    d_name varchar(50)
);

-- Display employees with their department names using INNER JOIN.
select e.emp_name, d.d_name 
from employees e 
inner join department d 
on e.department = d.d_name;

-- Display all employees even if department is missing (LEFT JOIN).
select * from employees e 
left join department d 
on e.department = d.d_name;


-- Display all departments even if no employees (RIGHT JOIN).
select * from employees e 
right join department d 
on e.department = d.d_name ;


-- Display matching records using NATURAL JOIN.
select * from employees natural join department;


-- Display all combinations of employees and departments.
select * from employees cross join department;


-- Find employees working in IT.
select * from employees where department = "IT";


-- Count employees per department using JOIN.
select d.d_name, count(e.emp_id) 
from department d 
left join employees e 
on d.d_name = e.department
group by d.d_name;


-- Display employees whose department does not exist.
select * from employees e 
left join department d 
on e.department = d.d_name 
where d.d_name is null ;

 
-- Join same table to find manager-employee relation.
select e1.emp_name, e2.emp_name as manager 
from employees e1 
join employees e2 
on e1.manager_id = e2.emp_id;



-- Display employee with highest salary.
select * from employees 
where salary = (select max(salary) from employees);


-- Display employees earning more than average salary.
select * from employees 
where salary > (select avg(salary) from employees );


-- Display employees from department having highest average salary.
select * from employees
where department = 
(select department from employees 
group by department order by avg(salary) desc limit 1);


-- Display employees whose salary equals max salary.
select * from employees 
where salary = (select max(salary) from employees);


-- Display department with maximum employees.
select department from employees 
group by department order by count(*) desc limit 1 ;


-- 86. Display employees not in IT department using subquery.
SELECT * FROM employees 
WHERE dept_name NOT IN (select dept_name from employees where dept_name ='IT');

-- 87. Display employees joined in latest year.
SELECT * FROM employees 
WHERE YEAR(join_date) = (select max(YEAR(join_date)) FROM employees);

-- 88. Display second highest salary.
select max(salary) FROM employees 
where salary < (select max(salary) from employees);

-- 89. Display employees earning more than department average.
select * from employees e
where salary > (select avg(salary) from employees where dept_name = e.dept_name);

-- 90. Delete employees earning below average salary.
DELETE FROM employees
where salary < (select avg(salary) from employees);
