--Perform the following using Northwind Database:
--1. Query to retrieve all products that have been ordered at least once and also have a unit price
--greater than $50:

select ProductID,ProductName from Products where UnitPrice > 50 and 
ProductID IN (select ProductID from [Order Details])

--2. Find all customers who have placed orders in 1997 but not in 1996:

select Distinct c.CustomerID, CompanyName,o.OrderDate from Customers c inner join Orders o on c.CustomerID=o.CustomerID
where OrderDate = '1997'

--3. Total revenue by year (sum of (UnitPrice * Quantity * (1 - Discount))

select Year(OrderDate),(SUM(UnitPrice * Quantity * (1-Discount)))AS TotalRevenueByYear from 
[Order Details] od inner join Orders o on od.OrderID=o.OrderID group by Year(o.OrderDate)

--4. Find the average order total for each customer, and show only customers with an average order
--total greater than $1,000:

select c.ContactName,Avg(od.UnitPrice*od.Quantity) AS Avg_TotalOrder from Orders o inner join Customers c 
on o.CustomerID=c.CustomerID inner join [Order Details] od on od.OrderID=o.OrderID group by c.ContactName
having Avg(od.UnitPrice*od.Quantity) > 1000

--5. Query to retrieve all employees who have sold products in both the USA and the UK

select FirstName,LastName from Employees where EmployeeID IN( select EmployeeID from Orders where Country
IN ('USA', 'UK'))
--or
select Distinct FirstName,LastName from Employees e inner join Orders o on e.EmployeeID=o.EmployeeID where 
Country IN ('USA', 'UK')
