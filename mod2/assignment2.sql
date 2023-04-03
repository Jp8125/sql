use AdventureWorksDW2016
-- Write a query that displays the first name and the length of the first name for all employees 
--whose name starts with the letters 'A', 'J' or 'M'
SELECT  FirstName,LEN(FirstName) AS [LENGTH]  FROM dbo.DimEmployee WHERE FirstName LIKE '[JAM]%' ORDER BY FirstName
--2. Write a query to display the first name and salary for all employees. Format the salary to be 10 characters long,
--left-padded with the $ symbol. Label the column SALARY.
SELECT  LEFT(REPLICATE('$',10-len(SALARY))+trim(str(SALARY)), 10) FROM mod2.emp.Employee

--3. Write a query to display the employees with their code, first name,
--last name and hire date who hired either on seventh day of any month or seventh month in any year.
SELECT EmployeeKey,FirstName,LastName,HireDate  FROM dbo.DimEmployee WHERE HireDate like '%-07-%' or HireDate like '%-07'
-- . 4. Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position. 
SELECT LEN(FirstName) as length_name,FirstName,LastName FROM DimEmployee where LastName like'%__c%';
-- 5. Write a query to extract the last 4 character of phone numbers.
SELECT Phone,SUBSTRING(Phone,9,4) AS last_four_digits from DimEmployee
-- 6. Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'.
 SELECT Phone,REPLACE(Phone,'124','999') UPDATED_CONTECTS FROM DimEmployee 
-- . 7. Write a query to calculate the age in year
SELECT DATEDIFF(YEAR,BirthDate,CURRENT_TIMESTAMP) AS age FROM DimEmployee
-- . 8. Write a query to get the distinct Mondays from hire_date in employees tables.
SELECT  DATEPART(WEEKDAY,HireDate) AS [DAYS],FirstName,LastName  FROM dbo.DimEmployee
SELECT FirstName,LastName FROM dbo.DimEmployee WHERE  DATEname(WEEKDAY,HireDate)='monday'
SELECT FirstName,LastName,DATEPART(WEEKDAY,HireDate) AS [DAYOFJOINING] FROM dbo.DimEmployee WHERE  DATEPART(WEEKDAY,HireDate)=1

--  9. Write a query to get the first name and hire date from employees table where hire date between '1987-06-01' and '1987-07-30' 
SELECT FirstName,HireDate FROM DimEmployee WHERE HireDate BETWEEN '2008-06-01' and '2008-07-30'
-- Write a query to display the current date in the following format. 11. Sample output : 12:00 AM Sep 5, 2014 
SELECT (FORMAT( CURRENT_TIMESTAMP, 'hh:mm tt', 'en-gb')+' '+FORMAT( CURRENT_TIMESTAMP, 'D', 'en-gb')) as dat_and_time
-- 12. Write a query to get the firstname, lastname who joined in the month of June.
SELECT FirstName,LastName,HireDate FROM DimEmployee  WHERE HireDate LIKE '%-06-%'
-- 13. Write a query to get employee ID, last name, and date of first salary of the employees. 
SELECT LastName,EmployeeKey,FirstName,StartDate,DATEADD(MONTH,1,StartDate) SalaryDate FROM DimEmployee
--  14. Write a query to get first name, hire date and experience of the employees.
SELECT FirstName,HireDate,DATEDIFF(YEAR,HireDate,GETDATE()) AS experience FROM DimEmployee
-- 15. Write a query to get first name of employees who joined in 1987.
SELECT FirstName FROM DimEmployee WHERE HireDate LIKE '2007%'
-- 16. Write a query to rank employees based on their salary for a month
SELECT RANK() OVER (ORDER by (SALARY/12) desc) AS rank_by_salary,EMPLOYEE_ID,FIRST_NAME,SALARY FROM emp.Employee
-- 17. Select 4th Highest salary from employee table using ranking function
SELECT * from(SELECT Rank() OVER (ORDER by SALARY DESC) as rank_salary,SALARY 
FROM  AdventureWorksDW2016.emp.Employee) as tab2 where tab2.rank_salary=4;
