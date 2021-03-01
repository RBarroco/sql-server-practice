CREATE OR ALTER FUNCTION [dbo].[TransactionList](@EmployeeNumber int)
RETURNS TABLE AS RETURN
(
    SELECT * FROM tblTransaction
	WHERE EmployeeNumber = @EmployeeNumber
)
GO
SELECT *
from dbo.TransactionList(123)
GO
Create or alter Function TransList(@EmployeeNumber int)
RETURNS @TransList TABLE
(Amount smallmoney,
DateOfTransaction smalldatetime,
EmployeeNumber int)
AS
BEGIN
	INSERT INTO @TransList(Amount, DateOfTransaction, EmployeeNumber)
	SELECT Amount, DateOfTransaction, EmployeeNumber FROM tblTransaction
	WHERE EmployeeNumber = @EmployeeNumber
	RETURN
END
