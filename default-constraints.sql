-- Default constraints in action
alter table tblTransaction
add DateOfEntry datetime

-- adding constraint for DateOfEntry
alter table tblTransaction
add constraint defDateOfEntry DEFAULT GETDATE() for DateOfEntry;

delete from tblTransaction where EmployeeNumber < 3

-- the first insert into uses GETDATE() because there is a constraint when DateOfEntry is ommitted
insert into tblTransaction(Amount, DateOfTransaction, EmployeeNumber)
values (1, '2014-01-01', 1)

-- here the date was provided '2013-01-01'
insert into tblTransaction(Amount, DateOfTransaction, EmployeeNumber, DateOfEntry)
values (2, '2014-01-02', 1, '2013-01-01')

select * from tblTransaction where EmployeeNumber < 3

create table tblTransaction2
(Amount smallmoney not null,
DateOfTransaction smalldatetime not null,
EmployeeNumber int not null,
-- each contrainst has to have its own name
DateOfEntry datetime null CONSTRAINT tblTransaction2_defDateOfEntry DEFAULT GETDATE())

insert into tblTransaction2(Amount, DateOfTransaction, EmployeeNumber)
values (1, '2014-01-01', 1)
insert into tblTransaction2(Amount, DateOfTransaction, EmployeeNumber, DateOfEntry)
values (2, '2014-01-02', 1, '2013-01-01')

select * from tblTransaction2 where EmployeeNumber < 3

drop table tblTransaction2

-- before droping the columns we need to drop any constraint related to it.
alter table tblTransaction
drop column DateOfEntry

alter table tblTransaction
drop constraint defDateOfEntry

BEGIN TRAN

ALTER TABLE tblTransaction
ADD DateOfEntry datetime
DEFAULT GETDATE() WITH VALUES

SELECT * FROM tblTransaction

ROLLBACK TRAN
