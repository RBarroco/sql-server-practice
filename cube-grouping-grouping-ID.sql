select E.Department, E.EmployeeNumber, A.AttendanceMonth as AttendanceMonth, sum(A.NumberAttendance) as NumberAttendance,
GROUPING(E.EmployeeNumber) AS EmployeeNumberGroupedBy,
GROUPING_ID(E.Department, E.EmployeeNumber, A.AttendanceMonth) AS EmployeeNumberGroupedID
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
-- group by ROLLUP (E.Department, E.EmployeeNumber, A.AttendanceMonth)
group by GROUPING SETS ((E.Department, E.EmployeeNumber, A.AttendanceMonth), (E.Department), ())
-- send the values to the end
order by CASE WHEN Department       IS NULL THEN 1 else 0 END, Department,
		 CASE WHEN E.EmployeeNumber IS NULL THEN 1 else 0 END, E.EmployeeNumber,
		 CASE WHEN AttendanceMonth  IS NULL THEN 1 else 0 END, AttendanceMonth

--coalesce(Department, 'zzzzzzz'), coalesce(E.EmployeeNumber, 99999), coalesce(AttendanceMonth, '2100-01-01')
