GO
CREATE SCHEMA emp
GO
--EMPLOYEE_ID FIRST_NAME LAST_NAME SALARY JOINING_DATE DEPARTMENT
CREATE TABLE emp.Employee(
[EMPLOYEE_ID] INT PRIMARY KEY
,[FIRST_NAME] varchar(40) NOT NULL
,[LASTNAME] varchar(40) NOT NULL
,[SALARY] INT NOT NULL
,[JOINING_DATE] DATE NOT NULL
,[DEPARMENT] varchar(30) NOT NULL
)
INSERT INTO emp.Employee VALUES
( 1, 'John', 'Abraham', 1000000,'01-JAN-13','Banking'),
(2,'Michael','Clarke',800000,'01-JAN-13','Insurance'),
(3,'Roy','Thomas',700000,'01-FEB-13','Banking'),
(4,'Tom','Jose',600000,'01-FEB-13','Insurance'),
(5,'Jerry','Pinto',650000,'01-FEB-13','Insurance'),
(6,'Philip','Mathew',750000,'01-JAN-13','Services'),
(7,'TestName1','123',650000,'01-JAN-13','Services'),
(8,'TestName2','Lname%',600000,'01-FEB-13','Insurance')
SELECT * FROM emp.Employee

SELECT FIRST_NAME
,LASTNAME
FROM emp.Employee

SELECT FIRST_NAME
AS [Employee Name]
FROM emp.Employee

SELECT EMPLOYEE_ID
,FIRST_NAME
,LASTNAME
,SALARY
,JOINING_DATE
,DEPARMENT 
FROM emp.Employee 
WHERE emp.Employee.FIRST_NAME='John'

SELECT *
FROM emp.Employee 
WHERE emp.Employee.FIRST_NAME='John'
OR Employee.FIRST_NAME='Roy'

SELECT *
FROM emp.Employee 
WHERE emp.Employee.FIRST_NAME<>'John'
AND Employee.FIRST_NAME<>'Roy'

SELECT *
FROM emp.Employee 
WHERE emp.Employee.FIRST_NAME LIKE 'J%'

SELECT *
FROM emp.Employee 
WHERE emp.Employee.FIRST_NAME LIKE '%o%'
--Get employee details from employee table whose Salary between 500000 and 800000
SELECT *
FROM emp.Employee 
WHERE emp.Employee.SALARY BETWEEN  500000 AND 800000;
--Get unique DEPARTMENT from employee table
SELECT DISTINCT DEPARMENT
FROM emp.Employee 
-- Select TOP 2 salary from employee table

SELECT TOP 2 SALARY  FROM emp.Employee ORDER BY SALARY DESC;

 --Store the output of below query in common table expression, and then find out the average of their salary 
WITH SALARY_CTE(SALARY_EMP)
AS
(
SELECT SALARY FROM emp.Employee WHERE SALARY BETWEEN 500000 AND 800000
)
SELECT AVG(SALARY_EMP) AS [Average Salary] FROM SALARY_CTE
--Get names of employees from employee table who has '%' in Last_Name
SELECT FIRST_NAME,LASTNAME FROM emp.Employee WHERE LASTNAME LIKE '%[%]'
 --Give 10% incentive to each employee, find out the employee whose incentive amount is more than 1lac, using derived table
SELECT FIRST_NAME FROM (SELECT SALARY*10/100  [insentive],* FROM emp.Employee) [TEMP]  WHERE [insentive]=100000
