------------------------------------------
CREATE TABLE DEPARTMENT
(
	DNAME NVARCHAR(100) NOT NULL,
	DID INT PRIMARY KEY
);
------------------------------------------
CREATE TABLE STUDENT_DATA
(
	RNO INT PRIMARY KEY,
	NAME NVARCHAR(100) NOT NULL,
	CITY NVARCHAR(100) NOT NULL,
	DID INT FOREIGN KEY REFERENCES DEPARTMENT(DID)
)
------------------------------------------
CREATE TABLE ACADEMIC
(
	RNO INT PRIMARY KEY,
	SPI DECIMAL (8,2),
	BKLOG INT
)
------------------------------------------
INSERT INTO DEPARTMENT VALUES
('Computer',10),
('Electrical',20),
('Mechanical',30),
('Civil',40)
------------------------------------------
INSERT INTO STUDENT_DATA VALUES
(101,'RAJU','RAJKOT',10),
(102,'AMIT','AHEMDABAD',20),
(103,'SANJAY','BARODA',40),
(104,'NEHA','RAJKOT',20),
(105,'MEERA','AHEMDABAD',30),
(106,'MAHESH','BARODA',10)
------------------------------------------
INSERT INTO ACADEMIC VALUES
(101,8.8,0),
(102,9.2,2),
(103,7.6,1),
(104,8.2,4),
(105,7.0,2),
(106,8.9,3)
------------------------------------------

--PART :: A
--1. Display details of students who are from computer department.
SELECT * FROM STUDENT_DATA WHERE DID IN (SELECT DID FROM DEPARTMENT WHERE DNAME = 'COMPUTER')
--2.Displays name of students whose SPI is more than 8.
SELECT NAME FROM STUDENT_DATA WHERE RNO IN (SELECT RNO FROM ACADEMIC WHERE SPI > 8)
--3. Display details of students of computer department who belongs to Rajkot city
SELECT * FROM STUDENT_DATA WHERE DID IN (SELECT DID FROM DEPARTMENT WHERE DNAME = 'COMPUTER')AND CITY = 'RAJKOT'
--4. Find total number of students of electrical department
SELECT COUNT(DID) FROM STUDENT_DATA WHERE DID IN (SELECT DID FROM DEPARTMENT WHERE DNAME = 'ELECTRICAL')
--5. Display name of student who is having maximum SPI.
SELECT NAME FROM STUDENT_DATA WHERE RNO IN (SELECT RNO FROM ACADEMIC WHERE SPI=(SELECT MAX(SPI) FROM ACADEMIC))
--6.Display details of students having more than 1 backlog.
SELECT NAME FROM STUDENT_DATA WHERE RNO IN (SELECT RNO FROM ACADEMIC WHERE BKLOG > 1)


--PART :: B
--1.Display name of students who are either from computer department or from mechanical department.
SELECT * FROM STUDENT_DATA WHERE DID IN (SELECT DID FROM DEPARTMENT WHERE DNAME = 'COMPUTER' OR DNAME = 'MECHANICAL')
--2. Display name of students who are in same department as 102 studying in.
SELECT * FROM STUDENT_DATA S WHERE DID IN (SELECT DID FROM STUDENT_DATA WHERE RNO=102)

--PART :: C
--1.Display name of students whose SPI is more than 9 and who is from electrical department.
SELECT NAME FROM STUDENT_DATA WHERE RNO IN (SELECT RNO FROM ACADEMIC WHERE SPI > 9 )AND DID IN(SELECT DID FROM DEPARTMENT WHERE DNAME  = 'ELECTRICAL')
--2.Display name of student who is having second highest SPI.
SELECT TOP 1 S.NAME,TEMP.SPI FROM STUDENT_DATA S
JOIN (SELECT TOP 2 RNO,SPI FROM ACADEMIC ORDER BY SPI DESC) AS TEMP
ON S.RNO = TEMP.RNO
ORDER BY TEMP.SPI 
--3.Display city names whose students SPI is 9.2
SELECT CITY FROM STUDENT_DATA WHERE RNO IN (SELECT RNO FROM ACADEMIC WHERE SPI = 9.2)
--4.Find the names of students who have more than the average number of backlogs across all students.
SELECT sd.Name
FROM STUDENT_DATA sd
JOIN ACADEMIC ac ON sd.Rno = ac.RNO
WHERE ac.BKLOG > (SELECT AVG(BKLOG) FROM ACADEMIC);
--5.Display the names of students who are in the same department as the student with the highest SPI.
SELECT sd.Name
FROM STUDENT_DATA sd
JOIN ACADEMIC ac ON sd.Rno = ac.RNO
WHERE sd.DID = (SELECT TOP 1 sd2.DID 
                FROM STUDENT_DATA sd2 
                JOIN ACADEMIC ac2 ON sd2.Rno = ac2.RNO 
                ORDER BY ac2.SPI DESC )

