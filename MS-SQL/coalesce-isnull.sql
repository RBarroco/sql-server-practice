--5. Isnull and Coalesce
select * from tblEmployee where EmployeeMiddleName is null

declare @myOption as varchar(10) = 'Option B'
select isnull(@myOption, 'No Option') as MyOptions
go

declare @myFirstOption as varchar(10) = 'Option A'
declare @mySecondOption as varchar(10) = 'Option B'

select coalesce(@myFirstOption, @mySecondOption, 'No option') as MyOptions
go

select isnull('ABC',1) as MyAnswer
select coalesce('ABC',1) as MyOtherAnswer
go

select isnull(null,null) as MyAnswer
select coalesce(null,null) as MyOtherAnswer
go

create table tblExample
(myOption nvarchar(10) null)
go
insert into tblExample (myOption)
values ('Option A')

--bring back nullable columns
select coalesce(myOption, 'No option') as MyOptions
into tblIsCoalesce
from tblExample 
select case when myOption is not null then myOption else 'No option' end as myOptions from tblExample
go

--bring back only not null columns
select isnull(myOption, 'No option') as MyOptions
into tblIsNull
from tblExample 
go

drop table tblExample
drop table tblIsCoalesce
drop table tblIsNull


SELECT ISNULL([EmployeeMiddleName],'Blank') FROM [dbo].[tblEmployee] 
WHERE [EmployeeMiddleName] IS NULL

declare @myValue1 as nvarchar(4)
declare @myValue2 as int = 3
select COALESCE(@myValue1, @myValue2)


--That's right - IS NULL is very different from COALESCE, as there is a space is "IS NULL", which is used in WHERE and CASE statements. It is ISNULL (no space) and COALESCE which are similar.
