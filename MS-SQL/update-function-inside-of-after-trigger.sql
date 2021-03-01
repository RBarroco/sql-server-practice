-- Update functions
ALTER TRIGGER TR_tblTransaction
ON tblTransaction
AFTER UPDATE
AS
BEGIN
	--IF @@ROWCOUNT > 0
	IF UPDATE(DateOfTransaction)
	BEGIN
		select *, 'Inserted' from Inserted
		select *, 'Deleted' from Deleted
	END
END
GO

-- insert and deleted
update tblTransaction
set DateOfTransaction = '2015-07-19'
where Amount = 123 and DateOfTransaction = '2015-07-19' and EmployeeNumber = 123

delete from tblTransaction
where Amount = 123 and DateOfTransaction = '2015-07-11' and EmployeeNumber = 123

insert into tblTransaction(Amount, DateOfTransaction, EmployeeNumber)
VALUES (123,'2015-07-11', 123)

SELECT * FROM ViewByDepartment where TotalAmount = -2.77 and EmployeeNumber = 132

begin tran
delete from ViewByDepartment
where TotalAmount = -2.77 and EmployeeNumber = 132
rollback tran

ALTER TRIGGER TR_tblTransaction
ON tblTransaction
AFTER DELETE, INSERT, UPDATE
AS
BEGIN
	--SELECT COLUMNS_UPDATED()
	IF UPDATE(Amount) -- if (COLUMNS_UPDATED() & POWER(2,1-1)) > 0
	BEGIN
		select * from Inserted
		select * from Deleted
	END
END
go

begin tran
--SELECT * FROM ViewByDepartment where TotalAmount = -2.77 and EmployeeNumber = 132
update ViewByDepartment
set TotalAmount = +2.77
where TotalAmount = -2.77 and EmployeeNumber = 132
rollback tran
