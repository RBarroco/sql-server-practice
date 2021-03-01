-- Python script template
EXECUTE sp_execute_external_script
@language = N'Python',
@script = N'
print("")
print("The number of OrderIDs is: " + str(InputDataSet.OrderID.count()))
print("The sum total OrderIDs is: " + str(InputDataSet.OrderTotal.sum()))
print("The maximum of all orders is: " + str(InputDataSet.OrderTotal.max()))
print("The minimum of all orders is: " + str(InputDataSet.OrderTotal.min()))
print("")
print(InputDataSet.describe())
',
@input_data_1 = N'SELECT Orders.OrderID,
convert(float, SUM(OrderLines.UnitPrice*OrderLines.Quantity)) As OrderTotal
FROM Sales.Orders
INNER JOIN Sales.Orderlines ON Orders.OrderID = OrderLines.OrderID
GROUP BY Orders.OrderID
ORDER BY Orders.OrderID;'
