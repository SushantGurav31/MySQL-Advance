create database sales_db;

use sales_db;


CREATE TABLE sales (
  id INT AUTO_INCREMENT PRIMARY KEY,
  product VARCHAR(100),
  amount DECIMAL(10,2),
  sale_date DATE
);

insert into sales (product, amount, sale_date) values 
('Laptop', 50000, '2025-01-10'),
('Mobile', 20000, '2025-02-05'),
('Tablet', 15000, '2025-02-05');

