EXEC sp_execute_external_script
@language = N'Python',
-- Converting back to MS-SQL server
@script = N'
import pkg_resources
packages = [str(x) for x in pkg_resources.working_set]
packages.sort(key = str.lower)
OutputDataSet = pandas.DataFrame(packages)
'
WITH RESULT SETS (([Package] nvarchar(100)));