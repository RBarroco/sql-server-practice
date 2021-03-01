EXEC sp_execute_external_script
@language = N'Python',
@script = N'
CityIDSeries = InputDataSet.iloc[:, 0]
CityNameSeries = InputDataSet.iloc[:, 1]

CityNameSeries[3] = "Shelbyville"

df = pandas.DataFrame({"ID":CityIDSeries , "Name": CityNameSeries})
OutputDataSet = df
',
@input_data_1 = N'SELECT TOP 10 CityID, CityName FROM Application.Cities'
WITH RESULT SETS (([CityID] char(20), [CityName] char(20)));