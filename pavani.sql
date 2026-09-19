create database online_education_db;
use online_education_db;
SELECT COUNT(DISTINCT id_student) AS 
total_students FROM 
online_education_dataset;
SELECT ROUND(AVG(avg_score),2) AS 
average_student_score FROM 
online_education_dataset;
SELECT ROUND(AVG(total_clicks), 2) AS 
average_total_clicks FROM 
online_education_dataset;
SELECT SUM(CASE WHEN pass_flag = 1 THEN 
1 ELSE 0 END) AS students_passed, 
SUM(CASE WHEN dropout_flag = 1 THEN 1
 ELSE 0 END) AS students_dropped_out FROM
 online_education_dataset;
 SELECT engagement_level, COUNT(DISTINCT 
 id_student) AS total_students FROM 
 online_education_dataset GROUP BY 
 engagement_level ORDER BY total_students
 DESC;
 SELECT performance_level, COUNT(DISTINCT
 id_student) AS total_students,
 ROUND(AVG(avg_score), 2) AS
 average_score FROM
 online_education_dataset GROUP BY
 performance_level ORDER BY average_score 
 DESC;
 SELECT risk_level, COUNT(DISTINCT 
 id_student) AS total_students FROM
 online_education_dataset GROUP BY
 risk_level ORDER BY total_students DESC;
 SELECT engagement_level, 
 ROUND(AVG(avg_score), 2) AS 
 average_score, COUNT(DISTINCT id_student)
 AS total_students FROM
 online_education_dataset GROUP BY
 engagement_level ORDER BY average_score 
 DESC;
 SELECT CASE WHEN total_clicks < 500 THEN 
 '0 - 500' WHEN total_clicks < 1000 THEN '500 
 - 1000' WHEN total_clicks < 2000 THEN '1000 
 - 2000' WHEN total_clicks < 3000 THEN 
 '2000 - 3000' ELSE '3000+' END AS
 click_band, COUNT(DISTINCT id_student) AS
 total_students, ROUND(AVG(avg_score), 2)
 AS average_score FROM
 online_education_dataset GROUP BY 
 click_band ORDER BY average_score DESC;
 SELECT engagement_level, COUNT(DISTINCT
 id_student) AS total_students, SUM(CASE
 WHEN dropout_flag = 1 THEN 1 ELSE 0 END)
 AS dropout_students, ROUND(100.0 
 *SUM(CASE WHEN dropout_flag = 1 THEN 1
 ELSE 0 END) / COUNT(*), 2) AS 
 dropout_rate FROM
 online_education_dataset GROUP BY 
 engagement_level ORDER BY dropout_rate 
 DESC;
 SELECT performance_level, COUNT(DISTINCT 
 id_student) AS total_students, SUM(CASE
 WHEN dropout_flag = 1 THEN 1 ELSE 0 END) 
 AS dropout_students, ROUND(100.0 
 *SUM(CASE WHEN dropout_flag = 1 THEN 1
 ELSE 0 END) / COUNT(*), 2) AS 
 dropout_rate FROM 
 online_education_dataset GROUP BY 
 performance_level ORDER BY dropout_rate 
 DESC;
 SELECT region, COUNT(DISTINCT id_student)
 AS total_students, ROUND(AVG(avg_score), 
 2) AS average_score,
 ROUND(AVG(total_clicks), 2) AS 
 average_clicks FROM 
 online_education_dataset GROUP BY 
 region ORDER BY total_students DESC;
 SELECT highest_education, COUNT(DISTINCT
 id_student) AS total_students, 
 ROUND(AVG(avg_score), 2) AS
 average_score, ROUND(AVG(total_clicks), 2)
 AS average_clicks FROM 
 online_education_dataset GROUP BY 
 highest_education ORDER BY average_score
 DESC;