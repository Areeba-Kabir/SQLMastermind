--Display all employees whose job id is the same as of employee PMA42628M. Use Pubs.

select (fname+' '+lname) AS Name, job_id from employee where job_id in (select job_id from employee where emp_id='PMA42628M')

--Display the last name, job id, hire_date of all employees whose hire_date is equal to the minimum hire_date.

select lname, job_id, hire_date from employee where hire_date = (select min(hire_date) from employee)

--Display all employees who have got min job level. Use Pubs.

select job_id,fname,lname,job_lvl from employee where job_lvl = (select min(job_lvl) from employee)

--list all Northwind customers who have not placed an order.

select * from Customers where CustomerID Not IN (select CustomerID from Orders)
select c.CustomerID, CompanyName, ContactName from Customers c left join Orders o on c.CustomerID=o.CustomerID where o.OrderID is NULL

--We wanted to know the ProductIDs of every item sold on the first day any product was purchased from the system. If you already know the first day that an order was placed in the system, then it’s no problem; the query would look something like this:

select od.OrderID, ProductID, o.OrderDate from [Order Details] od inner join Orders o on od.OrderID = o.OrderID where OrderDate = (select min(OrderDate) from Orders)

--Find the company’s name that placed order 10290. (Tables : Customers & Orders)

select CompanyName from Customers where CustomerID =(select CustomerID from Orders where OrderID= 10290)

--Find the Companies that placed orders in 1997 (Tables : Customers & Orders)

select CompanyName from Customers where CustomerID IN (select CustomerID from Orders where OrderDate='1997')


--Create a report that shows the product name and supplier id for all products supplied by Exotic Liquids, Grandma Kelly's Homestead, and Tokyo Traders. (Tables : Products & Suppliers)
--	HINT: You will need to escape the apostrophe in "Grandma Kelly's Homestead." 	To do so, place another apostrophe in front of it. For example,
--	SELECT * FROM Suppliers WHERE CompanyName='Grandma Kelly‘’s 	Homestead’;

select SupplierID,ProductName from Products where SupplierID IN (select SupplierID from Suppliers where CompanyName IN ('Exotic Liquids','Grandma Kelly''s Homestead','Tokyo Traders'))

--4.   Create a report that shows all products by name that are in the Seafood category. 	(Tables : Products & Categories)

select ProductName from Products where CategoryID IN (select CategoryID from Categories where CategoryName='Seafood')

--5.   Create a report that shows all companies by name that sell products 	in CategoryID 8. (Tables : Supplier & Products)

select CompanyName from Suppliers where SupplierID In (select SupplierID from Products where CategoryID=8)

--6.   Create a report that shows all 5companies by name that sell products in the 	Seafood category.(Tables: Suppliers, Products & Categories)

select Distinct CompanyName from Suppliers where SupplierID In (select SupplierID from Products where CategoryID = (select CategoryID from Categories where CategoryName='Seafood'))

select Distinct s.CompanyName from Suppliers s join Products p on s.SupplierID=p.SupplierID join Categories c on p.CategoryID=c.CategoryID where CategoryName='Seafood';