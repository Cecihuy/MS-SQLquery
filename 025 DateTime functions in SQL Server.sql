--Start Preparation
USE SQLTUTOR;

CREATE TABLE tblDateTime(
	c_time time(7) NULL,
	c_date date NULL,
	c_smalldatetime smalldatetime NULL,
	c_datetime datetime NULL,
	c_datetime2 datetime2(7) NULL,
	c_datetimeoffset datetimeoffset(7) NULL);

SELECT*FROM tblDateTime;
--End Preparation

--First Try
SELECT GETDATE();
SELECT CURRENT_TIMESTAMP;
SELECT SYSDATETIME();

SELECT GETUTCDATE();
SELECT SYSUTCDATETIME();
--End. all above query doesn't related to database. it get directly from system time installed SQL Server

--Second Try
INSERT INTO tblDateTime
	VALUES(GETDATE(),GETDATE(),GETDATE(),
	GETDATE(),GETDATE(),GETDATE());
SELECT*FROM tblDateTime;
--End. getting date from system time and inserting to their respective fields data type. 
--please pay attention for field c_datetimeoffset timezone for now +00:00

--Third Try
UPDATE tblDateTime 
	SET c_datetimeoffset ='2023-04-28 01:22:12.1300000 +10:00' --just copy from Second Try and change to +10:00
	WHERE c_datetimeoffset ='2023-04-28 01:22:12.1300000 +00:00';
--End. return setting offset of timezone to +10:00
