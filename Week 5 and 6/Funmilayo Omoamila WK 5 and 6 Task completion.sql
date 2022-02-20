--Q1: -- Who are our top 10 customers and how much have they spent and ordered?--

Select Customers.CompanyName As Name, sum(OrderDetails.UnitPrice*Quantity) As TotalSpend
FROM Customers JOIN Orders on Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails on Orders.OrderId = OrderDetails.OrderID
GROUP BY Customers.CustomerID
ORDER BY TotalSpend DESC
LIMIT 10;

--Q2:What are our top customers’ favorite products?--

Select Customers.CompanyName As Name, sum(OrderDetails.UnitPrice*Quantity) As TotalSpend, Products.ProductName
FROM Customers JOIN Orders on Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails on Orders.OrderId = OrderDetails.OrderID
JOIN Products on OrderDetails.ProductID = Products.ProductID
GROUP BY Customers.CustomerID
ORDER BY TotalSpend DESC
LIMIT 10;

--Q3:Where are our customers mostly located and how much is the total spend per country?--

Select Customers.Country As Country, count(Customers.CustomerID) As NumberOfCustomers, sum(OrderDetails.UnitPrice*Quantity) As TotalSpend
FROM Customers JOIN Orders on Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails on Orders.OrderId = OrderDetails.OrderID
GROUP BY Customers.Country
ORDER BY NumberOfCustomers DESC;

--Q4:What are our top 10 most popular products?--

SELECT OrderDetails.ProductID, Products.ProductName As Product, count(Orders.OrderID) As OrderCount
FROM Products JOIN OrderDetails On Products.ProductID = OrderDetails.ProductID
JOIN Orders On OrderDetails.OrderId = Orders.OrderId
GROUP BY Products.ProductName
ORDER BY OrderCount DESC
LIMIT 10;

--Q5:Who are the suppliers of our most popular products?

SELECT OrderDetails.ProductID, Products.ProductName As Product, count(Orders.OrderID) As OrderCount, Suppliers.CompanyName As Supplier
FROM Products JOIN OrderDetails On Products.ProductID = OrderDetails.ProductID
JOIN Orders On OrderDetails.OrderId = Orders.OrderId
JOIN Suppliers On Products.SupplierID = Suppliers.SupplierID
GROUP BY Products.ProductName
ORDER BY OrderCount DESC
LIMIT 10;

--Q6:Who are our Top 15 best performed Employees?

SELECT Employees.EmployeeID, Employees.FirstName, Employees.LastName, count( Orders.EmployeeID) As SalesCount
FROM Employees JOIN Orders On Employees.EmployeeID = Orders.EmployeeID
Group BY Employees.EmployeeID
ORDER BY SalesCount;

