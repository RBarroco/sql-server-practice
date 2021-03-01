EXEC sp_execute_external_script
@language = N'Python',
@script = N'
Stats = InputDataSet.describe()
OutputDataSet = Stats.reset_index()
',
@input_data_1 = N'SELECT LatestRecordedPopulation FROM Application.Cities'
WITH RESULT SETS (([Statistic] char(20), [Population] float));