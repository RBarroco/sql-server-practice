-- his is the equivalent of the undo command. But make sure you start with the BEGIN TRAN,
-- or it may be too late by the time the ROLLBACK TRAN statement is executed.

begin transaction
select count(*) from tblTransaction

delete tblTransaction
from tblTransaction
where EmployeeNumber IN
(select TNumber
from (
select tblEmployee.EmployeeNumber as ENumber, tblEmployee.EmployeeFirstName,
	   tblEmployee.EmployeeLastName, tblTransaction.EmployeeNumber as TNumber,
	   sum(tblTransaction.Amount) as TotalAmount
from tblEmployee
right join tblTransaction
on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
group by tblEmployee.EmployeeNumber, tblTransaction.EmployeeNumber,
	   tblEmployee.EmployeeFirstName, tblEmployee.EmployeeLastName
) as NewTable
where ENumber is null
)
select count(*) from tblTransaction
rollback transaction