select * from tblEmployee where EmployeeNumber = 194
select * from tblTransaction where EmployeeNumber = 3
select * from tblTransaction where EmployeeNumber = 194

begin tran
-- select * from tblTransaction where EmployeeNumber = 194
update tblTransaction
set EmployeeNumber = 194
-- update, delete or insert statements we use output
output inserted.EmployeeNumber, deleted.EmployeeNumber
from tblTransaction
where EmployeeNumber in (3,5,7,9)

-- select * from tblTransaction where EmployeeNumber = 194
rollback tran