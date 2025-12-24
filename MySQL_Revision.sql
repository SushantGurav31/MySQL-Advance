create database MySQL_Revision;

use MySQL_Revision;

create table students (
id int,
name varchar (50)
);


create table classes (
id int,
class varchar(20)
);

insert into students values
(1,'Gaurav'),
(2, 'Raju'),
(3, 'Sam');


insert into classes values
(1, '10th'),
(3, '12th'),
(4, '9th');

select * from students;
select * from classes;


-- INNER JOIN (only matching ids)
select students.id, name, class
from students
inner join classes 
on students.id = classes.id;