SHOW DATABASES
USE techforallwithpriya
SHOW TABLES
SELECT * FROM employee

-- creating a course table

CREATE TABLE Course(
CourseID INT AUTO_INCREMENT, 
CourseName varchar(50) NOT NULL, 
CourseDuration_Months INT NOT NULL,
CourseFee INT NOT NULL, 
PRIMARY KEY(CourseId)
)

DESC course

INSERT INTO Course (CourseName, CourseDuration_Months, CourseFee) VALUES ("Android Dev", 1, 999);
INSERT INTO Course (CourseName, CourseDuration_Months, CourseFee) VALUES ("Flutter Dev", 2, 1500);
INSERT INTO Course (CourseName, CourseDuration_Months, CourseFee) VALUES ("Backend Dev", 3, 2999);

-- DROP TABLE Course
SELECT * FROM Course

CREATE TABLE Learners(
Learner_Id INT AUTO_INCREMENT, 
LearnerFirstName VARCHAR(50) NOT NULL, 
LearnerLastName VARCHAR(50) NOT NULL, 
LearnerPhoneNo VARCHAR(50) NOT NULL, 
LearnerEmailID VARCHAR(50), 
LearnerEnrollmentDate TIMESTAMP NOT NULL, 
SelectedCourses INT NOT NULL, 
YearsOfExperience INT NOT NULL,
LearnerCompany VARCHAR(50), 
SourceOfJoining VARCHAR(50) NOT NULL, 
Batch_Start_Date TIMESTAMP NOT NULL, 
Location VARCHAR(50) NOT NULL, 
PRIMARY KEY(Learner_Id), 
UNIQUE KEY(LearnerEmailID), 
FOREIGN KEY(SelectedCourses) REFERENCES Course(CourseID)
);

SHOW TABLES
-- DROP TABLE Learners 
DESC Learners

-- Drop the Learners table if it exists
DROP TABLE IF EXISTS Learners;

-- Create the Learners table
CREATE TABLE Learners(
    Learner_Id INT AUTO_INCREMENT, 
    LearnerFirstName VARCHAR(50) NOT NULL, 
    LearnerLastName VARCHAR(50) NOT NULL, 
    LearnerPhoneNo VARCHAR(50) NOT NULL, 
    LearnerEmailID VARCHAR(50), 
    LearnerEnrollmentDate TIMESTAMP NOT NULL, 
    SelectedCourses INT NOT NULL, 
    YearsOfExperience INT NOT NULL,
    LearnerCompany VARCHAR(50), 
    SourceOfJoining VARCHAR(50) NOT NULL, 
    Batch_Start_Date TIMESTAMP NOT NULL, 
    Location VARCHAR(50) NOT NULL, 
    PRIMARY KEY(Learner_Id), 
    UNIQUE KEY(LearnerEmailID), 
    FOREIGN KEY(SelectedCourses) REFERENCES Course(CourseID)
);

-- Reset the auto-increment value to 1
ALTER TABLE Learners AUTO_INCREMENT = 1;

-- Insert the data
INSERT INTO Learners (LearnerFirstName, LearnerLastName, LearnerPhoneNo, LearnerEmailID, LearnerEnrollmentDate, SelectedCourses, YearsOfExperience, LearnerCompany, SourceOfJoining, Batch_Start_Date, Location) 
VALUES ('Amit', 'Sharma', '9876543210', 'amit.sharma@example.com', '2024-08-05', 1, 4, 'TCS', 'LinkedIn', '2024-09-01', 'Mumbai');

INSERT INTO Learners (LearnerFirstName, LearnerLastName, LearnerPhoneNo, LearnerEmailID, LearnerEnrollmentDate, SelectedCourses, YearsOfExperience, LearnerCompany, SourceOfJoining, Batch_Start_Date, Location) 
VALUES ('Priya', 'Verma', '8765432109', 'priya.verma@example.com', '2024-09-10', 2, 2, 'Infosys', 'Job Portal', '2024-10-01', 'Delhi');

INSERT INTO Learners (LearnerFirstName, LearnerLastName, LearnerPhoneNo, LearnerEmailID, LearnerEnrollmentDate, SelectedCourses, YearsOfExperience, LearnerCompany, SourceOfJoining, Batch_Start_Date, Location) 
VALUES ('Rahul', 'Patel', '7654321098', 'rahul.patel@example.com', '2024-10-15', 3, 5, 'Wipro', 'Referral', '2024-11-01', 'Bengaluru');

INSERT INTO Learners (LearnerFirstName, LearnerLastName, LearnerPhoneNo, LearnerEmailID, LearnerEnrollmentDate, SelectedCourses, YearsOfExperience, LearnerCompany, SourceOfJoining, Batch_Start_Date, Location) 
VALUES ('Neha', 'Reddy', '6543210987', 'neha.reddy@example.com', '2024-11-20', 2, 3, 'HCL', 'Advertisement', '2024-12-01', 'Hyderabad');

INSERT INTO Learners (LearnerFirstName, LearnerLastName, LearnerPhoneNo, LearnerEmailID, LearnerEnrollmentDate, SelectedCourses, YearsOfExperience, LearnerCompany, SourceOfJoining, Batch_Start_Date, Location) 
VALUES ('Suresh', 'Gupta', '5432109876', 'suresh.gupta@example.com', '2024-12-25', 1, 6, 'Capgemini', 'Website', '2025-01-01', 'Chennai');

INSERT INTO Learners (LearnerFirstName, LearnerLastName, LearnerPhoneNo, LearnerEmailID, LearnerEnrollmentDate, SelectedCourses, YearsOfExperience, LearnerCompany, SourceOfJoining, Batch_Start_Date, Location) 
VALUES ('Anjali', 'Mehta', '4321098765', 'anjali.mehta@example.com', '2025-01-30', 2, 1, 'Tech Mahindra', 'Campus Placement', '2025-02-01', 'Pune');

-- Select the data to verify
SELECT * FROM Learners;

SELECT MAX(Salary) as Max_Salary FROM employee
SELECT MIN(Salary) as Min_Salary FROM employee

DESC employee
SELECT * FROM employee WHERE Salary = (SELECT MAX(Salary) FROM employee) 

-- Data Analysis [eployee, Courses, Learners]

-- 1. Give me the record of the employee getting highest salary

-- SELECT* FROM employee ORDER BY Salary LIMIT 1 -- for lowest salary
SELECT* FROM employee ORDER BY Salary DESC LIMIT 1 -- for highest salary

-- 2. Give me the record of the employee getting highest salary, age>27
SELECT* FROM employee WHERE AGE>27 ORDER BY Salary DESC LIMIT 1

-- 3. no. of enrollment for the course or no. of rows in table
SELECT COUNT(*) as num_of_enrollments FROM Learners

desc Learners
-- 4. Display the number of enrollment where the course id is 3
SELECT COUNT(*) as course3_enrollment FROM Learners Where SelectedCourses = 3

-- 5. Display the number of enroll learners in the month of august
SELECT COUNT(*) as august_enrollments FROM Learners Where LearnerEnrollmentDate LIKE '%-08-%'

-- Count the number of enroll learners in the month of august-05
SELECT COUNT(*) as august_five_enrollments FROM Learners Where LearnerEnrollmentDate LIKE '%-08-05%'

SELECT COUNT(*) as august_5_enrollments FROM Learners WHERE DATE(LearnerEnrollmentDate) = '2024-08-05';
SELECT * FROM Learners WHERE DATE(LearnerEnrollmentDate) = '2024-08-05';

-- 6. Update the fourth data of learner with years of experience 4 and learner company as infosys
UPDATE Learners SET YearsOfExperience = 4, LearnerCompany = 'Infosys' WHERE Learner_Id = 4

select * from Learners

-- 7. Count the number of different/unique/distinct companies that enrolled student working in 
SELECT COUNT(Distinct LearnerCompany) as Total_companies FROM Learners 
SELECT (LearnerCompany) FROM Learners 