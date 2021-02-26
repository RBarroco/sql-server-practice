-- Creating an indexed view -> Good for performance
USE [70-461]
GO

select * from dbo.ViewByDepartment

-- inner join, tables refereced by using dbo.,and with schemabinding, and NO DUPLICATES

CREATE OR ALTER VIEW [dbo].[ViewByDepartment] with schemabinding as 
select D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount
from dbo.tblDepartment as D
inner join dbo.tblEmployee as E
on D.Department = E.Department
inner join dbo.tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber between 120 and 139
GO

drop view [ViewByDepartment]

-- We needed to use INDEX which is singular to different features;
-- EmployeeNumber, Department, DateOfTransaction;
CREATE UNIQUE CLUSTERED INDEX inx_ViewByDepartment
on dbo.ViewByDepartment(EmployeeNumber, Department, DateOfTransaction)


-- not able to delete because of the indexing (bounded everything together)
begin tran
drop table tblEmployee
rollback tran
