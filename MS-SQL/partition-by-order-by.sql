select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
-- brings the total sum of the range/rows 
sum(A.NumberAttendance) over(partition by A.EmployeeNumber order by A.AttendanceMonth DESC) as RunningTotalAttendance
,convert(decimal(18,7), A.NumberAttendance) / sum(A.NumberAttendance) over(partition by A.EmployeeNumber) * 100.0000 as PercentageAttendance
from tblEmployee as E join tblAttendance as A 
on E.EmployeeNumber = A.EmployeeNumber
where A.AttendanceMonth < '20150101' --over calculates after where


select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
-- brings the total sum of the range/rows 
sum(A.NumberAttendance) over(partition by A.EmployeeNumber order by A.AttendanceMonth DESC) as RunningTotalAttendance
,convert(decimal(18,7), A.NumberAttendance) / sum(A.NumberAttendance) over(partition by A.EmployeeNumber) * 100.0000 as PercentageAttendance
from tblEmployee as E join tblAttendance as A 
on E.EmployeeNumber = A.EmployeeNumber
where A.AttendanceMonth < '20150101' --over calculates after where
order by A.EmployeeNumber, A.AttendanceMonth -- descending order
