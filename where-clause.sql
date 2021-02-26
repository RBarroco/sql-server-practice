-- 8. Subquery in the from/select clause
Select *, (select count(EmployeeNumber)
           from tblTransaction as T
		   where T.EmployeeNumber = E.EmployeeNumber) as NumTransactions,
		  (Select sum(Amount)
		   from tblTransaction as T
		   where T.EmployeeNumber = E.EmployeeNumber) as TotalAmount
from tblEmployee as E
Where E.EmployeeLastName like 'y%' --correlated subquery

-- 9. Subquery in the where clause
select *
from tblTransaction as T
Where exists
	(Select EmployeeNumber from tblEmployee as E where EmployeeLastName like 'y%' and T.EmployeeNumber = E.EmployeeNumber)
order by EmployeeNumber


-- 9b. Subquery in the where clause
select *
from tblTransaction as T
Where not exists
	(Select EmployeeNumber from tblEmployee as E where EmployeeLastName like 'y%' and T.EmployeeNumber = E.EmployeeNumber)
order by EmployeeNumber

-- Exercise
select Amount, DateOfTransaction, EmployeeNumber,
(select Department from [dbo].[tblEmployee] as E --only one
where E.EmployeeNumber = T.EmployeeNumber) as tblEmployee
from [dbo].[tblTransaction] as T