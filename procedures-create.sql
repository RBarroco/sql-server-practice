drop proc NameEmployees
go
create or alter proc NameEmployees(@EmployeeNumberFrom int, @EmployeeNumberTo int, @NumberOfRows int OUTPUT) as
begin
    if exists (Select * from tblEmployee where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo)
	BEGIN
		select EmployeeNumber, EmployeeFirstName, EmployeeLastName
		from tblEmployee
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
		set @NumberOfRows = @@ROWCOUNT
		RETURN 0
	END
	else
	Begin
		set @NumberOfRows = 0
		RETURN 1
	end
end
go

DECLARE @NumberRows int, @ReturnStatus int
execute @ReturnStatus = NameEmployees 4, 227, @NumberRows OUTPUT
SELECT @NumberRows as MyRowCount, @ReturnStatus as Return_Status
Go

DECLARE @EmployeeName int = 123
select @EmployeeName