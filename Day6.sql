USE techforallwithpriya

CREATE TABLE Course_Update(
CourseID INT AUTO_INCREMENT,
CourseName varchar(50) NOT NULL,
CourseDuration_Months DECIMAL(3,1) NOT NULL,
CourseFee INT NOT NULL,
Changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY(CourseID))

DROP TABLE Course_Update

INSERT INTO Course_Update(CourseName,CourseDuration_Months,CourseFee) Values("The Complete Excel Mastery Course",2.5,1499);
INSERT INTO Course_Update(CourseName,CourseDuration_Months,CourseFee) Values("DSA For Interview Preparation",2,4999);
INSERT INTO Course_Update(CourseName,CourseDuration_Months,CourseFee) Values("SQL Bootcamp",1,2999);
INSERT INTO Course_Update(CourseName,CourseDuration_Months,CourseFee) Values("Foundations of Machine Learning",3.5,4999);

SELECT * FROM Course_Update
INSERT INTO Course_Update(CourseName,CourseDuration_Months,CourseFee) Values("Statistics for Data Science",1.5,3999);

-- Update the CourseFee Of SQL Bootcamp to 3999
UPDATE course_update SET CourseFee=3999
WHERE CourseID = 3

-- STUDYING CASE STATEMENT in SQL
# case statements for comparison or when conditions are there, and case expression for numbers only

SELECT CourseID, CourseName, CourseFee, 
	CASE 
		WHEN CourseFee > 3999 THEN 'Expensive Course'
        WHEN CourseFee > 1499 THEN 'Moderate Course'
        ELSE 'Cheap Course'
	END AS CourseFeeStatus
FROM Course_Update

-- Case expression m exact number likhna hota h like == ho tab yeh use karna chahiye
SELECT CourseID, CourseName, CourseFee, 
	CASE CourseFee
		WHEN 4999 THEN 'Expensive Course'
        WHEN 3999 THEN 'Moderate Course'
        ELSE 'Cheap Course'
	END AS CourseType
FROM Course_Update

SELECT * FROM learners
CREATE TABLE Orders(
OrderId INT AUTO_INCREMENT PRIMARY KEY, 
Order_Date TIMESTAMP NOT NULL,
Order_Learner_Id INT NOT NULL, 
OrderStatus VARCHAR(20) NOT NULL,
FOREIGN KEY(Order_Learner_Id) REFERENCES Learners(Learner_Id)
);

# auto increment agar h koi column toh usko primary key must h banana
DROP TABLE Orders
DESC orders
SELECT * FROM learners

INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-21',1,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-12',2,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-02-22',3,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-15',4,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-12',5,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-16',6,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-13',3,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-14',4,'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-22',1,'PENDING');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-12',2,'PENDING');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-25',5,'PENDING');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-11',6,'CLOSED');

SELECT * FROM Orders

-- Order_learner_Id, learner_first Name, learner_last Name Total_Orders

SELECT * FROM learners

SELECT TEMP.Order_Learner_Id, LearnerFirstName, LearnerLastName, Total_Orders
FROM learners
JOIN
(SELECT Order_Learner_Id, COUNT(*) as Total_Orders
FROM Orders
GROUP BY Order_Learner_Id) AS TEMP
ON learners.Learner_id = TEMP.Order_Learner_Id

-- Order_learner_Id, learner_first Name, learner_last Name Total_Orders, Avg_Orders
#DOUBT:
SELECT TEMP.Order_Learner_Id, LearnerFirstName, LearnerLastName, Total_Orders, AVG(SUM(temp.total_Orders)) OVER() as Avg_Orders
FROM 
(SELECT Order_Learner_Id, COUNT(*) as Total_Orders
FROM Orders
GROUP BY Order_Learner_Id) AS TEMP
JOIN learners
ON learners.Learner_id = TEMP.Order_Learner_Id 
GROUP BY 
TEMP.Order_Learner_Id