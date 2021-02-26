select * from tblEmployee as E
left join tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber IS NULL
order by E.EmployeeNumber

select max(EmployeeNumber) from tblTransaction
-- order by EmployeeNumber ASC

go
with Numbers as (
-- EmployeeNumber without transaction 
select top(select max(EmployeeNumber) from tblTransaction) row_number() over(order by(select null)) as RowNumber
from tblTransaction as U)

select U.RowNumber from Numbers as U
left join tblTransaction as T
on U.RowNumber = T.EmployeeNumber
where T.EmployeeNumber is null
order by U.RowNumber

go
select row_number() over(order by(select null)) from sys.objects O cross join sys.objects P
go

-- Limited scope
go
with Numbers as (
-- EmployeeNumber without transaction 
select top(select max(EmployeeNumber) from tblTransaction) row_number() over(order by(select null)) as RowNumber
from tblTransaction as U)

select U.RowNumber from Numbers as U
left join tblTransaction as T
on U.RowNumber = T.EmployeeNumber
where T.EmployeeNumber is null
order by U.RowNumber
go