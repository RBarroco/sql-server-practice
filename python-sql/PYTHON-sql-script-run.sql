--EXEC sp_execute_external_script
--@language = N'Python',
--@script = N'
--A = "Hello "
--B = str(2)
--print(A + B)
--'

--EXEC sp_execute_external_script
--@language = N'Python',
--@script = N'
--A = 1
--while A <10:
-- print(A)
-- A = A + 1
--'

--EXEC sp_execute_external_script
--@language = N'Python',
--@script = N'
--for x in range (0,3):
--	print(x)
--	print("Hello World")
--'

--EXEC sp_execute_external_script
--@language = N'Python',
--@script = N'
--for x in "Hello World":
--	print(x)
--'

EXEC sp_execute_external_script
@language = N'Python',
@script = N'
for x in ["red", "blue", "green", "purple"]:
	print(x)
'