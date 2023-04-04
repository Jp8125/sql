GO
CREATE SCHEMA MOD4
GO
CREATE TABLE  MOD4.Employee( 
 EMPLOYEE_ID INT PRIMARY KEY
, FIRST_NAME VARCHAR(50)
, LAST_NAME VARCHAR(50)
, SALARY INT NOT NULL
, JOINING_DATE DATETIME
,DEPARTMENT VARCHAR(20)
,MANAGER_ID INT
,LOCATION VARCHAR(40))
INSERT INTO mod4.Employee VALUES
(1 ,'Jhon', 'Doe' ,600000 ,'01-FEB-13  12:00:00  AM' ,'Banking', 2 ,'LONDON'),
 (2 ,'Robin', 'Nico', 650000 ,'01-FEB-13  12:00:00  AM' ,'Banking', 3,'INDIA'),
 (3 ,'Nikola', 'Tesla', 750000 ,'01-JAN-13  12:00:00  AM', 'Banking', 3,'USA' ),
(4 ,'Tom', 'Jose' ,600000 ,'01-FEB-13  12:00:00  AM' ,'Insurance', 2 ,'LONDON'),
 (5 ,'Jerry', 'Pinto', 650000 ,'01-FEB-13  12:00:00  AM' ,'Insurance', 3,'INDIA'),
 (6 ,'Philip', 'Mathew', 750000 ,'01-JAN-13  12:00:00  AM', 'Services', 3,'USA' ),
 (7 ,'TestName1', '123', 650000 ,'01-JAN-13  12:00:00  AM','Services',2,'LONDON'),
 (8 ,'TestName2' ,'Lname%' ,600000, '01-FEB-13  12:00:00  AM' ,'Insurance', 2,'USA')
--5. Create a view to select Select first_name, incentive amount from 
--employee and incentives table for those employees 
--who have incentives and incentive amount greater than 3000 
GO
CREATE VIEW INCENTIVE 
AS 
SELECT E.FIRST_NAME,I.INCENTIVE_AMOUNT FROM mod3.dbo.Employee AS E JOIN mod3.dbo.Incentives AS
I ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID WHERE I.INCENTIVE_AMOUNT>3000
GO
SELECT * FROM INCENTIVE
 --6. Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees
 --who work in London
 --Create a view to get the department name and number of employees in the department
