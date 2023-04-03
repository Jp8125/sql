--Aggregate Function
--SUM/COUNT/AVG/MAX/MIN
SELECT SUM(SALARY) TOTAL_SALARY FROM emp.Employee
SELECT AVG(SALARY) AVERAGE FROM emp.Employee
SELECT MAX(SALARY) MAXIMUM FROM emp.Employee
SELECT MIN(SALARY) MINIMUM FROM emp.Employee
SELECT COUNT(DEPARMENT) NO_OF_EMPLOYEE,DEPARMENT 
FROM emp.Employee GROUP BY (DEPARMENT)
--Group by/Having/ROLLUP
SELECT COUNT(EmployeeKey)AS NO_EMPLOYEE,Gender  
FROM AdventureWorksDW2016.dbo.DimEmployee GROUP BY (Gender)
SELECT Title ,COUNT(EmployeeKey) AS TOTAL_EMP 
FROM AdventureWorksDW2016.dbo.DimEmployee GROUP BY (Title)
HAVING COUNT(EmployeeKey) BETWEEN 3 AND 5
SELECT DEPARMENT, SUM(SALARY) FROM emp.Employee 
GROUP BY DEPARMENT WITH ROLLUP 
--Select into
SELECT FirstName,LastName,EmployeeKey INTO TEMP FROM AdventureWorksDW2016.dbo.DimEmployee
SELECT * FROM TEMP
--Joins
--Inner join/outer join/left outer join/right outer join/full outer join/self join
SELECT pc.EnglishProductCategoryName 
as [product_category],ps.EnglishProductSubcategoryName 
as [subcategory_name] FROM AdventureWorksDW2016.dbo.DimProductCategory 
as pc join AdventureWorksDW2016.dbo.DimProductSubcategory 
as ps on pc.ProductCategoryKey=ps.ProductCategoryKey
--Subqueries
--Practice Exercise