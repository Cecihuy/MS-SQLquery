USE SQLTUTOR;
--Try All this. no needed database table preparation
SELECT ABS(-101.5); --return 101.5 without monus sign
SELECT CEILING(15.2); --return 16. ceiling return nearest integer value > or = to the parameter.
SELECT CEILING(-15.2); --return -15. why? -15 is greater than -15.2
SELECT FLOOR(15.2); --return 15. floor return nearest integer value < or = to the parameter.
SELECT FLOOR(-15.2); --return -16. why? -16 is smaller than -15.2
SELECT POWER(2,5); --return 32. why? 2*2*2*2*2
SELECT SQUARE(9); --return 81. why? 9*9
SELECT SQRT(81); --return 9. square root
--First Try
SELECT RAND(); 
--End. return random number between 0-1 with decimal. value changed each execution

--Second Try
SELECT RAND(3);
--End. giving any value to parameter return random number between 0-1 with decimal. value unchanged every execution

--Third Try
SELECT (RAND()*100);
--End. return random number between 0-100 with decimal

--Fourth Try
SELECT FLOOR(RAND()*100);
--End. return random number between 0-100 without decimal

--Fifth Try
DECLARE @counter INT
	SET @counter = 1
	WHILE (@counter <= 10)
	BEGIN
		PRINT FLOOR(RAND()*100)
		SET @counter = @counter + 1
	END;
--End. return 10 random number between 1-100 without decimal

--Try round. second parameter is how many digit decimal, third parameter set to 0 for rounded up if value >5 . set to 1 for deactivating rounded up
SELECT ROUND(850.556,2,0); --return 850.560
SELECT ROUND(850.556,2,1); --return 850.550
SELECT ROUND(850.556,1,0); --return 850.600
SELECT ROUND(850.556,1,1); --return 850.500
SELECT ROUND(850.556,-2,0); --return 900000
SELECT ROUND(850.556,-1,0); --return 850.000
--End