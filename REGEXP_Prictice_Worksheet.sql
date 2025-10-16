create database REGEXP_Prictice_Worksheet;

use REGEXP_Prictice_Worksheet;

CREATE TABLE Employees (
  emp_id INT,
  emp_name VARCHAR(50),
  department VARCHAR(30)
);

INSERT INTO Employees VALUES
(1, 'Anita', 'HR'),
(2, 'Suresh', 'Finance'),
(3, 'Omkar', 'Sales'),
(4, 'Isha', 'IT'),
(5, 'Deepak', 'Admin'),
(6, 'Umesh', 'Support');

select * from Employees;


-- Find all employee names that start with a vowel.
select * from Employees 
where emp_name regexp '^[AEIOUaeiou]';


-- Find all empolyees names that with a vowel.
select * from Employees 
where emp_name regexp '[AEIOUaeiou]$';


-- find all employees names that do not start with a vowel.
select * from Employees 
where emp_name not regexp "^[AEIOUaeiou]"; 







CREATE TABLE Cities (
  city_id INT,
  city_name VARCHAR(50)
);

INSERT INTO Cities VALUES
(1, 'Indore'),
(2, 'Ahmedabad'),
(3, 'Pune'),
(4, 'Udaipur'),
(5, 'Bhopal'),
(6, 'Chennai');

select * from Cities;


-- List all cities that contain at least one vowel.
select * from Cities
where city_name regexp "[AEIOUaeiou]";


-- List all cities that start and end with vowels. 




-- Find all cities that have double vowels (like "oo", "aa", "ee").




CREATE TABLE Students (
  roll_no INT,
  name VARCHAR(50)
);

INSERT INTO Students VALUES
(1, 'Aarav'),
(2, 'Esha'),
(3, 'Kunal'),
(4, 'Oviya'),
(5, 'Riya'),
(6, 'Utkarsh');

select * from Students;

-- Find names where the second letter is a vowel. 
select * from Students
where  name regexp "^.[AEIOUaeiou]";


-- find names containing a vowels followed by "y"
select * from Students
where name regexp "[AEIOUaeiou]y";


-- find names that end with a vowel bou do not start with one . 









CREATE TABLE Products (
  pid INT,
  pname VARCHAR(50)
);

INSERT INTO Products VALUES
(1, 'Oil'),
(2, 'Apple'),
(3, 'Umbrella'),
(4, 'Ink'),
(5, 'Soap'),
(6, 'Egg');

select * from Products;

-- Find product name starting with a vowel. 
select * from Products 
where pname regexp "^[AEIOUaeiou]";


-- Find products that end  with "a"
select * from Products 
where pname like "%a";


-- find product names that contain more than one vowel. 







CREATE TABLE Countries (
  cid INT,
  country_name VARCHAR(50)
);

INSERT INTO Countries VALUES
(1, 'India'),
(2, 'Australia'),
(3, 'Egypt'),
(4, 'Oman'),
(5, 'Ukraine'),
(6, 'Nepal');

select * from Countries;


-- List Countries starting with vowels
select * from Countries
where country_name regexp '^[AEIOUaeiou]';


-- List countries ending with vowels. 
select * from Countries 
where country_name regexp '[AEIOUaeiou]$';


-- Find countries where the third letter is a vowel. 







CREATE TABLE Movies (
  movie_id INT,
  title VARCHAR(50)
);

INSERT INTO Movies VALUES
(1, 'Avatar'),
(2, 'Eternals'),
(3, 'Ironman'),
(4, 'Ocean'),
(5, 'Up'),
(6, 'Dune');

select * from Movies;

-- Find a movies starting with a vowel. 
select * from Movies 
where title regexp '^[AEIOUaeiou]';


-- Find  movies that contain consecutive vowels. 



-- Find Movies ending with a vowel. 
select * from Movies 
where title regexp "[AEIOUaeiou]$";

