create database company_db;

use company_db;

create table employees (
EmpID int primary key ,
EmpName varchar (100),
Department varchar(50),
Salary decimal (10,2)
);



create database school_db;

use school_db;

create table Students (
StudentID int primary key ,
StudentName varchar(100),
Course varchar (50),
Marks int
);


create database store_db;

use store_db;

create table products (
ProductID int primary key ,
ProductName varchar (100),
Category varchar (50),
Price decimal(10,2)
); 