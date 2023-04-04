CREATE view HumanResources.v_candidate
AS 
select p.FirstName,e.Resume from HumanResources.JobCandidate 
as e join Person.Person as p on e.BusinessEntityID=p.BusinessEntityID
go
select * from HumanResources.v_candidate
GO
ALTER VIEW HumanResources.v_candidate
AS  
SELECT p.FirstName, p.LastName, e.HireDate  
FROM HumanResources.Employee AS e JOIN Person.Person AS p  
ON e.BusinessEntityID = p.BusinessEntityID WHERE HireDate LIKE '%-05-%'; 
GO
SELECT * FROM HumanResources.v_candidate
--index
CREATE INDEX UNQ ON HumanResources.Employee(LoginID,BusinessEntityID)
go
CREATE PROCEDURE HumanResources.sp_person
AS 
SELECT * FROM Person.Person 
EXEC HumanResources.sp_person
GO
CREATE PROCEDURE FIND @DATE VARCHAR(10)
AS
SELECT * FROM HumanResources.Employee WHERE HireDate LIKE @DATE
EXEC FIND @DATE='%2008%'

SELECT * FROM dbo.View_FROM_GUI
--CREATE FUNCTION HumanResources.UFD_filterSalary(@salary)
--returns varchar
--as
--begin
--end
