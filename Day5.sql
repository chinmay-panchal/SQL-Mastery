-- JOIN and Subqueries in SQL

# join is a computationally expensive operation
# jisme filteration pehle hoga woh zyada optimized hoga 

/* 
SELECT COLUMN 
FROM Table 1
JOIN 
SELECT COLUMN if table 2 is not TEMP 
Table 2 
ON table1.column = table2.column // which is common between 2 tables
*/
USE techforallwithpriya

-- Location with first name and last name with number of employees at that location and average experience at that location
SELECT LearnerFirstName, LearnerLastName, Learners.Location, TOTAL, Avg_Exp
FROM Learners
JOIN
(SELECT Location, COUNT(Location) as TOTAL, AVG(YearsOfExperience) as Avg_EXP
FROM learners
GROUP BY Location) AS TEMP
ON Learners.Location = TEMP.Location

select * from course
select * from learners

-- Q1) highest number of enrollments with name

SELECT CourseID, CourseName, TEMP.total_course
FROM course
JOIN
(select SelectedCourses, COUNT(*) as total_course
From learners 
group by SelectedCourses 
ORDER BY total_course DESC 
LIMIT 1) as TEMP
ON Course.CourseID = TEMP.SelectedCourses 

-- another way but the above is the optimized one.
SELECT CourseID, CourseName, COUNT(*) as total_enrollments
FROM learners
JOIN course
ON learners.SelectedCourses = course.CourseID
GROUP BY SelectedCourses
ORDER BY total_enrollments DESC
LIMIT 1
