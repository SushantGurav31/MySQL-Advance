create database MySQL_keys;

use MySQL_keys;

create table Student(
ID int primary key, 
S_name varbinary (50),
Roll_no int ,
Department varchar (25),
mobile_no int (10)
);



create table Department (
DeptID int, 
DeptNmae varchar(25),
foreign key (ID) references Student(ID)
);