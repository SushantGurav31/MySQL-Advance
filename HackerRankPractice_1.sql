create database HackerRankPractice_1;

use HackerRankPractice_1;

create table Categories (
CategoryID int primary key ,
CategoryName varchar(50)
);
select * from Categories;

create table Products (
ProductID int primary key ,
ProductName varchar (100),
CategoryID int ,
UnitPrice decimal (10,2),
foreign key (CategoryID) references Categories (CategoryID)
);
select * from Products;

create table Customers (
CustomerID int primary key ,
CustomerName varchar(100),
City varchar (50),
Region varchar (50)
);
select * from Customers;

create table Orders (
OrderID int primary key ,
CustomerID int,
OrderDate date,
Region varchar(50),
foreign key (CustomerID) references Customers(CustomerID)
); 
select * from Orders;

create table OrderDetails (
OrderDetailID int primary key,
OrderID int,
ProductID int,
Quantity int,
Discount decimal (5,2),
foreign key (OrderID) references Orders (OrderID),
foreign key(ProductID) references Products(ProductID)
);
select * from OrderDetails;

insert into Categories values 
(1,'Forniture'), (2,'Office Supplies'), (3, 'Technology');


insert into Products values 
(101, 'Office Chair', 1, 2500),
(102, 'Desk', 1, 5000),
(103, 'Pen', 2, 20),
(104, 'Notebook', 2, 50),
(105, 'Laptop', 3, 600000),
(106, 'Headphones', 3, 3000);


INSERT INTO Customers VALUES
(1, 'Ravi Sharma', 'Delhi', 'North'),
(2, 'Sneha Patil', 'Mumbai', 'West'),
(3, 'Amit Verma', 'Kolkata', 'East'),
(4, 'Priya Rao', 'Bangalore', 'South');

INSERT INTO Orders VALUES
(1001, 1, '2024-04-10', 'North'),
(1002, 2, '2024-04-11', 'West'),
(1003, 3, '2024-04-12', 'East'),
(1004, 4, '2024-04-13', 'South'),
(1005, 1, '2024-04-14', 'North');


insert into OrderDetails values 
(1, 1001, 101, 2, 0.05),
(2, 1001, 103, 10, 0),
(3, 1002, 105, 1, 0.1),
(4, 1003, 104, 5, 0),
(5, 1004, 106, 2, 0.2),
(6, 1005, 102, 1, 0);


-- Show all customers and their cities
select CustomerName, City from Customers;

-- List all product names and their prices.
select ProductName, UnitPrice from Products;

-- Display all orders placed in April 2024.
select * from Orders where month (OrderDate) = 4 and year (OrderDate) = 2024;

-- Count total number of customers.
select count(*) as TotalCustomers from Customers;

-- Find all unique regions in the Customers table.
select distinct Region from Customers;

-- Show products priced above ₹1000.
select * from Products where UnitPrice > 1000;

-- Display all products with their category names.
select p.ProductName, c.CategoryName
from Products P 
join Categories c ON 
p.CategoryID = c.CategoryID;



-- INTERMEDIATE

-- Show customer name, order ID, and order date.
select c.CustomerName, o.OrderID, o.OrderDate 
from Customers c 
join Orders o on c.CustomerID = o.CustomerID;


-- Display all products purchased by Ravi Sharma.
select p.ProductName
from Customers c 
join Orders o on C.CustomerID = o.CustomerID
join OrderDetails od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
where c.CustomerName = 'Ravi Sharma';


-- Find total quantity of products sold in each order.
select o.OrderID, sum(od.Quantity) as TotalQuantity
from Orders o 
join OrderDetails od on o.OrderID = od.OrderID
group by o.OrderID;

-- Calculate revenue for each order (Quantity × UnitPrice × (1-Discount)).
select 
o.OrderID,
round(sum(od.Quantity* p.UnitPrice* (1 - od.Discount)),2) as Revenue 
from Orders o 
join OrderDetails od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
group by o.OrderID;


-- List categories and count of products in each.
select c.CategoryName, count(p.ProductID) as ProductCount
from Categories c 
join Products p on c.CategoryID = p.CategoryID 
group by c.CategoryName;


-- Find customers who placed more than one order.
select c.CustomerName, count(o.OrderID) as OrderCount
from Customers c 
join Orders o on c.CustomerID = o.CustomerID
group by c.CustomerName
having count(o.OrderID) > 1;


-- Show total sales amount for each region.
select 
o.Region,
round(sum(od.Quantity*p.UnitPrice * (1 - od.Discount)),2) as TotalSales
from Orders o 
join OrderDetails od on o.OrderID = od.OrderID
join Products p on od.ProductID = p.ProductID
group by o.Region;


-- Find the most expensive product in each category.

-- Display top 3 products by total revenue.

-- Find all orders containing products from more than one category.
