SHOW DATABASES
USE techforallwithpriya
SHOW TABLES

SELECT * FROM learners

UPDATE learners SET SourceOfJoining = "Linkedin" WHERE Learner_Id = 3
UPDATE learners SET SourceOfJoining = "YouTube" WHERE Learner_Id IN (2, 5);

-- Count the number of of students who joined Course via LinkedIn, Youtube, campus placements, advertisement
SELECT SourceOfJoining, COUNT(*) as num_of_students FROM learners GROUP BY SourceOfJoining

-- Grouping via SourceOfJoining and Loaction
SELECT SourceOfJoining, Location, COUNT(*) as num_of_students_with_location
FROM learners 
GROUP BY SourceOfJoining, Location

-- Corresponding to Each Course, how many students have enrolled
SELECT SelectedCourses, COUNT(*) as num_of_students_with_location
FROM learners 
GROUP BY SelectedCourses

-- Corresponding to the source of joining, give me the maximum years of experience any person holds
-- the following will give the max amount of experience from each unique individual sourceofjoining (s only 1 from each source)

SELECT SourceOfJoining, MAX(YearsOfExperience) as max_year_exp
FROM learners
GROUP BY SourceOfJoining;
-- ORDER BY max_year_exp DESC;

-- Corresponding to the source of joining, give me the minimum years of experience any person holds
SELECT SourceOfJoining, MIN(YearsOfExperience) as max_year_exp
FROM learners
GROUP BY SourceOfJoining;

-- Corresponding to the source of joining, give me the average years of experience any person holds
-- matlab linkedin se suppose average itne experience wale learners milte h and other sources.
-- it does make sense (very useful)
SELECT SourceOfJoining, AVG(YearsOfExperience) as max_year_exp
FROM learners
GROUP BY SourceOfJoining;

-- Corresponding to the source of joining, give me the Summation years of experience any person holds
-- it does not make sense (no use of it)
SELECT SourceOfJoining, SUM(YearsOfExperience) as max_year_exp
FROM learners
GROUP BY SourceOfJoining;

-- Display the records of those sources whose students are more than 1
-- whenever filteration requires, use having after group by

select * from learners
SELECT SourceOfJoining, COUNT(*) as num_of_students
FROM learners 
GROUP BY SourceOfJoining
HAVING num_of_students>1

-- same course k liye number of sources left column course, right column no.of.source

SELECT SelectedCourses AS course,COUNT(DISTINCT SourceOfJoining) AS num_of_sources
FROM learners
GROUP BY SelectedCourses;

-- Display the count of those students who joined via linkedin 
SELECT * FROM course
SELECT SourceOfJoining, COUNT(*) as num_of_students
FROM learners 
GROUP BY SourceOfJoining
HAVING SourceOfJoining="LinkedIn"

#GROUP BY k baad hamesha having aayega for filteration purpose not WHERE

-- Display the course which include 'Flutter'
SELECT * FROM course 
WHERE CourseName LIKE "%Flutter%"

-- DIsplay the course which dosn't include 'FLutter'

SELECT * FROM course 
WHERE CourseName NOT LIKE "%Flutter%"

-- display the records of those students who have less then 4 years of experience and source is Youtube and Location is Delhi
-- Whenever multiple constraints and all of them should be satisfied then go for AND operator in SQL

SELECT * FROM learners
WHERE SourceOfJoining = "YouTube" AND YearsOfExperience<4 AND Location = "Delhi"

-- display the records of the students who have years of experience between 1 to 3 years

SELECT * FROM learners WHERE YearsOfExperience BETWEEN 1 AND 3
-- WHERE YearsOfExperience >= 1 AND YearsOfExperience <=3 

-- display the records of those students who have less then 4 years of experience or source is Youtube or Location is Delhi
-- Whenever multiple constraints and any one of them should be satisfied then go for OR operator in SQL

SELECT * FROM learners
WHERE SourceOfJoining = "YouTube" OR YearsOfExperience<4 OR Location = "Delhi"

-- ALTER COMMAND IN SQL
DESC employee
ALTER TABLE employee ADD COLUMN jobPosition varchar(50)
ALTER TABLE employee MODIFY COLUMN firstName varchar(40)
ALTER TABLE employee DROP COLUMN jobPosition 
# DOUBT ALTER TABLE employee DROP PRIMARY KEY

select * FROM Course
ALTER TABLE course MODIFY COLUMN CourseDuration_Months DECIMAL(3,1) NOT NULL
#decimal command is used for float datatype
DESC course
ALTER TABLE course MODIFY COLUMN CourseDuration_Months INT NOT NULL

# TIMESTAMP DEFAULT NOW() ON UPDATE NOW(), it assigns the time when the entry is added

-- HOMEWORK: Difference between truncate and delete command

-- update the flutter course fee of flutter dev to 1999

UPDATE Course SET CourseFEE = 1999 WHERE CourseID = 2
