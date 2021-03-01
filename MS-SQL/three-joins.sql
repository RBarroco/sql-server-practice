-- Three joins
select DepartmentHead, sum(Amount) as SumOfAmount
from tblDepartment
left join tblEmployee
on tblDepartment.Department = tblEmployee.Department
left join tblTransaction
on tblEmployee.EmployeeNumber = tblTransaction.EmployeeNumber
Group By DepartmentHead
Order by DepartmentHead

-- Inserting new department
Insert into tblDepartment(Department, DepartmentHead) values ('Accounts', 'James')

-- Alias
select D.DepartmentHead, sum(T.Amount) as SumOfAmount
from tblDepartment as D
left join tblEmployee as E
on D.Department = E.Department
left join tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
group by D.Departmenthead
order by D.DepartmentHead