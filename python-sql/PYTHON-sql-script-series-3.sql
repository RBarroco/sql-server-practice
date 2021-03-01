EXEC sp_execute_external_script
@language = N'Python',
@script = N'
A = "Apple"
B = "Banana"
C = "Cherry"
X = "Red"
Y = "Yellow"
Z = "Red"

fruit = pandas.Series([A,B,C])
color = pandas.Series([X, Y, Z])

df = pandas.DataFrame({"Fruits": fruit, "Color": color})

print(df)
OutputDataSet = df
'
WITH RESULT SETS (([Fruits] nvarchar(20), [Color] nvarchar(20)))