CREATE TABLE tblTransaction
(
-- monye, smallmoney, float, real, decimal(7,2)
Amount smallmoney NOT NULL,
-- datetime, date, datetime2, datetimeoffset, smalldatetime (seconds always zero, only 4bytes)
DateOfTransation smalldatetime NULL,
EmployeeNumber int NOT NULL
)