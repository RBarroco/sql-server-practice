-- Deleting rows in views
SELECT * FROM ViewByDepartment
delete from ViewByDepartment
where TotalAmount = 999.99 and EmployeeNumber = 132
GO
CREATE VIEW ViewSimple
as
SELECT * FROM tblTransaction
GO
BEGIN TRAN
delete from ViewSimple
where EmployeeNumber = 132
select * from ViewSimple
ROLLBACK TRAN

go
CREATE VIEW dbo.ViewByEmployee AS
SELECT [EmployeeNumber], [EmployeeFirstName], [EmployeeMiddleName], [EmployeeLastName], D.DepartmentHead
FROM [dbo].[tblEmployee] as E
left join [dbo].[tblDepartment] as D
on E.Department = D.Department
WHERE EmployeeNumber between 200 and 1299
go

-- Not able to delete because the view has been built over multiple tables
DELETE FROM dbo.ViewByEmployee
wHERE EmployeeNumber = 200

-- That's right - there is only one table used in the view, so you can insert records.
INSERT INTO ViewByEmployee values ('1199', 'Renato', '', 'Barroco', 'SDASDSDSAD', '')