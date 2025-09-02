-- ----------------------------------------------------------------------------------- --
CREATE TABLE PERSON_DATA
(
    PERSON_ID INT PRIMARY KEY IDENTITY(101,1),
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
('RAHUL','ANSHU',56000,'1990-01-01',1,12),
('HARDIK','HINSU',18000,'1990-09-25',2,11),
('BHAVIN','KAMANI',25000,'1991-05-14',NULL,11),
('BHOOMI','PATEL',39000,'2014-02-20',1,13),
('ROHIT','RAJGOR',17000,'1990-07-23',2,15),
('PRIYA','MEHTA',25000,'1990-10-18',2,NULL),
('NEHA','TRIVEDI',18000,'2014-02-20',3,15)

-- ----------------------------------------------------------------------------------- --

-- From the above given tables create Stored Procedures: 
-- Part - A 
-- 1. Department, Designation & Person Table’s INSERT, UPDATE & DELETE Procedures. 
-- --------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------
CREATE PROC DEPARTMENT_INS_DEL_UPDATE
@DEPT_ID INT,@DEPT_NAME VARCHAR(200)
AS
BEGIN
	INSERT INTO DEPARTMENT_DATA VALUES(@DEPT_ID,@DEPT_NAME)
	UPDATE DEPARTMENT_DATA SET DEPARTMENTID = @DEPT_ID WHERE DEPARTMENTID = 3
	DELETE FROM DEPARTMENT_DATA WHERE DEPARTMENTID = 4
END

EXEC DEPARTMENT_INS_DEL_UPDATE 2,'CIVIL'
-- --------------------------------------------------------------------------------------------
CREATE PROC DESIGNATION_INS_DEL_UPDATE
@DESIG_ID INT,@DESIG_NAME VARCHAR(200)
AS
BEGIN
	INSERT INTO DESIGNATION VALUES(@DESIG_ID,@DESIG_NAME)
	UPDATE DESIGNATION SET DESIGNATIONID = @DESIG_ID WHERE DESIGNATIONID = 3
	DELETE FROM DESIGNATION WHERE DESIGNATIONID= 4
END
EXEC DESIGNATION_INS_DEL_UPDATE 15,'CEO'

SELECT * FROM DESIGNATION
-- --------------------------------------------------------------------------------------------
CREATE PROC PERSON_INS_DEL_UPDATE
@P_ID INT,@P_FNAME VARCHAR(200),@P_LNAME VARCHAR(200),@SALARY DECIMAL(8,2),@PDATE DATE,@D_ID INT, @DES_ID INT
AS
BEGIN
	INSERT INTO PERSON_DATA VALUES(@P_ID,@P_FNAME,@P_LNAME,@SALARY,@PDATE,@D_ID, @DES_ID)
	UPDATE PERSON_DATA SET DESIGNATIONID = @P_ID WHERE PERSON_ID = 3
	DELETE FROM PERSON_DATA WHERE DESIGNATIONID= 4
END
SELECT * FROM PERSON_DATA

EXEC PERSON_INS_DEL_UPDATE 15,'NEEL','SHAH',1000000,'1990-09-25',5,10
-- --------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------
-- 2. Department, Designation & Person Table’s SELECTBYPRIMARYKEY 

CREATE PROC DEPT_RETURN_BYPK
@DEPT_ID INT
AS 
BEGIN
	SELECT * FROM DEPARTMENT_DATA WHERE DEPARTMENTID = @DEPT_ID
END

EXEC DEPT_RETURN_BYPK 2
-- --------------------------------------------------------------------------------------------
CREATE PROC DESIG_RETURN_BYPK
@DESIG_ID INT
AS 
BEGIN
	SELECT * FROM DESIGNATION WHERE DESIGNATIONID = @DESIG_ID
END

EXEC DESIG_RETURN_BYPK 2
-- --------------------------------------------------------------------------------------------
CREATE PROC PERSON_RETURN_BYPK
@P_ID INT
AS 
BEGIN
	SELECT * FROM PERSON_DATA WHERE PERSON_ID = @P_ID
END

EXEC PERSON_RETURN_BYPK 2
-- --------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------
-- 3. Department, Designation & Person Table’s (If foreign key is available then do write join and take columns on select list)
CREATE PROC DEPT_DESIG_PERSON_JOIN
AS 
BEGIN

	SELECT * FROM PERSON_DATA PER JOIN DEPARTMENT_DATA D ON PER.DEPARTMENTID = D.DEPARTMENTID
	JOIN DESIGNATION DESIGN ON PER.DESIGNATIONID = DESIGN.DESIGNATIONID

END
EXEC DEPT_DESIG_PERSON_JOIN

SELECT * FROM PERSON_DATA
-- --------------------------------------------------------------------------------------------
-- 4. Create a Procedure that shows details of the first 3 persons. 
CREATE PROC DEPT_DESIG_PERSON_SELECT
AS 
BEGIN
	SELECT TOP 3 * FROM PERSON_DATA
	SELECT TOP 3 * FROM DEPARTMENT_DATA
	SELECT TOP 3 * FROM DESIGNATION
END

EXEC DEPT_DESIG_PERSON_SELECT
-- --------------------------------------------------------------------------------------------
-- Part - B 
SELECT * FROM PERSON_DATA
SELECT * FROM DEPARTMENT_DATA
SELECT * FROM DESIGNATION
-- --------------------------------------------------------------------------------------------
-- 1. Create a Proc that takes the dept name as input and returns a table with all workers 
-- working in that dept.
CREATE PROC PROC_DISPLQ
@DEPT_NAME VARCHAR(100)
AS
BEGIN
	SELECT * FROM PERSON_DATA WHERE DEPARTMENTID = (SELECT DEPARTMENTID FROM DEPARTMENT_DATA WHERE DEPARTMENTNAME = @DEPT_NAME)
END

EXEC PROC_DISPLQ 'ADMIN'
-- --------------------------------------------------------------------------------------------
-- 2. Create Procedure that takes department name & designation name as input and returns a table with worker’s first name, salary, joining date & department name. 
CREATE PROC PROC_DISPLAYQ1
@DEPT_NAME VARCHAR(100),@DESIG_NAME VARCHAR(100)
AS
BEGIN
	SELECT FIRSTNAME,SALARY,JOININGDATE ,@DEPT_NAME AS 'DEPARTMENTNAME' FROM PERSON_DATA WHERE DEPARTMENTID = (SELECT DEPARTMENTID FROM DEPARTMENT_DATA WHERE DEPARTMENTNAME = @DEPT_NAME) AND DESIGNATIONID
	=(SELECT DESIGNATIONID FROM DESIGNATION WHERE DESIGNATIONNAME = @DESIG_NAME)
END

EXEC PROC_DISPLAYQ1 'ADMIN', 'WELDER'
-- --------------------------------------------------------------------------------------------

-- 3. Create a Procedure that takes the first name as an input parameter and display all the details of the worker 
-- with their department & designation name. 
-- --------------------------------------------------------------------------------------------
CREATE PROC PROC_DISPLAYQ2
@FNAME VARCHAR(100)
AS
BEGIN
	SELECT PER.*,D.DEPARTMENTNAME,DES.DESIGNATIONNAME FROM PERSON_DATA PER 
	JOIN DEPARTMENT_DATA D ON PER.DEPARTMENTID = D.DEPARTMENTID 
	JOIN DESIGNATION DES ON PER.DESIGNATIONID = DES.DESIGNATIONID WHERE FIRSTNAME = @FNAME
END

EXEC PROC_DISPLAYQ2 'NEHA'

SELECT * FROM DESIGNATION
-- --------------------------------------------------------------------------------------------
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
