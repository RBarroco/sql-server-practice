CREATE OR ALTER PROCEDURE CountCities	@Count intASEXECUTE sp_execute_external_script@language = N'Python',@script = N'OutputDataSet = InputDataSet.head(n)',@input_data_1 = N'SELECT CityID, CityName FROM Application.Cities',@params = N'@n int',
-- Mapping Python param to SQL param
@n = @CountWITH RESULT SETS (([CityID] int, [CityName] nvarchar(50)));EXEC CountCities @Count = 20