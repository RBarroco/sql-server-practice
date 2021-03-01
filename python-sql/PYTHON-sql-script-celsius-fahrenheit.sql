EXEC sp_execute_external_script
@language = N'Python',
@script = N'
Series = InputDataSet.reset_index()
celsius = Series.iloc[:,1]
fahrenheit = (Series.iloc[:,1])*1.8 + 32

df = pandas.DataFrame({"Celsius": celsius, "Fahrenheit":fahrenheit})
OutputDataSet = df
',
@input_data_1 = N'SELECT convert(float, Temperature) FROM Warehouse.ColdRoomTemperatures'
WITH RESULT SETS (([Celsius] float, [Fahrenheit] float))

