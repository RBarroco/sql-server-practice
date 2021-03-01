EXEC sp_execute_external_script
@language = N'Python',
@script = N'
A = "Apple"
B = "Banana"
C = "Cherry"

# List -> Series -> DataFrame
OutputDataSet = pandas.DataFrame(pandas.Series([A,B,C]))
'
WITH RESULT SETS (([Fruit] nvarchar(20)));