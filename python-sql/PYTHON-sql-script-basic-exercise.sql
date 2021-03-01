EXEC sp_execute_external_script
@language = N'Python',
-- Converting back to MS-SQL server
@script = N' 
print(InputDataSet.shape)
print(InputDataSet.size)
OutputDataSet = InputDataSet[0:10]
',
@input_data_1 = N'SELECT ColorName, ColorID
From Warehouse.Colors
WHERE ColorID > 20;'
WITH RESULT SETS (([ColorName] nvarchar(20), [ColorID] int))

