CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    ManagerID INT NOT NULL,
    Location VARCHAR(100) NOT NULL
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    DoB DATETIME NOT NULL,
    Gender VARCHAR(50) NOT NULL,
    HireDate DATETIME NOT NULL,
    DeptID INT NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (DeptID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    DepartmentID INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID, Location) VALUES
(1, 'IT', 101, 'New York'),
(2, 'HR', 102, 'San Francisco'),
(3, 'Finance', 103, 'Los Angeles'),
(4, 'Admin', 104, 'Chicago'),
(5, 'Marketing', 105, 'Miami')

INSERT INTO Employee (EmployeeID, FirstName, LastName, DoB, Gender, HireDate, DeptID, Salary) VALUES
(101, 'John', 'Doe', '1985-04-12', 'Male', '2010-06-15', 1, 75000.00),
(102, 'Jane', 'Smith', '1990-08-24', 'Female', '2015-03-10', 2, 60000.00),
(103, 'Robert', 'Brown', '1982-12-05', 'Male', '2008-09-25', 3, 82000.00),
(104, 'Emily', 'Davis', '1988-11-11', 'Female', '2012-07-18', 4, 58000.00),
(105, 'Michael', 'Wilson', '1992-02-02', 'Male', '2018-11-30', 5, 67000.00)

INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, DepartmentID) VALUES
(201, 'Project Alpha', '2022-01-01', '2022-12-31', 1),
(202, 'Project Beta', '2023-03-15', '2024-03-14', 2),
(203, 'Project Gamma', '2021-06-01', '2022-05-31', 3),
(204, 'Project Delta', '2020-10-10', '2021-10-09', 4),
(205, 'Project Epsilon', '2024-04-01', '2025-03-31', 5)

--PART A--
--1--

SELECT * FROM Departments
SELECT * FROM Employee
SELECT * FROM Projects

------------------------------------------------------------------------------------------------------------
-- 1. 
CREATE PROC SP01
@ENAME VARCHAR(100)
AS
BEGIN
	SELECT EmployeeID,DoB,Gender,HireDate FROM Employee E WHERE @ENAME = E.FirstName OR @ENAME = E.Lastname 
END
EXEC SP01 'DOE'
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
-- 2.
CREATE PROC SPO2
@DEPT_NAME VARCHAR(100)
AS
BEGIN
	SELECT * FROM Employee E JOIN Departments D on E.DeptID= D.DepartmentID WHERE DepartmentName = @DEPT_NAME
END
EXEC SPO2 'HR'
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
-- 3. 
ALTER PROC SP03
@PNAME VARCHAR(100),@DEPT_NAME VARCHAR(100)
AS
BEGIN
	SELECT * FROM Projects WHERE ProjectName = @PNAME AND DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = @DEPT_NAME)
END
EXEC SP03 'PROJECT ALPHA' ,'IT'
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
-- 4. 
CREATE PROC SP04
@r1 int,@r2 int
AS
BEGIN
	SELECT * FROM Employee WHERE Salary BETWEEN @r1 AND @r2
END
exec SP04 60000 ,750000
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
-- 5.
CREATE PROC SP05
@date date
AS
BEGIN
	SELECT * FROM Employee WHERE HireDate = @date
END
EXEC SP05 '2015-03-10'
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
--1 .
ALTER PROC SPOO1
@Gender VARCHAR(100)
AS
BEGIN
	SELECT * FROM Employee WHERE Gender LIKE @Gender+'%'
END
exec SPOO1 'M'
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
-- 2. 
CREATE PROC SP002
@FNAME VARCHAR(100),@DEPTNAME VARCHAR(100)
AS
BEGIN
	SELECT * FROM Employee E JOIN Departments D ON E.DeptID=D.DepartmentID WHERE E.FirstName = 'JANE' OR D.DepartmentName = 'HR'
END
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
-- 3.
CREATE PROC SP003
@LOCATION VARCHAR(100)
AS
BEGIN
	SELECT * FROM Departments WHERE Location LIKE @LOCATION+'%' OR Location LIKE '%'+@LOCATION+'%' 
END
EXEC SP003 ' '
------------------------------------------------------------------------------------------------------------
-- 1. 
CREATE PROC SP0001
@sdate date,@edate date
AS
BEGIN
	select * from Projects where StartDate=@sdate AND EndDate=@edate
END
------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-- 2. 
CREATE PROC SP0002
@PNAME VARCHAR(100),@LOCATION VARCHAR(100)
AS
BEGIN
	SELECT D.DepartmentName,E.FirstName,P.ProjectName,P.StartDate,P.EndDate FROM Employee E JOIN Departments D ON E.DeptID = D.DepartmentID JOIN
	Projects P ON D.DepartmentID = P.DepartmentID WHERE ProjectName=@PNAME AND D.Location=@LOCATION
END
EXEC SP0002 'PROJECT ALPHA','NEW YORK'
------------------------------------------------------------------------------------------------------------

