drop proc AverageBalance
go
if exists (select * from sys.procedures where name='NameEmployees')
if object_ID('NameEmployees','P') IS NOT NULL
drop proc NameEmployees
go
create or alter proc AverageBalance(@EmployeeNumberFrom int, @EmployeeNumberTo int, @AverageBalance int OUTPUT) as
begin
    declare @TotalAmount decimal(5,2)
	declare @NumOfEmployee int
	begin try
	    print 'The employee numbers are from ' + convert(varchar(10), @EmployeeNumberFrom) + ' to '
		      + convert(varchar(10), @EmployeeNumberTo)
		select @TotalAmount = sum(Amount) from tblTransaction
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
		select @NumOfEmployee = count(distinct EmployeeNumber) from tblEmployee
		where EmployeeNumber between @EmployeeNumberFrom and @EmployeeNumberTo
		set @AverageBalance = @TotalAmount / @NumOfEmployee
		RETURN 0
	end try
	begin catch
		set @AverageBalance = 0
		if ERROR_NUMBER() = 8134
		begin
			set @AverageBalance = 0
			Return 8134
		end
		else
			-- raiserror allows you to proceed even though the error is above level 10
			declare @ErrorMessage as varchar(255)
			select @ErrorMessage = error_message()
			raiserror (@ErrorMessage, 16, 1) 
			-- throw won't allows you to proceed if the error is above level 10

			--throw 56789, 'UnKnown Error', 1
		--SELECT ERROR_MESSAGE() AS ErrorMessage, ERROR_LINE() as ErrorLine,
		--	   ERROR_NUMBER() as ErrorNumber, ERROR_PROCEDURE() as ErrorProcedure,
		--	   ERROR_SEVERITY() as ErrorSeverity,  -- 0-10 for information
			   -- 16 default SQL SERVER log / Windows Application log
			   
			   -- 20-25 
		--	   ERROR_STATE() as ErrorState
		--RETURN 1
		select 'hi There'
	end catch
end
go

-- Right Simulation
DECLARE @AvgBalance int, @ReturnStatus int
execute @ReturnStatus = AverageBalance 221, 237, @AvgBalance OUTPUT
SELECT @AvgBalance as Average_Balance, @ReturnStatus as Return_Status
Go

-- Error Simulation
DECLARE @AvgBalance int, @ReturnStatus int
execute @ReturnStatus = AverageBalance 4, 5, @AvgBalance OUTPUT
SELECT @AvgBalance as Average_Balance, @ReturnStatus as Return_Status
Go

DECLARE @EmployeeName int = 123
select @EmployeeName