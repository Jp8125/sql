CREATE TABLE  Employee( 
 EMPLOYEE_ID INT PRIMARY KEY
, FIRST_NAME VARCHAR(50)
, LAST_NAME VARCHAR(50)
, SALARY INT NOT NULL
, JOINING_DATE DATETIME
,DEPARTMENT VARCHAR(20)
,MANAGER_ID INT)
INSERT INTO Employee VALUES
(4 ,'Tom', 'Jose' ,600000 ,'01-FEB-13  12:00:00  AM' ,'Insurance', 2 ),
 (5 ,'Jerry', 'Pinto', 650000 ,'01-FEB-13  12:00:00  AM' ,'Insurance', 3),
 (6 ,'Philip', 'Mathew', 750000 ,'01-JAN-13  12:00:00  AM', 'Services', 3 ),
 (7 ,'TestName1', '123', 650000 ,'01-JAN-13  12:00:00  AM','Services',2),
 (8 ,'TestName2' ,'Lname%' ,600000, '01-FEB-13  12:00:00  AM' ,'Insurance', 2)
 SELECT * FROM dbo.Employee
 CREATE TABLE Incentives (
   EMPLOYEE_REF_ID INT
 , INCENTIVE_DATE DATETIME NOT NULL
 ,INCENTIVE_AMOUNT INT NOT NULL
 , CONSTRAINT FK_EMP FOREIGN KEY(EMPLOYEE_REF_ID) REFERENCES Employee(EMPLOYEE_ID)
 )
 INSERT INTO Incentives VALUES
  (1,'01-FEB-13' ,5000),
  (2 ,'01-FEB-13' ,3000),
  (3 ,'01-FEB-13' ,4000),
  (1,'01-JAN-13',45000),
  (2 ,'01-JAN-13' ,3500) 
  --1. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table 
  SELECT DATEDIFF(DAY,E.JOINING_DATE,I.INCENTIVE_DATE) AS [DIFF_DAYS] FROM Employee 
  AS E JOIN Incentives AS I ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID
  --Select first_name, incentive amount from employee and incentives table for those
  --employees who have incentives and incentive amount greater than 3000 
    SELECT E.FIRST_NAME,I.INCENTIVE_AMOUNT FROM Employee AS E INNER JOIN Incentives AS I ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID
	WHERE I.INCENTIVE_AMOUNT>3000
	--Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives
	SELECT E.FIRST_NAME,I.INCENTIVE_AMOUNT FROM  Employee AS E FULL OUTER JOIN  Incentives AS I ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID
	 --Select EmployeeName, ManagerName from the employee table
	 SELECT E2.FIRST_NAME AS EMPLOYEE
	 ,E1.FIRST_NAME 
	 AS MANAGER FROM 
	 Employee AS E1 
	 JOIN  Employee AS E2
	 ON E1.EMPLOYEE_ID=E2.MANAGER_ID
--Select first_name, incentive amount from employee and incentives table for all employees even 
--if they didn't get incentives and set incentive amount as 0 for those employees who didn't get incentives.
SELECT E.FIRST_NAME,ISNULL( I.INCENTIVE_AMOUNT,0) FROM  Employee AS E FULL OUTER JOIN  Incentives AS I ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID
--Get department,total salary with respect to a department from employee table.
SELECT SUM(SALARY) [TOTAL SALARY],DEPARTMENT FROM Employee GROUP BY DEPARTMENT
--Get department,total salary with respect to a department from employee table order by total salary descending 
SELECT SUM(SALARY) [TOTAL SALARY],DEPARTMENT FROM Employee GROUP BY DEPARTMENT ORDER BY [TOTAL SALARY] DESC
--Get department wise maximum salary from employee table order by salary ascending
 SELECT MAX(SALARY) [MAX SALARY],DEPARTMENT FROM Employee GROUP BY DEPARTMENT ORDER BY [MAX SALARY] DESC
--Get department wise minimum salary from employee table order by salary ascending 
 SELECT MIN(SALARY) [MAX SALARY],DEPARTMENT FROM Employee GROUP BY DEPARTMENT ORDER BY [MAX SALARY] ASC
--10. Select department,total salary with respect to a department from employee table where
--total salary greater than 800000 order by Total_Salary descending
 SELECT SUM(SALARY) AS [TOTAL SALARY],DEPARTMENT FROM Employee GROUP BY DEPARTMENT  HAVING SUM(SALARY)>800000 ORDER BY [TOTAL SALARY] DESC