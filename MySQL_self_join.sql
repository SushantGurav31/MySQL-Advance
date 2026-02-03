create database MySQL_self_join;

use MySQL_self_join;

create table employees (
	emp_id int primary key ,
    emp_name varchar (50),
    manager_id int 
);

insert into employees (emp_id, emp_name, manager_id) values 
(1, 'Amit', NULL),			-- CEO
(2, 'Rohit', 1),			-- Report to Amit
(3, 'Neha', 1),				-- Report to Amit
(4, 'Priya', 2),			-- Report to Rohit
(5, 'Karan', 2),			-- Report to Rohit 
(6, 'Sneha', 3);			-- Report to Neha

select e.emp_name as Employee, m.emp_name as Manager 
from employees e 
left join employees m 
on e.manager_id = m.emp_id;


-- SELF JOIN (Employee → Manager)
select 
	e.emp_name as Employee,
    m.emp_name as Manager 
from employees e 
left join employees m 
on e.manager_id = m.emp_id ;


-- Employees with their Manager ID & Name
select 
	e.emp_id,
    e.emp_name,
    e.manager_id,
    m.emp_name as manager_name 
from employees e 
left join employees m 
on e.manager_id = m.emp_id;


-- Find Managers Only
select distinct m.emp_name as Manager 
from employees e 
join employees m 
on e.manager_id = m.emp_id ;


-- Employees Reporting to Amit
select e.emp_name 
from employees e 
join employees m 
on e.manager_id = m.emp_id 
where m.emp_name = 'Amit';



create table customers (
customer_id int primary key, 
customer_name varchar(50),
city varchar (50)
);

create table products (
product_id int primary key,
product_name varchar(50),
price decimal (10,2)
);

create table orders (
	order_id int primary key,
    customer_id int, 
    order_date date,
    foreign key (customer_id) references customers (customer_id)
);

create table order_items (
	order_item_id int primary key, 
    order_id int ,
    product_id int,
    quantity int,
    foreign key (order_id) references orders (order_id),
    foreign key (product_id) references products(product_id)
);

INSERT INTO customers VALUES
(1, 'Amit', 'Mumbai'),
(2, 'Neha', 'Pune'),
(3, 'Rohit', 'Delhi');

INSERT INTO products VALUES
(101, 'Laptop', 60000),
(102, 'Mobile', 30000),
(103, 'Headphones', 2000);

INSERT INTO orders VALUES
(1001, 1, '2025-01-10'),
(1002, 2, '2025-01-12'),
(1003, 1, '2025-01-15');

INSERT INTO order_items VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 102, 1),
(4, 1003, 103, 3);

select 
	c.customer_name,
    c.city,
    o.order_id,
    o.order_date,
    p.product_name,
    oi.quantity,
    p.price,
    (oi.quantity * p.price) as total_amount
from customers c 
join orders o 
	on c.customer_id = o.customer_id 
join order_items oi 
	on o.order_id = oi.order_id 
join products p 
	on oi.product_id = p.product_id;


select 
	c.customer_name, 
    sum(oi.quantity * p.price) as total_spent 
from customers c 
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id 
join products p on oi.product_id = p.product_id
group by c.customer_name;


select c.customer_name 
from customers c 
left join orders o 
on c.customer_id = o.customer_id
where o.order_id is null ;

SELECT p.product_name, SUM(oi.quantity) AS total_qty 
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_qty DESC
LIMIT 1;


select o.order_id, count(oi.product_id) as product_count
from orders o 
join order_items oi on o.order_id = oi.order_id 
group by o.order_id 
having count(oi.product_id) > 1;




CREATE TABLE employees_hr (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary INT
);

INSERT INTO employees_hr VALUES
(1, 'Amit',  'Management', NULL, 150000),  
(2, 'Rohit', 'IT',          1,    90000),
(3, 'Neha',  'HR',          1,    85000),
(4, 'Priya', 'IT',          2,    70000),
(5, 'Karan', 'IT',          2,    95000),  
(6, 'Sneha', 'HR',          3,    60000),
(7, 'Vikas', 'Finance',     1,    80000),
(8, 'Anita', 'Finance',     7,    50000),
(9, 'Raj',   'Sales',       NULL, 88000);

-- Display employee name and their manager name
select e.emp_name as Employee, m.emp_name as Manager 
from employees_hr e 
left join employees_hr m
on e.manager_id = m.emp_id;


 -- Find employees who earn more than their manager
 select e.emp_name 
 from employees_hr e 
 join employees_hr m 
 on e.manager_id = m.emp_id 
 where e.salary > m.salary;
 
 
 -- List employees who do not have a manager
 select emp_name 
 from employees_hr 
 where manager_id is null ;
 
 
 -- Find managers who manage more than 2 employees
 select m.emp_name as Manager, count(e.emp_id) as team_size 
 from employees_hr e 
 join employees_hr m 
 on e.manager_id = m.emp_id 
 group by m.emp_name 
 Having count(e.emp_id) > 2 ;
 
 -- Display employee → manager → manager’s manager (2-level hierarchy)
 select 
	e.emp_name as Employee, 
    m.emp_name as Manager, 
    mm.emp_name as Managers_Manager 
from employees_hr e 
left join employees_hr m 
	on e.manager_id = m.emp_id 
left join employees_hr mm 
	on m.manager_id = mm.emp_id;
 
 
 -- Find employees working in the same department as their manager
 select e.emp_name 
 from employees_hr e 
 join employees_hr m 
 on e.manager_id = m.emp_id
 where e.department = m.department;
 
 
 -- Count number of employees reporting to each manager
 select m.emp_name as Manager, count(e.emp_id) as total_reportees 
 from employees_hr e 
 join employees_hr m 
 on e.manager_id = m.emp_id 
 group by m.emp_name;
 
 
 -- Find employees whose manager’s salary is greater than 80,000
 select e.emp_name
 from employees_hr e 
 join employees_hr m 
 on e.manager_id = m.emp_id 
 where m.salary > 80000;
 
 
 -- Show employee details where manager belongs to a different department
 select e.emp_name, e.department, m.department as manager_department
 from employees_hr e 
 join employees_hr m 
 on e.manager_id = m.emp_id 
 where e.department <> m.department;
 
 
 -- List top-level managers (managers who report to no one)
select emp_name 
from employees_hr 
where manager_id is null ;


CREATE TABLE employees_payroll (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees_payroll VALUES
(1, 'Amit',  'IT',      90000),
(2, 'Neha',  'IT',      75000),
(3, 'Rohit', 'HR',      60000),
(4, 'Priya', 'HR',      82000),
(5, 'Karan', 'Finance', 95000),
(6, 'Sneha', 'Finance', 70000),
(7, 'Vikas', 'Sales',   50000),
(8, 'Anita', 'Sales',   65000);
select * from employees_payroll;

-- Employees earning more than average salary
CREATE TABLE employees_payroll (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees_payroll VALUES
(1, 'Amit',  'IT',      90000),
(2, 'Neha',  'IT',      75000),
(3, 'Rohit', 'HR',      60000),
(4, 'Priya', 'HR',      82000),
(5, 'Karan', 'Finance', 95000),
(6, 'Sneha', 'Finance', 70000),
(7, 'Vikas', 'Sales',   50000),
(8, 'Anita', 'Sales',   65000);
select * from employees_payroll;

-- Employees earning more than average salary
CREATE TABLE employees_payroll (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees_payroll VALUES
(1, 'Amit',  'IT',      90000),
(2, 'Neha',  'IT',      75000),
(3, 'Rohit', 'HR',      60000),
(4, 'Priya', 'HR',      82000),
(5, 'Karan', 'Finance', 95000),
(6, 'Sneha', 'Finance', 70000),
(7, 'Vikas', 'Sales',   50000),
(8, 'Anita', 'Sales',   65000);
select * from employees_payroll;

-- Employees earning more than average salary
SELECT emp_name, salary
FROM employees_payroll
WHERE salary > (SELECT AVG(salary) as average_salary FROM employees_payroll);


-- Employees working in departments with average salary > 75,000
SELECT emp_name, department
FROM employees_payroll
WHERE department IN (
    SELECT department
    FROM employees_payroll
    GROUP BY department
    HAVING AVG(salary) > 75000
);

-- Show employee salary and company average 
SELECT 
    emp_name,
    salary,
    (SELECT AVG(salary) FROM employees_payroll) AS avg_salary
FROM employees_payroll;

