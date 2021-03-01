select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance,
-- brings the total sum of the range/rows 
sum(A.NumberAttendance) 
over(partition by A.EmployeeNumber, year(A.AttendanceMonth) 
     order by A.AttendanceMonth 
	 rows between 9999 preceding and 9999 following) as RunningTotalAttendance
from tblEmployee as E join tblAttendance as A 
on E.EmployeeNumber = A.EmployeeNumber
where A.AttendanceMonth < '20150101' --over calculates after where
order by A.EmployeeNumber, A.AttendanceMonth -- descending order
