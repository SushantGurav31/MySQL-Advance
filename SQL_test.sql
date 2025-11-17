CREATE DATABASE Sql_test;

use Sql_test;

create table students(
name VARCHAR(50),
age int,
grade char(1)

);

insert into students (name,age,grade) values("Sushant", 21, "A");

insert into students (name,age,grade) values("Omkar", 11, "B");

insert into students (name,age,grade) values("Sahil", 13, "A");

select * from students;


-- Select all students whose age is greater than 15
select * from students where age > 15;


-- Select all records from students ordered by name descending.
select * from students order by name desc;


-- Write a query to find students whose age is between 13 and 18 and grade is IN ('A', 'B').
select * from students where age between 13 and 18 AND grade in ("A","B");


