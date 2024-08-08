--1. Display Product’s name and their supplier’s name (ContactName), whose supplier’s name doesnot contain Dirk and there should be at most 7 characters in Product’s name.

SELECT ProductName, ContactName FROM Products p JOIN  Suppliers s ON p.SupplierID = s.SupplierID WHERE ContactName NOT LIKE 'Dirk%' AND LEN(ProductName)<=7;

--2. Create a report showing order ID. OrderDate. EmployeeID, and the firstname and LastName of the associated Employee (Tables: Employees & Orders )

SELECT o.OrderID, o.OrderDate, e.EmployeeID, e.FirstName, e.LastName FROM Orders o JOIN Employees e ON o.EmployeeID = e.EmployeeID;

--3.  List distinct cities from of customers and suppliers, country must be Germany.

(SELECT City FROM Customers WHERE Country = 'Germany') UNION (SELECT City FROM Suppliers WHERE Country = 'Germany')

--4. List all cities (duplicate values allowed)from of customers and suppliers

(SELECT City FROM Customers) UNION ALL (SELECT City FROM Suppliers)

--5. lists all customers and suppliers (ContactName, City, Country)

(SELECT ContactName,City,Country FROM Customers) UNION ALL (SELECT ContactName,City,Country FROM Suppliers)


