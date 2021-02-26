INSERT INTO tblEmployee
VALUES (142, 'Kevin','F','Vong','VJ762812O','19910208','HR')

select * from tblEmployee

ALTER TABLE tblEmployee
ALTER COLUMN Department VARCHAR(20)


INSERT INTO tblEmployee([EmployeeNumber],[EmployeeFirstName],[EmployeeMiddleName],[EmployeeLastName],[EmployeeGovernmentID],[DateOfBirth],[Department])
VALUES (142, 'Kevin','F','Vong','VJ762812O','19910208','HR')