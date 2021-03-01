SELECT DATENAME(month, dateOfBirth) as MonthNumber, count(*) as NumberEmployees,
-- already a summarizing so don't need to go to Group By
COUNT(EmployeeMiddleName) as NumberOfMiddleNames,
(COUNT(*) - COUNT(EmployeeMiddleName)) as  NonMiddleNames,
format(min(DateOfBirth), 'd') as EarliestDateOfBirth,
format(max(DateOfBirth), 'D') as LatestDateOfBirth
FROM tblEmployee
GROUP BY DATENAME(month, dateOfBirth), DATEPART(month, DateOfBirth)
ORDER BY DATEPART(month, dateOfBirth)

