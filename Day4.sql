-- loaction with number of loaction and in that location with avg experience

USE techforallwithpriya
SELECT Location, COUNT(Location) as TOTAL, AVG(YearsOfExperience) as Avg_Exp
FROM learners 
GROUP BY Location

# group by k baad hamesha woh likhenge joki select k baad likhenge, if there are two column names then group by k baad bhi two column names honge

-- Location with first name and last name with number of employees at that location and average experience at that location

SELECT* from Learners
SELECT LearnerFirstName, LearnerLastName, Learners.Location, TOTAL, Avg_Exp
FROM Learners
JOIN
(SELECT Location, COUNT(Location) as TOTAL, AVG(YearsOfExperience) as Avg_EXP
FROM learners
GROUP BY Location) AS TEMP
ON Learners.Location = TEMP.Location

-- Optimising above query

SELECT LearnerFirstName, LearnerLastName, Location, 
COUNT(Location) OVER (PARTITION BY Location) AS TOTAL,
AVG(YearsOfExperience) OVER (PARTITION BY Location) AS Avg_Exp
FROM Learners

-- difference between group by and partition by 
# output will be dependent on the Selected columns in group by 
# output will be dependent on the Column name in partition by 

SELECT Location, COUNT(Location) as total FROM Learners GROUP BY Location
SELECT Location, COUNT(Location) OVER (PARTITION BY Location) AS total FROM Learners

SELECT Location, AVG(YearsOfExperience) as max_year_exp FROM learners GROUP BY Location;
SELECT Location, AVG(YearsOfExperience) OVER(PARTITION BY Location) as avg_exp FROM learners;

SELECT* from employee
INSERT INTO employee(firstName, LastName, Age, Salary, Location) VALUES ("Rohit", "Dayal", 21, 200000, "Noida");
INSERT INTO employee(firstName, LastName, Age, Salary, Location) VALUES ("Yash", "Suthar", 25, 300000, "Bengaluru");
DELETE FROM employee WHERE EID = 6

-- Difference between rownumber, rank and dense rank
-- no duplicates then all three returns the same answer
-- row number toh sidha like 1,2,3....
-- rank m holes honge skipping hogi, aur same entity ka toh like same hi rank milegi 
-- but current row_number ko dhyan m rakhta h dense_rank
-- aur dense rank m skippin nahi hogi next changed entity ko consecutive number milega

SELECT firstName, lastName, Salary,
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS Priority_Emp
FROM employee

SELECT firstName, lastName, Salary,
RANK() OVER (ORDER BY Salary DESC) AS Priority_Emp
FROM employee

SELECT firstName, lastName, Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS Priority_Emp
FROM employee

-- GIVE me the record of all employee having second highest salary

SELECT* FROM 
(SELECT firstName, lastName, Salary,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS Priority_Emp
FROM employee) AS TEMP
WHERE Priority_Emp = 2

-- GIVE me the record of first employee having second highest salary
SELECT* FROM 
(SELECT firstName, lastName, Salary,
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS Priority_Emp
FROM employee) AS TEMP
WHERE Priority_Emp = 2

-- Give me the details of highest salary people in each location 
SELECT* FROM 
(SELECT firstName, lastName, Salary, Location,
ROW_NUMBER() OVER (PARTITION BY Location ORDER BY Salary DESC) AS Priority_Emp
FROM employee) AS TEMP
WHERE Priority_Emp = 1