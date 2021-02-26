-- Equal Any
select *
from tblTransaction as T
where EmployeeNumber = any --or some
	(select EmployeeNumber from tblEmployee as T where EmployeeLastName like 'y%')
order by EmployeeNumber

-- Any
select *
from tblTransaction as T
where EmployeeNumber <> any --or some
-- 126 <> (126 ,127, 128, 129) --> TRUE
	(select EmployeeNumber from tblEmployee as T where EmployeeLastName like 'y%')
order by EmployeeNumber

-- ALL
select *
from tblTransaction as T
where EmployeeNumber <> all
-- 126 <> (126 ,127, 128, 129) --> FALSE
	(select EmployeeNumber from tblEmployee as T where EmployeeLastName like 'y%')
order by EmployeeNumber

--any/some = OR
--all = AND