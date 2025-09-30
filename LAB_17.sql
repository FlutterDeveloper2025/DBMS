CREATE TABLE CUSTOMERS_EH
(
	CUS_ID INT PRIMARY KEY,
	CUS_NAME VARCHAR(250) NOT NULL,
	CUS_EMAIL VARCHAR(50) UNIQUE
)	

CREATE TABLE ORDERS_EH
(
	ORDER_ID INT PRIMARY KEY,
	CUS_ID INT FOREIGN KEY REFERENCES CUSTOMERS_EH(CUS_ID),
	ORDER_DATE DATE NOT NULL
)

--Part – A
--1.Handle Divide by Zero Error and Print message like: Error occurs that is - Divide by zero error.

BEGIN TRY
		DECLARE @NUM1 INT = 10;
		DECLARE @NUM2 INT = 0

		DECLARE @ANS INT = @NUM1/@NUM2
		PRINT 'ANSWER :: '+CAST(@ANS AS VARCHAR)
END TRY

BEGIN CATCH
	PRINT(ERROR_MESSAGE());
END CATCH
--2.Try to convert string to integer and handle the error using try…catch block.
BEGIN TRY
		DECLARE @NUM3 INT = 123;
		SET @NUM3 = CAST(@NUM3 AS INT)
		PRINT @NUM3
END TRY

BEGIN CATCH
	PRINT('CANNOT CONVERT STRING TO INTEGER');
END CATCH
--3.Create a procedure that prints the sum of two numbers: take both numbers as integer & handle exception with all error functions if any one enters string value in 
--numbers otherwise print result.
ALTER PROC SUM_PROC 
@NUM5 VARCHAR(50) , @NUM6 VARCHAR(50)
AS
BEGIN
	BEGIN TRY 
		DECLARE @A INT , @B INT;
		SET @A = CAST (@NUM5 AS INT);
		SET @B = CAST (@NUM6 AS INT);
	END TRY
	BEGIN CATCH
		PRINT 'ERROR NUMBER :: '+CAST(ERROR_MESSAGE() AS VARCHAR);
		PRINT 'ERROR MESSAGE :: '+ERROR_MESSAGE();
		PRINT 'ERROR SEVERITY :: '+CAST(ERROR_SEVERITY() AS VARCHAR);
		PRINT 'ERROR STATE :: '+CAST(ERROR_STATE() AS VARCHAR);
	END CATCH
END

EXEC SUM_PROC 10 , 10


--4.Handle a Primary Key Violation while inserting data into customers table and print the error details such as the error message, error number, severity, and state.
BEGIN TRY 
	INSERT INTO CUSTOMERS_EH VALUES 
	(1001 , 'GAUTAM','GAUTAM@GMAIL.COM'),
	(1001 , 'NEEL','NEEL@GMAIL.COM')
END TRY 
BEGIN CATCH
	PRINT 'DUPLICATE RECORD FOUND'
END CATCH

SELECT * FROM CUSTOMERS_EH

--5.Throw custom exception using stored procedure which accepts Customer_id as input & that throws Error like no Customer_id is available in database.
CREATE PROC CUS_ID_EXCEPTION1
@C_ID INT
AS
BEGIN 
	BEGIN TRY
		IF EXISTS (SELECT * FROM CUSTOMERS_EH WHERE  CUS_ID = @C_ID)
		BEGIN
			SELECT * FROM CUSTOMERS_EH WHERE  CUS_ID = @C_ID
		END
		ELSE
			THROW 50005 , 'customer not found',2
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
	END CATCH
END

EXEC CUS_ID_EXCEPTION1 102
--Part – B
--1.Handle a Foreign Key Violation while inserting data into Orders table and print appropriate error message.
BEGIN TRY
		INSERT INTO ORDERS_EH VALUES
		(201,101,'2025-09-03'),
		(202,102,'2025-05-27')
	END TRY
	BEGIN CATCH
		PRINT 'FOREIGN KEY VIOLATION'
		PRINT ERROR_MESSAGE()
	END CATCH
--2.Throw custom exception that throws error if the data is invalid.
	BEGIN TRY
		DECLARE @VAR1 INT;
		SET @VAR1 = -102
		
		IF(@VAR1 > 0 AND @VAR1 < 1000)
			PRINT 'NUMBER :: '+CAST (@VAR1 AS VARCHAR)
		ELSE
			THROW 50006 , 'INVALID DATA',3;
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        PRINT 'Caught an error: ' + @ErrorMessage;
	END CATCH
--3.Create a Procedure to Update Customer’s Email with Error Handling
SELECT * FROM CUSTOMERS_EH
INSERT INTO CUSTOMERS_EH VALUES (101, 'NEEL', 'NEEL@GMAIL.COM')
CREATE PROC CUS_EMAIL_UPD
@CUS_EMAIL NVARCHAR(100), @ID INT
AS
BEGIN
	BEGIN TRY
		IF(@CUS_EMAIL LIKE '%GMAIL.COM')
		BEGIN
			UPDATE CUSTOMERS_EH SET CUS_EMAIL = @CUS_EMAIL WHERE CUS_ID = @ID;
		END
		ELSE
		BEGIN
			THROW 50007, 'INVALID EMAIL',1 
		END
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        PRINT 'Caught an error: ' + @ErrorMessage;
	END CATCH
END

EXEC CUS_EMAIL_UPD 'NEEL',101
--Part – C
--1.Create a procedure which prints the error message that “The Customer_id is already taken. Try another one”.
CREATE PROC CUS_EMAIL_UPD1
@ID INT , @CUST_NAME VARCHAR(100) , @CUST_EMAIL NVARCHAR(100)
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT * FROM CUSTOMERS_EH WHERE CUS_ID = @ID)
		BEGIN
			INSERT INTO CUSTOMERS_EH VALUES (@ID , @CUST_NAME , @CUST_EMAIL)
			SELECT * FROM CUSTOMERS_EH;
		END
		ELSE
		BEGIN
			THROW 50008, 'CUSTOMER ID ALRWADY TAKEN ..',1
		END
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        PRINT 'Caught an error: ' + @ErrorMessage;
	END CATCH
END

SELECT * FROM CUSTOMERS_EH
EXEC CUS_EMAIL_UPD1 102 , 'GAUTAM','NEEL@GMAIL.COM'
--2.Handle Duplicate Email Insertion in Customers Table.
CREATE PROC DUPLICATE_EMAIL_INS_EC
@ID INT, @NAME VARCHAR(100), @GMAIL NVARCHAR(100)
AS
BEGIN
	BEGIN TRY
		IF NOT EXISTS(SELECT * FROM CUSTOMERS_EH WHERE CUS_EMAIL = @GMAIL)
		BEGIN
			INSERT INTO CUSTOMERS_EH VALUES (@ID , @NAME , @GMAIL)
			SELECT * FROM CUSTOMERS_EH;
		END
		ELSE
		BEGIN
			THROW 50009, 'CUSTOMER ID ALRWADY TAKEN ..',2
		END
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        PRINT 'Caught an error: ' + @ErrorMessage;
	END CATCH
END

EXEC DUPLICATE_EMAIL_INS_EC 103 , 'BHAVYA' , 'BHAVYA@GMAIL.COM' 
