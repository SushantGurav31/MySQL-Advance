create database BigIntText_Example;

use BigIntText_Example;

create table transactions (
transaction_id bigint,
user_id int,
ammount decimal (10,2),
transaction_time datetime
);

insert into transactions values 
(900000000001, 101, 1500.50, '2025-01-10 10:15:00'),
(900000000002, 102, 2999.99, '2025-01-10 10:16:30'),
(900000000003, 103, 450.75, '2025-01-10 10:18:45');

select * from transactions;

create table product_reviews (
review_id int,
product_id int,
review_text text,
review_date date
);

INSERT INTO product_reviews VALUES
(1, 501, 'The product quantity is excellent. Bettery lasts long and performance is smooth.', '2025-01-08'),
(2, 502, 'Average experience. The packaging was damaged and deliecery was late.', '2025-01-09'),
(3, 503, 'Excellent value for money. Would definitely recommand to others.', '2025-01-10');

select * from product_reviews;



