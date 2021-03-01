-- Adding new rows to views and changing the underlying table
begin tran

-- here we end up incurring in error becuase we are trying to insert data into two
-- different base tables and we can do it with view, as long as we only add to an unique base
-- table
insert into ViewByDepartment(Department, EmployeeNumber,DateOfTransaction,TotalAmount)
values ('Customer Relations', 132,'2015-07-07', 999.99) -- Error

--For example:
insert into ViewByDepartment(EmployeeNumber,DateOfTransaction,TotalAmount)
values (132,'2015-07-07', 999.99) -- no Error

select * from ViewByDepartment order by Department, EmployeeNumber
--select * from tblTransaction where EmployeeNumber = 132

rollback tran

begin tran
--select * from ViewByDepartment order by EmployeeNumber, DateOfTransaction
Select * from tblTransaction where EmployeeNumber in (132,142)

update ViewByDepartment
set EmployeeNumber = 142
where EmployeeNumber = 132

select * from ViewByDepartment order by EmployeeNumber, DateOfTransaction
Select * from tblTransaction where EmployeeNumber in (132,142)
rollback tran

USE [70-461]
GO

CREATE OR ALTER VIEW [dbo].[ViewByDepartment] as 
select D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount
from tblDepartment as D
left join tblEmployee as E
on D.Department = E.Department
left join tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber between 120 and 144
WITH CHECK OPTION -- Nobody will be able to update instances in the view

--order by D.Department, T.EmployeeNumber
GO
