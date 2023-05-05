--First Try
CREATE DATABASE SQLTUTOR;
--End. create database

--Second Try
ALTER DATABASE SQLTUTOR MODIFY NAME = SQLTUTORIAL;
--End. changed database name

--Third Try
SP_RENAMEDB SQLTUTORIAL, SQLTUTOR;
--End. changed database name with built in store procedure query

--Fourth Try
DROP DATABASE SQLTUTOR;
--End. delete database

--Fifth Try
ALTER DATABASE SQLTUTOR SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
--End. if we want to drop database immediately even other user use it,
--then change the database first with this query