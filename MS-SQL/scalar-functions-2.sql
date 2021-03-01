-- Functions inside select are good performant
Go
select *, dbo.NumberOfTransactions(EmployeeNumber) as TransNum
from tblEmployee

GO
CREATE OR ALTER FUNCTION NumberOfTransactions(@EmployeeNumber int)
RETURNS int
As
BEGIN
	DECLARE @NumberOfTransactions INT
	SELECT @NumberOfTransactions = COUNT(*) from tblTransaction
	WHERE EmployeeNumber = @EmployeeNumber
	Return @NumberOfTransactions
END
