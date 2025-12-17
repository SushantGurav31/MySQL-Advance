create database Amazon;

use Amazon;

select * from amazon_electronics;


select max(units_sold) as max_unitsold, min(units_sold) as min_unitsold from amazon_electronics;

select avg(unit_price) as avg_price from amazon_electronics; 

select count(order_id) as total_orders from amazon_electronics;

select sum(unit_price) as sum_price from amazon_electronics;


select * from amazon_electronics where customer_region = "East";
select * from amazon_electronics where customer_region = "West";
select * from amazon_electronics where customer_region = "North";
select * from amazon_electronics where customer_region = "South";
select * from amazon_electronics where customer_region = "Central";


select * from amazon_electronics where payment_mode = "Credit Card";
select * from amazon_electronics where payment_mode = "EMI";
select * from amazon_electronics where payment_mode = "Debit Card";
select * from amazon_electronics where payment_mode = "Net Banking";
select * from amazon_electronics where payment_mode = "UPI";


select avg(discount_percent) as overall_discount from amazon_electronics;


SELECT payment_mode, sum(unit_price) AS unit_price FROM amazon_electronics GROUP BY payment_mode;

select distinct customer_region, payment_mode from Amazon_electronics;