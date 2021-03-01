EXEC sp_execute_external_script
@language = N'Python',
@script = N'
X = 1
while X < 10:
	print (X)
X = X+1
',
@input_data_1 = N'SELECT CityID, CityName from Application.Cities'
WITH RESULT SETS (([CityID] int, [CityName] nvarchar(50)));
