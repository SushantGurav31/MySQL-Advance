create database MySQL_Subquries;

use MySQL_Subquries;

create table customers (
customer_id int primary key,
customer_name varchar(50),
region varchar(20)
);

create table orders (
order_id int primary key,
customer_id int,
order_date date,
category varchar(30),
sales decimal (10,2),

foreign key (customer_id) references customers(customer_id)
);

insert into customers values
(1, 'Rohit Sharma', 'West'),
(2, 'Ammit Verma', 'East'),
(3, 'Priya Singh', 'South'),
(4, 'Neha Patel', 'West');

insert into orders values 
(101, 1, '2025-01-10', 'Furniture', 1500),
(102, 1, '2025-01-12', 'Office Supplies', 500),
(103, 2, '2025-01-15', 'Technology', 2500),
(104, 3, '2025-01-17', 'Furniture', 300),
(105, 4, '2025-01-18', 'Technology', 900),
(106, 4, '2025-01-18', 'Office Supplies', 200);

select * from customers;
select * from orders;




