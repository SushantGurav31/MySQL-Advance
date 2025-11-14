create database JoinsPractice;

use JoinsPractice;

create table Customers (
CustomerID varchar(10),
CustomerName varchar(100),
region varchar(50)

);

create table Products (
productID varchar(10),
productName varchar(100),
category varchar(50)

);


create table Orders(
OrderID varchar(10),
CustomerID varchar(10),
ProductID varchar(10),
OrderDate date,
Quantity int,
Sales decimal(10,2)

);


insert into Customers(customerid,customername,region) values ("C001","Alice","East");
insert into Customers(customerid,customername,region) values ("C002","bob","west");
insert into Customers(customerid,customername,region) values ("C003","charlie","south");


insert into Products(productid,productname,category) values("P001","chair","furniture");
insert into Products(productid,productname,category) values("P002", "pen","stationery");
insert into Products(productid,productname,category) values("P003", "laptop","technology");

INSERT INTO orders values
('o001','c001','p001','2023-01-10',2,400.00),
('o002','c002','p002','2023-01-11',5,25.00),
('o003','c003','p003','2023-02-15',1,1200),
('o004','c004','p004','2023-03-05',3,150.00);

select * from customers; 

select * from Products;

select * from orders;






SELECT o.OrderID, c.CustomerName, p.ProductName, o.Sales
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Products p ON o.ProductID = p.ProductID;


-- left join
select o.OrderID, c.CustomerName, p.ProductName, o.Sales
from Orders o 
left join Customers c on o.CustomerID = c.CustomerID
left join Products p on o.ProductID = p.ProductID;

select o.OrderID, c.CustomerName, p.ProductName, o.Sales
from Orders o 
right join Customers c on o.CustomerID = c.CustomerID
right join Products p on o.ProductID = p.ProductID;



SELECT p.ProductName, o.OrderID, o.Sales
FROM Orders o
RIGHT JOIN Products p ON o.ProductID = p.ProductID;



SELECT o.OrderID, c.CustomerName, p.ProductName, o.Sales
FROM Orders o
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID
LEFT JOIN Products p ON o.ProductID = p.ProductID

UNION

SELECT o.OrderID, c.CustomerName, p.ProductName, o.Sales
FROM Orders o
RIGHT JOIN Customers c ON o.CustomerID = c.CustomerID
RIGHT JOIN Products p ON o.ProductID = p.ProductID;



select c.CustomerName, p.ProductName
from Customers c 
cross join Products p;
