create database Healthcare;

use Healthcare;

select * from heart_patient_healthcare_dataset_5000;


-- BASIC SQL QUESTIONS
-- 1)Count the total number of patients.
select count(*) as total_number_of_patients from heart_patient_healthcare_dataset_5000;

-- 2)Find the average age of patients.
select avg(age) as average_age from heart_patient_healthcare_dataset_5000;

-- 3)List all distinct chest pain types.
select distinct chest_pain_type from heart_patient_healthcare_dataset_5000;


-- 4)Count how many male and female patients are there.
select count(gender) total_male from heart_patient_healthcare_dataset_5000 where gender='Male';

SELECT 
    CASE 
        WHEN sex = 1 THEN 'Male'
        WHEN sex = 0 THEN 'Female'
    END AS gender,
    COUNT(*) AS total
FROM heart_patient_healthcare_dataset_5000
GROUP BY sex;


-- 5)Find patients older than 60 years.
select * from heart_patient_healthcare_dataset_5000 where age > 60;

-- 6)Count patients with heart disease.


-- 7)Retrieve patients with cholesterol level greater than 240.
select * from heart_patient_healthcare_dataset_5000 where cholesterol > 240;

-- 8)Show patients with fasting blood sugar > 120 mg/dl.
select * from heart_patient_healthcare_dataset_5000 where resting_bp > 120;

-- 9)List patients who have exercise-induced angina.
select * from heart_patient_healthcare_dataset_5000 where exercise_induced_angina = 'yes';

-- 10)Find the minimum and maximum resting blood pressure.
select max(resting_bp) as maximum_resting_blood from heart_patient_healthcare_dataset_5000;
select min(resting_bp) as minimum_resting_blood from heart_patient_healthcare_dataset_5000;






-- MEDIUM LEVEL SQL QUESTIONS
-- 1)Find the percentage of patients with heart disease.
SELECT 
    (SUM(CASE WHEN heart_disease = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) 
    AS heart_disease_percentage
FROM heart_patient_healthcare_dataset_5000;

-- 2)Compare average cholesterol for patients with and without heart disease.
SELECT
    cholesterol,
    AVG(cholesterol) AS avg_cholesterol
FROM heart_patient_healthcare_dataset_5000
GROUP BY cholesterol;

-- 3)Find age-wise distribution of heart disease cases.
select 
age,
count(*) as heart_disease_cases
from heart_patient_healthcare_dataset_5000
where heart_disease = 1
group by age 
order by age;


-- 4) Identify chest pain types most associated with heart disease.
SELECT
    age,
    COUNT(*) AS heart_disease_cases
FROM heart_patient_healthcare_dataset_5000
WHERE heart_disease = 1
GROUP BY age
ORDER BY age;



SELECT
    chest_pain_type AS chest_pain_type,
    COUNT(*) AS cases
FROM heart_patient_healthcare_dataset_5000
WHERE heart_disease = 1
GROUP BY chest_pain_type
ORDER BY cases DESC;


SELECT *
FROM heart_patient_healthcare_dataset_5000
WHERE heart_disease = 1
  AND exercise_induced_angina = 1
  AND cholesterol > 250;


-- M 7) 
SELECT
    gender,
    COUNT(CASE WHEN heart_disease = 1 THEN 1 END) * 1.0 / COUNT(*) AS heart_disease_ratio
FROM heart_patient_healthcare_dataset_5000
GROUP BY gender;




