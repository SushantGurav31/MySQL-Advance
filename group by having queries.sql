create database groupby;

use groupby;

CREATE TABLE Sales (
    id INT,
    product VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);

INSERT INTO Sales (id, product, category, quantity, price) VALUES
(1, 'Laptop', 'Electronics', 2, 50000.00),
(2, 'Phone', 'Electronics', 5, 20000.00),
(3, 'Tablet', 'Electronics', 3, 15000.00),
(4, 'Shirt', 'Clothing', 10, 800.00),
(5, 'Jeans', 'Clothing', 6, 1200.00),
(6, 'Shoes', 'Clothing', 4, 2500.00),
(7, 'Milk', 'Grocery', 15, 50.00),
(8, 'Bread', 'Grocery', 8, 40.00),
(9, 'Butter', 'Grocery', 5, 150.00);

select * from Sales;


-- total quantity sold by category
select category,sum(quantity) as toal_quantity
from Sales
group by category;


-- Average price by category
select category , avg(price) as avg_price
from Sales
group by category;


--  Count of products in each category
select category , count(product) as total_product
from Sales
group by category;


-- Height price item in each category
select category , max(price) as max_price
from Sales
group by category;





CREATE TABLE Employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);


INSERT INTO Employees (emp_id, emp_name, department, salary, city) VALUES
(1, 'Amit', 'HR', 40000, 'Pune'),
(2, 'Neha', 'IT', 60000, 'Mumbai'),
(3, 'Raj', 'Finance', 55000, 'Delhi'),
(4, 'Sneha', 'IT', 65000, 'Pune'),
(5, 'Karan', 'HR', 42000, 'Delhi'),
(6, 'Meena', 'Finance', 58000, 'Mumbai'),
(7, 'Vikas', 'IT', 70000, 'Delhi'),
(8, 'Pooja', 'HR', 39000, 'Pune'),
(9, 'Arjun', 'Finance', 60000, 'Delhi'),
(10, 'Simran', 'IT', 72000, 'Mumbai');

select * from Employees;

-- a) Average salary per department
select department, avg(salary) as avg_salary
from Employees
group by department;


-- c) Number of employees in each department
select department, count(emp_id) as total_emp_id
from Employees
group by department;


-- d) Total salary paid per department
select department, sum(salary) as total_salary
from Employees 
group by department;






-- HAVING EXAMPLE
-- a) Departments with average salary above 55,000
select department, avg(salary) as avg_salary 
from Employees
group by department
having avg(salary) > 55000;



-- b) Cities where more than 2 employees work
select city, count(emp_id) as total_employees
from Employees
group by city
having count(emp_id) >2;



-- c) Departments with total salary greater than 1,50,000
select department, sum(salary) as total_salary
from Employees
group by department
having sum(salary) > 150000;








