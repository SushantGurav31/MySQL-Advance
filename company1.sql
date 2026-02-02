create database company1;

use company1;

CREATE TABLE employee_salary (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    salary_month DATE
);

INSERT INTO employee_salary (emp_name, department, salary, salary_month) VALUES
-- IT Department
('Amit', 'IT', 50000, '2024-01-01'),
('Amit', 'IT', 55000, '2024-02-01'),
('Amit', 'IT', 60000, '2024-03-01'),

('Ravi', 'IT', 60000, '2024-01-01'),
('Ravi', 'IT', 60000, '2024-02-01'),
('Ravi', 'IT', 65000, '2024-03-01'),

-- HR Department
('Neha', 'HR', 40000, '2024-01-01'),
('Neha', 'HR', 42000, '2024-02-01'),
('Pooja', 'HR', 42000, '2024-01-01'),
('Pooja', 'HR', 45000, '2024-02-01'),

-- Finance Department
('Suresh', 'Finance', 70000, '2024-01-01'),
('Suresh', 'Finance', 75000, '2024-02-01'),
('Karan', 'Finance', 75000, '2024-01-01');


-- RANK vs DENSE_RANK (same salaries exist)
select emp_name, department, salary, 
rank() over (partition by department order by salary desc) as rank_post, 
dense_rank() over (partition by department order by salary desc ) as dense_rank_pose 
from employee_salary;


-- Previous Month Slalry 
select emp_name, salary_month, salary, 
lag(salary) over (
partition by emp_name
order by salary_month 
) as previous_salary 
from employee_salary;


-- next month slary
select emp_name, salary_month, salary, 
lead(salary) over (
partition by emp_name 
order by salary_month
) as next_salary 
from employee_salary;


-- salary growth 
select emp_name, salary_month, salary, 
salary - lag (salary) over (
partition by emp_name
order by salary_month
) as salary_growth 
from employee_salary;


-- running total ( Employee_wise slary growth)
select emp_name, salary_month, salary, 
sum(salary) over (
partition by emp_name
order by salary_month
) as running_salary_total 
from employee_salary;


-- Moving Average (Last 2 Months)
select emp_name, salary_month, salary, 
avg(salary) over (
partition by emp_name
order by salary_month
rows between 1 preceding and current row
) as moving_avg_2_months 
from employee_salary;


-- Department-wise Analytics 
select emp_name, department, salary ,

-- Ranking 
rank () over (partition by department order by salary desc ) as rank_post,
dense_rank () over (partition by department order by salary desc ) as dense_rank_post, 

-- Departments stats 
sum(salary) over (partition by department ) as dept_total_salary,
avg(salary) over (partition by department ) as dept_avg_salary,
count(*) over (partition by department) as dept_employee_count
from employee_salary;
