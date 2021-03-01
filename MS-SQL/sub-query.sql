-- Where
select T.*
from tblTransaction as T
inner join tblEmployee as E
on E.EmployeeNumber = T.EmployeeNumber
where EmployeeLastName like 'y%'
order by T.EmployeeNumber

-- sub-query
select *
from tblTransaction as T
where EmployeeNumber in
	(select EmployeeNumber from tblEmployee as T where EmployeeLastName like 'y%')
order by EmployeeNumber

-- Where not
select *
from tblTransaction as T
where EmployeeNumber in
	-- sub-query limited in TblEmployee
	(select EmployeeNumber from tblEmployee as T where EmployeeLastName not like 'y%')
order by EmployeeNumber
		-- Inner join

-- not in tblTransaction
select *
from tblTransaction as T
where EmployeeNumber not in
	(select EmployeeNumber from tblEmployee as T where EmployeeLastName like 'y%')
order by EmployeeNumber
		-- Left join
