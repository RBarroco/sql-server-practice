EXEC sp_execute_external_script
@language = N'Python',
@script = N'
A = "Apple"
B = "Banana"
C = "Cherry"
#print(A, B, C)
MyFruit = [A, B, C]
#print(MyFruit)
#print(MyFruit[1])
MySeries = pandas.Series(MyFruit)
MySeries[0] = "Orange"
print(MySeries)
'