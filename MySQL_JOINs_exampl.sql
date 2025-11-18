create database MySQL_JOINs_example;

use MySQL_JOINs_example;

create table students (
student_id INT,
name VARCHAR(50),
course_id INT 

);


create table courses (
course_id int,
course_name varchar(50)

);

insert into students(student_id,name,course_id) values (1,"anil",101);
insert into students(student_id,name,course_id) values (2,"bina",102);
insert into students(student_id,name,course_id) values (3,"chetan",103);
insert into students(student_id,name,course_id) values (4,"deepa",NULL);
insert into students(student_id,name,course_id) values (5,"esha",105);


insert into courses(course_id,course_name) values(101,"math");
insert into courses(course_id,course_name) values(102,"science");
insert into courses(course_id,course_name) values(103,"english");
insert into courses(course_id,course_name) values(104,"history");

select * from students;

select * from courses;


-- inner join
select s.name,c.course_name
from students s 
inner join courses c 
on s.course_id=c.course_id;


-- left join 
select s.name, c.course_name
from students s 
left join courses c 
on s.course_id = c.course_id;  


-- right join
select s.name,c.course_name
from students s 
right join courses c 
on s.course_id = c.course_id;



-- full join 
select s.name, c.course_name
from students s 
left join courses c on s.course_id=c.course_id

union

select s.name,c.course_name
from students s 
right join courses c on s.course_id = c.course_id;



-- cross join
select s.name,c.course_name
from students s 
cross join courses c;



