SHOW databases
CREATE DATABASE if not exists techforallwithpriya
Use techforallwithpriya
select database()

CREATE TABLE employee(
	EID	INT PRIMARY KEY AUTO_INCREMENT, 
    firstName Varchar(50) NOT NULL,
    lastName Varchar(50) NOT NULL,
    Age INT NOT NULL,
    Salary INT NOT NULL,
    Location Varchar(50) NOT NULL
	-- PRIMARY KEY (firstName)
)

DROP TABLE employee -- deleting the table
DESC employee -- design/schema of the table

SHOW TABLES -- show all the tables in the selected database

INSERT INTO employee(firstName, LastName, Age, Salary, Location) VALUES ("Priya", "Bhatia", 27, 200000, "Bengaluru");
INSERT INTO employee(firstName, LastName, Age, Salary, Location) VALUES ("Rahul", "Sharma", 17, 80000, "Hyderabad");
INSERT INTO employee(firstName, LastName, Age, Salary, Location) VALUES ("Neha", "Rastogi", 33, 140000, "Noida");
INSERT INTO employee(firstName, LastName, Age, Salary, Location) VALUES ("Radhika", "Merchant", 22, 230000, "Gurugram");

SELECT * FROM employee

SELECT * FROM employee WHERE Salary>100000
SELECT firstName, lastName FROM employee WHERE Salary>100000
SELECT * FROM employee WHERE Age>25

UPDATE employee SET lastName = "Bhatt" WHERE EID = 1
UPDATE employee SET Age = 33 WHERE EID = 3;
UPDATE employee SET Age = 22 WHERE EID = 4;
UPDATE employee SET lastName = "Merchant" WHERE EID = 4;

DELETE FROM employee WHERE EID=4 -- deleting the row