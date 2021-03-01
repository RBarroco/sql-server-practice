select * from sys.syscolumns
select * from sys.syscomments
select * from sys.views

--OR

-- searching for view name and its query
select V.name, S.text from sys.syscomments as S
inner join sys.views as V
on S.id = V.object_id

-- searching for object definition
select object_definition(object_id('dbo.ViewByDepartment'))

-- searching for views using sql_modules -> Finding the object_id
select * from sys.sql_modules

-- Adding new rows to views
begin tran

insert into ViewByDepartment(EmployeeNumber,DateOfTransaction,TotalAmount)
values (132,'2015-07-07', 999.99)

select * from ViewByDepartment order by Department, EmployeeNumber

rollback tran

begin tran
select * from ViewByDepartment order by EmployeeNumber, DateOfTransaction
--Select * from tblTransaction where EmployeeNumber in (132,142)

update ViewByDepartment
set EmployeeNumber = 142
where EmployeeNumber = 132

select * from ViewByDepartment order by EmployeeNumber, DateOfTransaction
--Select * from tblTransaction where EmployeeNumber in (132,142)
rollback tran

USE [70-461]
GO

--if exists(select * from sys.views where name = 'ViewByDepartment')
if exists(select * from INFORMATION_SCHEMA.VIEWS
where [TABLE_NAME] = 'ViewByDepartment' and [TABLE_SCHEMA] = 'dbo')
   drop view dbo.ViewByDepartment
go

-- With Encryption
CREATE OR ALTER VIEW [dbo].[ViewByDepartment] as --WITH ENCRYPTION as 
select D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount as TotalAmount
from tblDepartment as D
left join tblEmployee as E
on D.Department = E.Department
left join tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber between 120 and 139
WITH CHECK OPTION
--order by D.Department, T.EmployeeNumber
GO
