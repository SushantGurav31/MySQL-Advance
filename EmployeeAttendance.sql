CREATE DATABASE Office;

USE office;

CREATE TABLE EmployeeAttendance(
employee_name varchar(100),
department varchar(100),
hours_worked int,
work_date date 

);

insert into EmployeeAttendance(employee_name,department,hours_worked,work_date) values("Alice", "HR", 8, "2024-09-01");

insert into EmployeeAttendance(employee_name,department,hours_worked,work_date) values("Bob", "IT", 9, "2024-09-01");

insert into EmployeeAttendance(employee_name,department,hours_worked,work_date) values("Charlie", "Finance", 7, "2024-09-01");

insert into EmployeeAttendance(employee_name,department,hours_worked,work_date) values("Alice", "HR", 8, "2024-09-02");

insert into EmployeeAttendance(employee_name,department,hours_worked,work_date) values("Bob", "IT", 10, "2024-09-02");

insert into EmployeeAttendance(employee_name,department,hours_worked,work_date) values("David", "it", 6, "2024-09-02");

insert into EmployeeAttendance(employee_name,department,hours_worked,work_date) values("Charlie", "Finance", 9, "2024-09-02");

insert into EmployeeAttendance(employee_name,department,hours_worked,work_date) values("Eve", "HR", 7, "2024-09-01");

insert into EmployeeAttendance(employee_name,department,hours_worked,work_date) values("Eve", "HR", 6, "2024-09-02");


select * from EmployeeAttendance; 


-- 1 Find the total number of attendance records.
select count(*) as total_rows from employeeattendance;


-- 2 Find the minimum and maximum hours worked by any employee on any day.
SELECT MIN(hours_worked) AS min_hours_worked, MAX(hours_worked) AS max_hours_worked FROM employeeattendance;

-- 3 What is the total number of hours worked by all employees
select sum(hours_worked) as sum_hours_worked from employeeattendance;

-- 4 Show the average hours worked per record.
select avg(hours_worked) as avg_hours_worked from employeeattendance;

-- 5 Show total hours worked by each employee.
SELECT employee_name, sum(hours_worked) AS sum_hours_worked FROM employeeattendance GROUP BY employee_name;

-- 6 Show average daily hours per department.
select department, avg(hours_worked) as avg_hours_worked from employeeattendance group by department;

-- 7 Count how many records each department has.
select department, count(*) as record_count from employeeattendance group by department;

-- 8 Show departments with total hours worked more than 15.
SELECT department, SUM(hours_worked) AS sum_hours_worked FROM employeeattendance GROUP BY department HAVING SUM(hours_worked) > 15;
select department, sum(hours_worked) as total_hours from employeeattendance group by department having sum(hours_worked) > 15;



-- 9 Find the employee(s) who worked more than 8 hours in a day.
select employee_name, hours_worked, work_date from employeeattendance where hours_worked > 8;


-- For each department, show the maximum hours worked in a single day.
select department, max(hours_worked) as max_daily_hours from employeeattendance group by department;