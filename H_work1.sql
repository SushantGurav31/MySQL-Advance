create database H_work1;

use H_work;

CREATE TABLE Employee (
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    join_date DATE
);

INSERT INTO Employee VALUES
(1, 'Amit', 'HR', 40000, '2021-05-10'),
(2, 'Sneha', 'IT', 55000, '2020-02-15'),
(3, 'Rohit', 'Finance', 60000, '2019-11-20'),
(4, 'Priya', 'IT', 75000, '2022-01-12'),
(5, 'Vikas', 'HR', 30000, '2023-07-05');

select * from Employee;

-- Find all employees with salary greater than 50,000.
select * from Employee where salary >50000;


-- List employees who work in IT department.
select * from Employee where department = "IT";


-- Show employees who joined between 2020 and 2022.
select * from Employee where join_date between "2020-01-01" and "2022-12-31";


-- Find employees whose name starts with “S”.
select * from Employee where name like "S%";


-- Find employees whose name starts with “S”
SELECT * FROM Employees WHERE department <> 'HR';





CREATE TABLE Student (
    student_id INT,
    name VARCHAR(50),
    course VARCHAR(50),
    marks INT,
    city VARCHAR(50)
);

INSERT INTO Student VALUES
(101, 'Raj', 'Math', 85, 'Pune'),
(102, 'Simran', 'Science', 92, 'Delhi'),
(103, 'Aman', 'History', 76, 'Mumbai'),
(104, 'Neha', 'Math', 65, 'Pune'),
(105, 'Arjun', 'Science', 55, 'Chennai');

select * from Student;

-- Find students who scored more than 80 marks.
select * from Student where marks > 80;


-- List all student from pune 
select * from Student where city = "Pune";


-- Show students who scored between 60 and 90.
select * from Student where marks between 60 and 90;


-- Get all student who study Science or Math.
select * from Student where course in ("Science", "Math");


-- Find students whose name ends with "n".
select * from student where name like "%n";






CREATE TABLE Product (
    product_id INT,
    name VARCHAR(50),
    category VARCHAR(50),
    price INT,
    stock INT
);

INSERT INTO Product VALUES
(1, 'Laptop', 'Electronics', 60000, 10),
(2, 'Mobile', 'Electronics', 25000, 20),
(3, 'Table', 'Furniture', 7000, 15),
(4, 'Chair', 'Furniture', 3000, 25),
(5, 'Book', 'Stationery', 500, 50);

select * from Product;


-- Find all products with price greater than 10,000.
select * from Product where price > 10000;


-- List all furniture items.
select * from Product where category = "Furniture";


-- Show products with stock less than 20.
select * from Product where stock < 20;


-- Find items whose name contains “a”.
select * from Product where name like "%a%";


-- Show products in category Electronics or Stationery.
select * from Product where category in ('Electronics', 'Stationary');





CREATE TABLE Order1 (
    order_id INT,
    customer_name VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    order_date DATE
);

INSERT INTO Order1 VALUES
(201, 'Ramesh', 'Laptop', 1, '2023-03-10'),
(202, 'Sita', 'Book', 5, '2023-04-12'),
(203, 'Aman', 'Mobile', 2, '2023-05-15'),
(204, 'Neha', 'Chair', 4, '2023-06-18'),
(205, 'Vikas', 'Table', 1, '2023-07-20');
select * from Order1;

-- Find orders placed after June 2023.
select * from Order1 where order_date > "2023-06-01";


-- List all customers who bought more than 2 items.
select * from order1 where quantity > 2;


-- Show  orders where product is Laptop or Mobile
select * from Order1 where product in ("Laptop", "Mobile");


-- Find orders by customer whoes name starts with "A" .
select * from Order1 where Customer_name like "A%";


-- Show all orders not containing "Book". 
select * from Order1 where product <> "book";





CREATE TABLE Library (
    book_id INT,
    title VARCHAR(100),
    author VARCHAR(50),
    genre VARCHAR(50),
    price INT
);

INSERT INTO Library VALUES
(1, 'The Alchemist', 'Paulo Coelho', 'Fiction', 400),
(2, 'Wings of Fire', 'A.P.J. Abdul Kalam', 'Autobiography', 350),
(3, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 500),
(4, '1984', 'George Orwell', 'Fiction', 300),
(5, 'Clean Code', 'Robert C. Martin', 'Programming', 800);
select * from Library;


-- Find all books priced above 400.
select * from Library where price > 400;


-- List books of genral Fiction 
select * from Library where genre ="fiction";


-- Show books written by authors whose name start with "R". 
select * from Library where author like "R%";


-- Find books not in genre Programming.
select * from Library where genre <> "Programming";


-- Show books with price between 300 and 600.
select * from Library where price between 300 and 600;


