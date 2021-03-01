select *
from dbo.TransList(123)
Go

select *, (select count(*) from dbo.TransList(E.EmployeeNumber)) as NumTransactions
from tblEmployee as E

-- Apply join the table with a result of a function
select *
from tblEmployee as E
outer apply TransList(E.EmployeeNumber) as T

-- Apply join the table with a result of a function
select *
from tblEmployee as E
cross apply TransList(E.EmployeeNumber) as T

--outer apply all of tblEmployee, UDF 0+ rows
--cross apply UDF 1+ rows

-- less performant
select * from tblEmployee as E
where (select count(*) from dbo.TransList(E.EmployeeNumber)) > 3
