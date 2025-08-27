-- ----------------------------------------------------------------------------------- --
CREATE TABLE PERSON_DATA
(
    PERSON_ID INT PRIMARY KEY IDENTITY,
    FIRSTNAME VARCHAR(100) NOT NULL,
    LASTNAME VARCHAR(100) NOT NULL,
    SALARY DECIMAL(8,2) NOT NULL,
    JOININGDATE DATE NOT NULL,
    DEPARTMENTID INT FOREIGN KEY REFERENCES DEPARTMENT_DATA(DEPARTMENTID),
    DESIGNATIONID INT FOREIGN KEY REFERENCES DESIGNATION(DESIGNATIONID),
)

-- ----------------------------------------------------------------------------------- --

CREATE TABLE DESIGNATION
(
    DESIGNATIONID INT PRIMARY KEY,
    DESIGNATIONNAME VARCHAR(100) NOT NULL UNIQUE,
)

-- ----------------------------------------------------------------------------------- --

CREATE TABLE DEPARTMENT_DATA
(
    DEPARTMENTID INT PRIMARY KEY,
    DEPARTMENTNAME VARCHAR(100) NOT NULL UNIQUE,
)

-- ----------------------------------------------------------------------------------- --

INSERT INTO DEPARTMENT_DATA VALUES
(1,'ADMIN'),
(2,'IT'),
(3,'HR'),
(4,'ACCOUNT')

-- ----------------------------------------------------------------------------------- --

INSERT INTO DESIGNATION VALUES
(11,'JOBBER'),
(12,'WELDER'),
(13,'CLERK'),
(14,'MANAGER'),
(15,'CEO')

-- ----------------------------------------------------------------------------------- --

INSERT INTO PERSON_DATA VALUES 
(101,'RAHUL','ANSHU',56000,01-01-1990,1,12)
(102,'HARDIK','HINSU',18000,25-09-1990,2,11)
(103,'BHAVIN','KAMANI',25000,14-05-1991,NULL,11)
(104,'BHOOMI','PATEL',39000,20-02-2014,1,13)
(105,'ROHIT','RAJGOR',17000,23-07-1990,2,15)
(106,'PRIYA','MEHTA',25000,18-10-1990,2,NULL)
(107,'NEHA','TRIVEDI',18000,20-02-2014,3,15)

-- ----------------------------------------------------------------------------------- --

-- From the above given tables create Stored Procedures: 
-- Part - A 
-- 1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures. 
-- 2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY 
-- 3. Department, Designation & Person Table’s (If foreign key is available then do write join and take columns on 
-- select list) 
-- 4. Create a Procedure that shows details of the first 3 persons. 
-- Part - B 
-- 1. Create a Proc that takes the dept name as input and returns a table with all workers working in that dept. 
-- 2. Create Procedure that takes department name & designation name as input and returns a table with worker’s 
-- first name, salary, joining date & department name. 
-- 3. Create a Procedure that takes the first name as an input parameter and display all the details of the worker 
-- with their department & designation name. 
-- 4. Create Procedure which displays department wise maximum, minimum & total salaries. 
-- 5. Create Procedure which displays designation wise average & total salaries. 
-- Part - C 
-- 1. Create Procedure that Accepts Department Name and Returns Person Count. 
-- 2. Create a procedure that takes a salary value as input and returns all workers with a salary greater than input 
-- salary value along with their department and designation details. 
-- 3. Create a procedure to find the department(s) with the highest total salary among all departments. 
-- 4. Create a procedure that takes a designation name as input and returns a list of all workers under that 
-- designation who joined within the last 10 years, along with their department. 
-- 5. Create a procedure to list the number of workers in each department who do not have a designation assigned. 
-- 6. Create a procedure to retrieve the details of workers in departments where the average salary is above 12000. 
