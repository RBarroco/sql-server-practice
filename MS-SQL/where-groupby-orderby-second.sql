select left([EmployeeLastName],1) as Initial, count(*) as counterOfInicial from tblEmployee
GROUP BY left([EmployeeLastName],1)
ORDER BY count(*) DESC

select top(5) left([EmployeeLastName],1) as Initial, count(*) as counterOfInicial from tblEmployee
GROUP BY left([EmployeeLastName],1)
ORDER BY count(*) DESC

select left([EmployeeLastName],1) as Initial, count(*) as counterOfInicial from tblEmployee
WHERE DateOfBirth > '19860101'
GROUP BY left([EmployeeLastName],1)
HAVING count(*)>=20
ORDER BY counterOfInicial DESC -- in the 'Order By' we can use the Alias





