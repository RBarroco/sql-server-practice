EXEC sp_execute_external_script
@language = N'Python',
-- Converting back to MS-SQL server
@script = N'
OutputDataSet = InputDataSet.iloc[5:10]
',
-- Converting into pandas dataFrame
@input_data_1 = N'SELECT DISTINCT CityName, StateProvinceID
FROM Application.Cities
ORDER BY CityName;'
-- proper column names -> Defining the Schema
WITH RESULT SETS (([CityName] nvarchar(100), [State ProvinceID] int));



--print(InputDataSet.iloc[5:15]) 
--print(InputDataSet.head(10)) 
--print(InputDataSet.iloc[[5,15]]) 