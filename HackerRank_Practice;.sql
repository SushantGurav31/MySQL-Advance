create database HackerRank_Practice;

use HackerRank_Practice;

create table Departments (
DeptID int primary key,
DeptName varchar(50) not null,
Location varchar(50)
);

insert into Departments (DeptID, DeptName, Location) values
(101, "HR", "Mumbai"),
(102, "IT", "Pune"),
(103, "Finance", "Delhi");

select * from Departments;

create table Employees (
EmpID int primary key,
EmpName varchar (100) not null,
Department varchar(50),
Salary decimal (10,2),
JoiningDate date,
Gender char (1),
ManagerID int,
foreign key (ManagerID) references Employees (EmpID)
);

INSERT INTO Employees (EmpID, EmpName, Department, Salary, JoiningDate, Gender, ManagerID) VALUES
(5, 'Meena', 'HR', 80000, '2018-06-12', 'F', NULL),
(6, 'John', 'Finance', 90000, '2017-02-10', 'M', NULL),
(7, 'Ramesh', 'IT', 95000, '2016-07-18', 'M', NULL);

INSERT INTO Employees (EmpID, EmpName, Department, Salary, JoiningDate, Gender, ManagerID) VALUES
(1, 'Rahul', 'HR', 45000, '2021-05-12', 'M', 5),
(2, 'Priya', 'IT', 60000, '2020-09-23', 'F', 7),
(3, 'Amit', 'Finance', 55000, '2021-01-15', 'M', 6),
(4, 'Sneha', 'IT', 65000, '2019-03-08', 'F', 7); 
 select * from Employees;




create table Projects (
ProjID int primary key,
ProjName varchar (100) not null ,
DeptID int,
StartDate Date ,
EndDate date,
foreign key (DeptID) references Departments(DeptID)
);

INSERT INTO Projects (ProjID, ProjName, DeptID, StartDate, EndDate) VALUES
(201, 'Payroll System', 103, '2022-01-01', '2022-12-31'),
(202, 'AI Chatbot', 102, '2023-03-01', NULL),
(203, 'Recruitment Portal', 101, '2021-04-01', '2021-11-30');


CREATE TABLE Attendance (
  EmpID INT,
  Date DATE,
  Status ENUM('Present', 'Absent'),
  FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);

INSERT INTO Attendance (EmpID, Date, Status) VALUES
(1, '2025-10-01', 'Present'),
(1, '2025-10-02', 'Absent'),
(2, '2025-10-01', 'Present'),
(3, '2025-10-01', 'Present');

select * from Attendance;

-- List all employees who work in the IT department.
select * from Employees where Department = "IT";


-- Display the names and salaries of all employees earning more than ₹60,000.
select EmpName, salary from Employees where Salary > 60000;


-- Show all employees who joined after 2020.
select * from Employees where year(JoiningDate) > "2020-12-31";


-- Find the total number of employees in each department.
select Department, count(EmpID) as total_Employees from Employees group by Department;


-- Display the details of employees whose name starts with ‘S’.
select EmpName from Employees where EmpName like "S%";


-- Show employee names in alphabetical order
select EmpName from Employees order by EmpName asc;

-- List all female employees who work in HR.
select EmpName from Employees where gender= "f" and department = "HR";


-- Find the employee with the highest salary.
select max(Salary) as Highest_salary from employees;