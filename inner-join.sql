select tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName, sum(Amount) as SumOfAmount
from tblEmployee
left join tblTransaction
on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
Group by tblEmployee.EmployeeNumber, EmployeeFirstName, EmployeeLastName
order by tblEmployee.EmployeeNumber asc


SELECT * FROM tblTransaction
where EmployeeNumber = 1046