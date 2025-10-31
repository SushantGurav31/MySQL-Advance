create database stored_procedure;

use stored_procedure;

create table employee(
empid int primary key ,
empname varchar (100),
department varchar (50),
salary decimal (10,2)
);

select * from employee;   -- without sp
-- with sp
delimiter $$

create procedure showallemployee()
begin
	 select * from employee;
end$$

delimiter ;


call showallemployee();

insert into employee (empid, empname, department, salary) values
 (1,"Amit Sharma", "IT", 75000.00),
 (2, "Priya Singh", "HR", 60000.00),
 (3, "Rahul Verma", "Finance", 82080.00),
 (4, "Neha Gupta", "Marketing", 55000.00),
 (5, "Ravi Patel", "IT", 90000.00),
 (6, "Simran Kaur", "HR", 65000.00),
 (7, "Aniket Sharma", "Sales", 58000.00),
 (8, "Sneha Das", "Finance", 72000.00),
 (9, "Karan Joshi", "IT", 99000.00),
 (10, "Pooja Nair", "Marketing", 61000.00);
 
 

