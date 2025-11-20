create database Exists1;

use Exists1;

CREATE TABLE Employees (
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO Employees VALUES
(1, 'Amit', 'IT'),
(2, 'Sneha', 'HR'),
(3, 'Rahul', 'Finance'),
(4, 'Priya', 'IT'),
(5, 'Karan', 'Marketing');
select * from Employees;



CREATE TABLE Projects (
    project_id INT,
    emp_id INT,
    project_name VARCHAR(50)
);

INSERT INTO Projects VALUES
(101, 1, 'Website Development'),
(102, 1, 'Database Migration'),
(103, 3, 'Budget Analysis'),
(104, 4, 'Mobile App');
select * from Projects;


-- Find employees who are working on at least one project.
select name , department
from Employees e
where exists (
select 1
from Projects p 
where e.emp_id = p.emp_id);



-- Find employees who are not assigned to any project.
select name, department
from Employees e 
where not exists (
select 1 
from Projects p 
where e.emp_id = p.emp_id );



-- Find IT department employees who are assigned to projects.
select name, department
from Employees e 
where department = "IT"
and exists (
select 1
from Projects p 
where e.emp_id =  p.emp_id);



--  Find employees who are working on a project named "Database Migration".
SELECT name
FROM Employees e
WHERE EXISTS (
    SELECT 1
    FROM Projects p
    WHERE p.emp_id = e.emp_id
      AND p.project_name = 'Database Migration'
);



-- Find HR employees who are not assigned to any project.
SELECT name
FROM Employees e
WHERE department = 'HR'
  AND NOT EXISTS (
      SELECT 1
      FROM Projects p
      WHERE p.emp_id = e.emp_id
  );