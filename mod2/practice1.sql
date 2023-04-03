--STRING FUNCTION
SELECT ASCII('A')AS [ASCII]
SELECT CHAR(67) AS [CHAR O/P]
SELECT CHARINDEX('emp','your emp code is',4) AS [INDEX]
SELECT concat(FirstName,LastName) AS fullname FROM AdventureWorksDW2016.dbo.DimCustomer

SELECT FORMAT(BirthDate,'d','en-US')AS [format] FROM AdventureWorksDW2016.dbo.DimCustomer

DECLARE @db DATETIME='12/23/2023'
select FORMAT(@db,'d','en-US')as[noraml format]

SELECT LEFT(FirstName,2) AS remains  FROM AdventureWorksDW2016.dbo.DimCustomer
SELECT LEN(FirstName) AS lengthof FROM AdventureWorksDW2016.dbo.DimCustomer
SELECT LOWER(LastName) AS lower_case FROM AdventureWorksDW2016.dbo.DimCustomer
--LTRIM,PATINDEX,REPLACE,RTRIM,SOUNDEX,SPACE,STR,STUFF,SUBSTRING,TRIM,REPLICATE,REVERSE,RIGHT
SELECT LTRIM('            THIS IS EXAMPLE') AS TRIM_FUN 
SELECT PATINDEX('%555%',Phone) AS RESULT FROM AdventureWorksDW2016.dbo.DimCustomer
SELECT REPLACE(Phone,'555','990') AS [REPLACE] FROM AdventureWorksDW2016.dbo.DimEmployee
SELECT RTRIM('RIGTH TRIM EXAMPLE                ')AS [RTRIM];
SELECT  SOUNDEX(FirstName) AS UNIQUE_VAL FROM AdventureWorksDW2016.dbo.DimEmployee
SELECT SPACE(10)+LastName AS PaddedName FROM AdventureWorksDW2016.dbo.DimEmployee
SELECT REPLACE(STR(1555),'555','990') NEW_STR
SELECT STUFF('DEMO STRING',5,5,'444444') AS [ADD]
SELECT SUBSTRING('STRING TO ADD IS STR1',5,7) AS [SUBSTR]
SELECT TRIM('				THIS IS PADDED STRING								') AS [TRIM] 
SELECT REPLICATE('THIS WILL REPEAT-',3) AS [REPEAT]
SELECT TOP 4 REVERSE(FirstName)[REVERSE-NAME] FROM AdventureWorksDW2016.dbo.DimEmployee
SELECT RIGHT(FirstName,2) AS [remains FROM RIGHT]  FROM AdventureWorksDW2016.dbo.DimCustomer

SELECT GETDATE() AS NewDate
SELECT DATEDIFF(YEAR,'2001-09-28',GETDATE()) AS DIFF_DATE
SELECT DATEADD(MONTH,5,'2023-2-23') NEW_DATE
SELECT DAY(GETDATE()) AS [DAY], MONTH(CURRENT_TIMESTAMP)[MM] ,YEAR(CURRENT_TIMESTAMP)[YYYY]

SELECT RANK() OVER (ORDER BY PercentageOfOwnership) AS [Rank],PercentageOfOwnership FROM AdventureWorksDW2016.dbo.DimOrganization
SELECT  DENSE_RANK() OVER (ORDER BY PercentageOfOwnership) AS [DanseRank],PercentageOfOwnership FROM AdventureWorksDW2016.dbo.DimOrganization
SELECT  ROW_NUMBER() OVER (ORDER BY PercentageOfOwnership) AS [Row_Number],PercentageOfOwnership FROM AdventureWorksDW2016.dbo.DimOrganization
