--Inline Table Function
CREATE FUNCTION TransactionList(@EmployeeNumber int)
RETURNS TABLE AS RETURN
(
    SELECT * FROM tblTransaction
	WHERE EmployeeNumber = @EmployeeNumber
)

-- Table Function returned
Select * from dbo.TransactionList(123)


Select * from tblEmployee
where exists(select* from dbo.TransactionList(EmployeeNumber))

--The Same as:
select *
from tblEmployee as E
where exists(Select EmployeeNumber from tblTransaction as T where E.EmployeeNumber = T.EmployeeNumber)