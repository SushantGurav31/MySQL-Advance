create table departments (
	dept_id serial primary key, 
	dept_name varchar(50)
);


create table employees (
	emp_id serial primary key,
	emp_name varchar(50),
	salary int,
	dept_id int references departments(dept_id)
);


create table projects (
	project_id serial primary key,
	project_name varchar (50),
	emp_id int references employees(emp_id)
);


insert into departments (dept_name) values 
('HR'),
('IT'),
('Sales');
select * from departments ;


insert into employees (emp_name, salary, dept_id) values 
('Amit', 50000, 1),
('Neha', 60000, 2),
('Rahul', 70000, 2),
('Priya', 45000, 3),
('Karan', 55000, null);

select * from employees ;


insert into projects (project_name, emp_id) values 
('Website', 2),
('App', 3),
('Recruitments', 1);

select * from projects;

-- Inner Join 
SELECT e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;


-- Left join 
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;


-- Right join 
SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;


-- Full Outer join 
SELECT e.emp_name, d.dept_name
FROM employees e
FULL OUTER JOIN departments d
ON e.dept_id = d.dept_id;


-- Cross join 
SELECT e.emp_name, d.dept_name
FROM employees e
CROSS JOIN departments d;


-- Aggregations
-- Group by 
SELECT dept_id, SUM(salary) AS total_salary
FROM employees
GROUP BY dept_id;

-- Count 
SELECT dept_id, COUNT(*) AS total_employees
FROM employees
GROUP BY dept_id;


-- Having 
SELECT dept_id, SUM(salary) AS total_salary
FROM employees
GROUP BY dept_id
HAVING SUM(salary) > 100000;

-- SET Operations 
-- UNION 
SELECT emp_name FROM employees
UNION
SELECT dept_name FROM departments;

-- INTERSECT
SELECT emp_name FROM employees
INTERSECT
SELECT dept_name FROM departments;

-- EXCEPT
SELECT emp_name FROM employees
EXCEPT
SELECT dept_name FROM departments;








