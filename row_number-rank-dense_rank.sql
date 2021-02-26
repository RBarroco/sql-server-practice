select A.EmployeeNumber, A.AttendanceMonth,
A.NumberAttendance,
ROW_NUMBER() over(Partition by A.EmployeeNumber Order by  A.EmployeeNumber, A.AttendanceMonth) as TheRowNumber,
RANK() over(Partition by A.EmployeeNumber Order by  A.EmployeeNumber, A.AttendanceMonth) as TheRank,
DENSE_RANK() over(Partition by A.EmployeeNumber Order by  A.EmployeeNumber, A.AttendanceMonth) as TheDenseRank
from tblEmployee as E join tblAttendance as A
on E.EmployeeNumber = A.EmployeeNumber