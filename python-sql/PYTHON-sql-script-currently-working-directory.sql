-- Print Python's current working directory
EXECUTE sp_execute_external_script
@language = N'Python',
@script = N'
print(os.getcwd())
'