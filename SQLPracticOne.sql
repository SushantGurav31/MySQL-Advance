create database SQLPracticOne;

use SQLPracticOne;

create table Employees (
id int,
first_name VARCHAR(50),
last_name VARCHAR(50),
salary decimal (10,2),
department_id int,
hire_date VARCHAR(50)


);

insert into Employees(id, first_name, last_name, salary, department_id, hire_date) values(1, "Alice", "Johnson", 60000, 1, "2020-01-15");

insert into Employees(id, first_name, last_name, salary, department_id, hire_date) values(2, "Bob", "Smith", 45000, 2, "2019-03-22");

insert into Employees(id, first_name, last_name, salary, department_id, hire_date) values(3, "Charlie", "Brown", 70000, 1, "2021-07-10");

insert into Employees(id, first_name, last_name, salary, department_id, hire_date) values(4, "David", "Wilson", 55000, 3, "2018-11-05");

insert into Employees(id, first_name, last_name, salary, department_id, hire_date) values(5, "Eva", "Davis", 50000, NULL, "2022-05-12");

insert into Employees(id, first_name, last_name, salary, department_id, hire_date) values(6, "Frank", "Miller", 65000, 2, "2020-09-30");

insert into Employees(id, first_name, last_name, salary, department_id, hire_date) values(7, "Grace", "lee", 48000, 5, "2017-06-18");


-- 1 
select * from employees;

-- 2
select first_name, salary from employees;

-- 3
select * from employees where salary > 50000;

-- 4
select * from employees order by hire_date desc;

-- 5
select count(*) as count_id from employees;

-- 6
select avg(salary) as avg_salary from employees;

-- 7
select department_id, count(*) AS num_employees from employees group by department_id;

-- 8
update employees set salary = salary*1.20 where department_id=5; 

-- 9
delete from employees where department_id is NULL;



