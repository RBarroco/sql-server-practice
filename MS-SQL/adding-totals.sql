select E.Department, E.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance, 0 as isNullValue
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
UNION
select E.Department, E.EmployeeNumber, NULL as AttendanceMonth, sum(A.NumberAttendance) as TotalAttendance,1
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
group by E.Department, E.EmployeeNumber
UNION
select E.Department, Null,  NULL as AttendanceMonth, sum(A.NumberAttendance) as TotalAttendance,1
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
group by E.Department
UNION
select Null, Null, NULL as AttendanceMonth, sum(A.NumberAttendance) as TotalAttendance, 1
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber
order by Department, EmployeeNumber, AttendanceMonth
