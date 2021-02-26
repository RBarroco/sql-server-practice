select A.EmployeeNumber, A.AttendanceMonth, A.NumberAttendance
-- brings the total sum of the range/rows 
,sum(A.NumberAttendance) 
over(partition by A.EmployeeNumber, year(A.AttendanceMonth) 
     order by A.AttendanceMonth 
	 rows between current row and unbounded following) as RowsTotal
	 ,sum(A.NumberAttendance) 
over(partition by A.EmployeeNumber, year(A.AttendanceMonth) 
     order by A.AttendanceMonth 
	 range between  current row and unbounded following) as RangeTotal
from tblEmployee as E join (select * from tblAttendance UNION ALL select * from tblAttendance) as A 
on E.EmployeeNumber = A.EmployeeNumber
--where A.AttendanceMonth < '20150101' --over calculates after where
order by A.EmployeeNumber, A.AttendanceMonth -- descending order

-- Range is slower than rows
-- Only use Range when we need to take care of ties

-- unbounded preceding and current row
-- current row and unbounded following
-- unbounded preceding and unbounded following -- Range and Rows same


-- range between unbounded preceding and unbounded following - DEFAULT where there is no ORDER BY
-- range between unbounded preceding and current row         - DEFAULT where there is an ORDER BY