create database Inventory_And_Warehousing_Practice;

use Inventory_And_Warehousing_Practice;

create table Warehouses (
	WarehouseID int primary key,
    Location varchar(50),
    Capacity int 
);

create table Inventory (
ItemID int primary key, 
ItemName varchar (100),
CategoryID int ,
Price Decimal (10,2),
Quantity int ,
WarehouseID int ,
foreign key (WarehouseID) references Warehouses (WarehouseID) 
);


insert into Warehouses values (1, 'Chicago', 5000), (2, 'Miami', 3000), (3, 'Austin', 4000);
select * from Warehouses;

insert into Inventory values 
(101, 'Industrial Fan', 1, 150.00, 45, 1),
(102, 'Solar Panel', 2, 800.00, 12, 1),
(103, 'LED Bulb', 1, 5.50, 500, 2),
(104, 'Power Drill', 3, 120.00, 0, 3),
(105, 'Safety Vest', 4, 25.00, 150,2);


-- 1. CASE Statement 
select ItemName, 
	case 
		when CategoryID = 1 then Price *0.90
        when CategoryID = 2 then Price *0.80
        else Price 
        end as DiscountPrice 
from Inventory ;


-- 2. Correlated Subquery 
select ItemName, Price, WarehouseID 
from Inventory i1 
where Price > (select avg(Price) from Inventory i2 where i1.WarehouseID = i2.warehouseID);

-- 3. EXISTS 
select Location from Warehouses w 
where exists (select 1 from Inventory i where i.WarehouseID = w.WarehouseID and i.Price > 500);

-- 4. Stored Procedure 
DELIMITER //
create procedure CheckRestock(in p_WarehouseID int)
begin 
	select ItemName, Quantity from Inventory 
    where WarehouseID = p_WarehouseID and Quantity < 20;
END // 
DELIMITER ;

CALL CheckRestock();