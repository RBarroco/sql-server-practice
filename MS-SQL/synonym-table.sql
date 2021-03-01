-- table exist
create synonym EmployeeTable
for tblEmployee
go

select * from EmployeeTable

-- Don't need even to exist the table
create synonym DateTable
for tblDate
go

select * from DateTable

create synonym RemoteTable
for server_name.database_name.schema_name.object_name
go

-- synonyms make easy to write code
select * from RemoteTable 
