create database SQL_Test_1;

use SQL_Test_1;

create table Employees (
EmpID int primary key,
EmpName varchar (50),
Department varchar(50),
salary decimal (10,2),
joinDate date
);

insert into Employees values
(1, "Amit", "IT", 30000, "2025-10-23"),
(2, "Sneha", "Finance", 40000, "2025-09-20"),
(3, "Jay", "IT", 35000, "2024-10-12"),
(4, "Manthan", "Account", 25000, "2025-08-19"),
(5, "Suresh", "Sales", 25000, "2025-07-20");

select * from Employees;

-- 2) Unique Department Names
select distinct Department from Employees;


-- 3) Sort Employees by Salary (Descending)
select EmpName, Salary from Employees order by Salary desc;


-- 4) Employees who joined after 2020
select EmpID, EmpName, Department from Employees where JoinDate > 2020-12-31;


-- 5) Employees with Salary greater than 50,000
select * from Employees where Salary > 50000;


-- 6) Employees whoes name starts with "A"
select EmpID, EmpName from Employees where EmpName like "A%";


-- 7) Count total number of employees 
select count(*) as total_Employees from Employees;


-- 8) select Max,Min and Avg salary 
select max(salary)as max_salary,
min(salary) as min_salary,
avg(salary) as avg_salary
from Employees;




create table Departments (
DeptID int primary key,
DeptName varchar(50),
Location varchar (50)

);

insert into Departments values
(101, "IT", "Pune"),
(102, "Finance", "Mumbai"),
(103, "Account", "Delhi"),
(104, "Sales", "Bangalore"),
(105, "HR", "Chennai");

select * from Departments;

-- 10)join employees and Departments tables
select e.EmpName, e.Department, e.Salary, d.Location
from Employees e 
left join Departments d  
on E.Department = D.DeptName ;


-- 11)Employees working in "IT" department
select EmpName,Salary from Employees where Department = "IT";


-- 12) total salary Per Department
select Department, sum(salary) as total_salary from Employees group by Department;


-- 13) Departments having more than 3 employees 
select Department, count(*) as Employee_Count
from Employees 
group by Department
having count(*) > 3;


-- 14) top 3 highest paid employees
select EmpName, Salary
 from Employees 
 order by Salary desc
 limit 3;
 
 
 -- 15) Employees not assigned to any department 
 select e.empName 
 from Employees e
 left join Departments d 
 on e.Department = d.DeptName
 where d.DeptName is null;
 
 
 -- 16) Salary Classification using CASE 
 select EmpName, Department, Salary, case 
 when Salary > 35000 then "high"
 when salary between 25000 and 35000
 then "medium"
 else "low"
 end as Salary_level
 from Employees;
 
 
 -- 17) Update Salary by 10% for it Department
update Employees
set Salary = Salary *1.10
where department = "IT";

select * from Employees;








CREATE TABLE Projects(
  ProjectID INT PRIMARY KEY,
  ProjectName VARCHAR(50),
  StartDate DATE,
  EndDate DATE,
  EmpID INT,
  FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);

INSERT INTO Projects VALUES
 (1001, 'Testing', '2025-01-01', '2025-06-01', 1),
 (1002, 'Audit', '2025-03-01', '2025-08-01', 2),
 (1003, 'Development', '2025-02-01', '2025-05-01', 3),
 (1004, 'Recruitment', '2025-01-15', '2025-07-15', 1);
 
 
 select * from Projects;
 
 
-- 19) Employees Working on more than one project
select EmpID, count(ProjectID) as Project_count
from Projects
group by EmpID
having count(ProjectID) > 1;


-- 20)  Employees not assigned to any project
select e.EmpName
from Employees e 
left join Projects p 
on e.EmpID = p.EmpID
where p.ProjectID is null;


-- 21) average project duration 
select avg(datediff(EndDate, StartDate) )
as avg_Project_Duration 
from Projects;


-- 22)  Employees with salary greater than average salary (Subquery)
select EmpName, Salary 
from Employees 
where Salary > (select avg(Salary) from Employees);
