CREATE DATABASE like_example;

USE like_example;

create table likes_log (
user_id int,
username VARCHAR(50),
post_id int,
liked_on date 

);

insert into likes_log (user_id,username,post_id,liked_on) values (101,"john_doe",501,"2024-01-01");

insert into likes_log (user_id,username,post_id,liked_on) values (102,"jane_smith",502,"2024-01-02");

insert into likes_log (user_id,username,post_id,liked_on) values (103,"john_smith",501,"2024-01-03");

insert into likes_log (user_id,username,post_id,liked_on) values (104,"alice_doe",503,"2024-01-04");

insert into likes_log (user_id,username,post_id,liked_on) values (105,"johnny_bravo",502,"2024-01-05");


select * from likes_log;


-- Find users with names starting with 'john'
select * from likes_log where username like "john%";


-- Users whose names end with 'doe'
select * from likes_log where username like "%doe";


-- Users whose names contain 'smith'
select * from likes_log where username like "%smith%";


