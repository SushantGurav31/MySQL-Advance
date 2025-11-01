create database IBM_SQL_Challenge;

use IBM_SQL_Challenge;


-- Table 1: Departments
create table Departments (
DeptID int primary key ,
DeptName varchar (50),
Location varchar (50)
);


-- Table 2: Employees
create table Employees(
EmpID int primary key,
EmpName varchar (50),
Gender char (1),
Salary decimal(10,2),
JoinDate date ,
DeptID int,
ManagerID int,
foreign key (DeptID) references Departments(DeptID)
);

-- Table 3: Projects
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Departments 
insert into Departments values
(1, 'IT', 'Bangalore'),
(2, 'HR', 'Pune'),
(3, 'Finance', 'Mumbai'),
(4, 'Marketing', 'Delhi');
select * from Departments;

insert into Employees values
(101, 'Amit', 'M', 55000, '2021-01-10', 1, NULL ),
(102, 'Priya', 'F', 60000, '2020-03-15', 1, 101),
(103, 'Ravi', 'M', 45000, '2022-07-12', 2, 102),
(104, 'Sneha', 'F', 70000, '2019-10-01', 3, 101),
(105, 'Arjun', 'M', 50000, '2021-08-23', 4, 102),
(106, 'Meena', 'F', 80000, '2018-05-11', 1, 101),
(107, 'Vijay', 'M', 47000, '2023-04-19', 2, 103);
select * from Employees ;


insert into Projects values 
(201, 'Watson AI', '2021-06-01', '2022-12-31', 1),
(202, 'BlueMix Cloud', '2022-01-15', '2023-06-30', 1),
(203, 'HR Portal', '2020-09-01', '2021-04-01', 2),
(204, 'Finance Tracker', '2021-03-10', '2022-09-10', 3),
(205, 'Brand Compaign', '2023-01-01', null, 4);
select * from Projects;

-- 1) Display all employee names and their department names.
SELECT e.EmpName, d.DeptName
FROM Employees e
JOIN Departments d ON e.DeptID = d.DeptID;


-- 2) List employees who joined after 1st Jan 2021.
select Empname, JoinDate 
from Employees 
where JoinDate > '2021-01-01' ;


-- 3) Find the total number of employees in each department.
SELECT d.DeptName, COUNT(e.EmpID) AS TotalEmployees
FROM Employees e
JOIN Departments d ON e.DeptID = d.DeptID
GROUP BY d.DeptName;


-- 4) Show all projects handled by the 'IT' depertment 
SELECT p.ProjectName
FROM Projects p
JOIN Departments d ON p.DeptID = d.DeptID
WHERE d.DeptName = 'IT';


-- 5) Display the names of all female employees 
SELECT EmpName
FROM Employees
WHERE Gender = 'F';


-- 6) Find the highest salary in each department 
SELECT d.DeptName, MAX(e.Salary) AS HighestSalary
FROM Employees e
JOIN Departments d ON e.DeptID = d.DeptID
GROUP BY d.DeptName;


-- 7) List employees whoes salary is above the average salary 
SELECT EmpName, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);


-- 8) Display departments that have more than one project 
SELECT d.DeptName, COUNT(p.ProjectID) AS ProjectCount
FROM Departments d
JOIN Projects p ON d.DeptID = p.DeptID
GROUP BY d.DeptName
HAVING COUNT(p.ProjectID) > 1;



-- 9) Show employee names along with their managers names 
select e.EmpName as Employee, m.EmpName as Manager
from Employees e 
left join Employees m 
on e.ManagerID = m.EmpID;




-- 10) Find the departments where project duration (EndDate - StartDate is longest
SELECT d.DeptName, p.ProjectName,
       DATEDIFF(p.EndDate, p.StartDate) AS DurationDays
FROM Projects p
JOIN Departments d ON p.DeptID = d.DeptID
WHERE p.EndDate IS NOT NULL
ORDER BY DurationDays DESC
LIMIT 1;




