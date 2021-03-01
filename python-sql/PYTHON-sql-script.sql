--EXEC sp_configure 'external scripts enabled',1
--RECONFIGURE WITH OVERRIDE

--sp_configure

--EXEC sp_execute_external_script
--@language = N'Python',
--@script = N'
--print("Hello World")
--'

EXEC sp_execute_external_script
@language = N'Python',
@script = N'
import sys
print(sys.version)
'