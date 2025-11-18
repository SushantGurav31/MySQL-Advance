create database MySQL_Operators;

use MySQL_Operators;

CREATE TABLE Employees (
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    join_date DATE
);

INSERT INTO Employees (emp_id, name, department, salary, join_date) VALUES
(1, 'Amit', 'HR', 40000, '2021-05-10'),
(2, 'Sneha', 'IT', 55000, '2020-02-15'),
(3, 'Rohit', 'Finance', 60000, '2019-11-20'),
(4, 'Priya', 'IT', 75000, '2022-01-12'),
(5, 'Vikas', 'HR', 30000, '2023-07-05');

select * from Employees;

-- Comparision of letters
-- Employees with salary greater than 50,000
select * from Employees where salary > 50000;


--  Employees who joined before 2022
select * from Employees Where join_date < "2022-01-01";


-- Employees with salary equal to 40000
SELECT * FROM Employees WHERE salary = 40000;



-- Logical Operators 
-- Employees in IT dept with salary > 60000
SELECT * FROM Employees WHERE department = 'IT' AND salary > 60000;


-- Employees in HR or Finance
SELECT * FROM Employees WHERE department = 'HR' OR department = 'Finance';


-- Employees not in IT
SELECT * FROM Employees WHERE NOT department = 'IT';


-- between Operator
-- Employees with salary between 40k and 70k
SELECT * FROM Employees WHERE salary BETWEEN 40000 AND 70000;


-- in operator 
-- Employees fromm HR and IT
select * from Employees where department in ("HR","IT");




-- LIKE Operator (Pattern Matching)
-- Employees whose name starts with 'S'
SELECT * FROM Employees WHERE name LIKE 'S%';

-- Employees whose name ends with 'a'
SELECT * FROM Employees WHERE name LIKE '%a';



 -- IS NULL Operator
-- If some salary values were NULL
SELECT * FROM Employees WHERE salary IS NULL;







