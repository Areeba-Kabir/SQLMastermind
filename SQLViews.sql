--1.	Add a view called Managers in the Northwind database that shows only employees that supervise other employees.

Use Northwind
Go
create view Managers
AS
select EmployeeID,FirstName,LastName from Employees where EmployeeID IN (select ReportsTo from Employees)

--2.	Create Northwind view called “Products by Category” based on the columns CategoryName and ProductName.

Use Northwind
Go
Create view ProductsbyCategory
As
select Distinct p.ProductName,c.CategoryName from Products p inner join Categories c on p.CategoryID=c.CategoryID where Discontinued=0

--3.	Create a view that shows a table that list all the publishers and store names using pubs.

Use pubs
GO
Create View [Publishers and StoreName]
AS
select pub_name,city,state, 'Publisher' AS Type from publishers Union select stor_name,city,state, 'Store' AS Type from stores

--4.	Create a view that shows a table that list all the authors and store names using pubs.

Use pubs
GO
Create View [Authors and StoreName]
AS
select au_fname as Name,city,state, 'Author' AS Type from authors Union select stor_name as Name,city,state, 'Store' AS Type from stores

--5.	Create a view the amount total amount spend by customers.

Use Northwind 
GO
Create View [Amount Spend by Customers]
AS
select CompanyName, Sum(UnitPrice*Quantity) AS [Total Amount]  from Customers c inner join Orders o on o.CustomerID=c.CustomerID 
inner join [Order Details] od on od.OrderID=o.OrderID group by c.CompanyName
 
--6.	Create a view for customers shippers information.

Use Northwind
GO
Create View [Customers-Shippers Info]
AS
select CompanyName,Phone,'Customer' AS Type from Customers Union select CompanyName,Phone,'Shipper' AS Type from Shippers
