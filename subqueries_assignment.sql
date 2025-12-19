create database Medical;

use Medical;


-- 1) Display all records from the dataset 
select * from medical_cost_prediction_dataset;


-- 2) Show only age , sex , bmi, and chargs columns.
select age, Gender, bmi, previous_year_cost from medical_cost_prediction_dataset;


-- 3) Find all records where the person is a smoker.
select * from medical_cost_prediction_dataset where smoker = "Yes";


-- 4) List all unique regions available in the dataset. 
select distinct city_type from medical_cost_prediction_dataset;


-- 5) Count the total number of records. 
select count(*) as total_records from medical_cost_prediction_dataset;


-- 6) Find the average medical charges 
select avg(annual_medical_cost) as average_medical_charges from medical_cost_prediction_dataset;



-- 7) Display records where BMI is greater than 30
select * from medical_cost_prediction_dataset where bmi > 30;



-- 8) Count how many males and feamles are in the dataset
select gender, count(*) as total_males_females from medical_cost_prediction_dataset group by gender;


-- 9) Show all records where the number of children id 0
select count(*) as total from medical_cost_prediction_dataset where age < 18 ;



-- 10 ) Find the minimum ad maximum medical charges 
select min(annual_medical_cost) as minnimum_charges, 
max(annual_medical_cost) as maximum_charges 
from medical_cost_prediction_dataset;


-- 11) Find the average charges for smokers and non smokers separately. 
select smoker, avg(annual_medical_cost) as avg_charges
from medical_cost_prediction_dataset group by smoker;


-- 12) Count how many people belong to each region
select city_type, count(*) as total_people
from medical_cost_prediction_dataset
group by city_type ;


-- 13) find the average BMI for males and frmales 
select gender, avg(bmi) as average_males_females from medical_cost_prediction_dataset group by gender;


-- 14) List record where age is between 25 and 40
select * from medical_cost_prediction_dataset where age between 25 and 40;



-- 15) Show all records where charges exeed 50000 
select * from medical_cost_prediction_dataset where annual_medical_cost > 50000;


-- 16) Calculate total medical charges per region 
select city_type, sum(annual_medical_cost) as totla_charges from medical_cost_prediction_dataset group by city_type;


-- 17)Find the average charges for people haing at least 2 children



-- 18) Display record sorted by charges in decending order. 
select * from medical_cost_prediction_dataset order by annual_medical_cost desc;



-- 19) count how many smokers are there in each region
select city_type, count(*) as smoker_count
from medical_cost_prediction_dataset
where smoker = "yes"
group by city_type;


-- 20) Find The average age of people who are smoker
select avg(age) as avg_age from medical_cost_prediction_dataset where smoker = "yes";