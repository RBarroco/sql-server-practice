-- New table
CREATE TABLE tblDepartment
(
Department VARCHAR(19) NULL,
DepartmentHead VARCHAR(19) NOT NULL,
)

--derived table
select count(Department) as NumberOgDepartments
into tblDepartment2
from
(select Department, count(*) as NumberOfDepartment
from tblEmployee
Group By Department) as newTable

-- Create table 
select DISTINCT Department, convert(varchar(20), N'') as DepartmentHead 
into tblDepartment
from tblEmployee

-- Drop table
drop table tblDepartment2

-- Alter table
alter table tblDepartment
alter column DepartmentHead varchar(30) null