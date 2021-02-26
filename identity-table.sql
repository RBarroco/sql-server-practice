-- Primary Key – In Practice
alter table tblEmployee
add constraint PK_tblEmployee PRIMARY KEY (EmployeeNumber)

insert into tblEmployee(EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, 
EmployeeGovernmentID, DateOfBirth, Department) 
values (2004, 'FirstName', 'MiddleName', 'LastName', 'AB12345FR', '2014-01-01', 'Accounts')

delete from tblEmployee
where EmployeeNumber = 2004

alter table tblEmployee
drop constraint PK_tblEmployee

-- IDENTITY(1,1) automatically insert new rows
create table tblEmployee2
(EmployeeNumber int CONSTRAINT PK_tblEmployee2 PRIMARY KEY IDENTITY(1,1),
EmployeeName nvarchar(20))

insert into tblEmployee2
values ('My Name'),
('My Name')

select * from tblEmployee2

-- It does not reset the index
delete from tblEmployee2

-- It does reset the index
truncate table tblEmployee2

-- Cannot insert explicit value for identity column in table 'tblEmployee2'
-- when IDENTITY_INSERT is set to OFF.
insert into tblEmployee2(EmployeeNumber, EmployeeName)
values (3, 'My Name'), (4, 'My Name')

SET IDENTITY_INSERT tblEmployee2 ON

insert into tblEmployee2(EmployeeNumber, EmployeeName)
values (38, 'My Name'), (39, 'My Name')

SET IDENTITY_INSERT tblEmployee2 OFF

drop table tblEmployee2

-- Find the last identity used regardless of hte table used
select @@IDENTITY
select SCOPE_IDENTITY()

-- Find an IDENTITY of a specific table
select IDENT_CURRENT('dbo.tblEmployee2')

create table tblEmployee3
(EmployeeNumber int CONSTRAINT PK_tblEmployee3 PRIMARY KEY IDENTITY(1,1),
EmployeeName nvarchar(20))

insert into tblEmployee3
values ('My Name'),
('My Name')
