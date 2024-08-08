SQL Queries using ORDER BY, GROUP BY, AGGREGATE functions and WILD CARDS
--Get the price of an order (by multiplying unit price by quantity).
	select OrderID, (UnitPrice*Quantity) As OrderPrice from [Order Details]
--Display all cities that employees belong to but don’t allow repetition.
	select DISTINCT City from Employees
--Find complete name of all employees.
	select (FirstName +' '+ LastName)AS CompleteName from Employees
--List the name of all employees whose first name starts with the letter ‘A’.
	select (FirstName +' '+ LastName) AS CompleteName from Employees where FirstName Like 'A%'
--In Customer table, display all cities that ends with the letter ‘a’.
	select City from Customers where City Like '%a'
--Display names of all employees whose name contain ‘an’.
	select (FirstName +' '+ LastName)AS CompleteName from Employees where (FirstName +' '+ LastName) Like '%an%'
--Display all the orders where unit price lies in the range of 10$ to 40$.
	select * from [Order Details] where UnitPrice Between 10 and 40
	select Count(OrderID) from [Order Details] where UnitPrice Between 10 and 40
--Display the company name where Region is NULL in Customer Table.
	select CompanyName from Customers where Region is Null
--Write a query to list employees whose address does not contain Rd.
	select * from Employees where Address not like '%Rd%'
--List all products where UnitPrice is not in 10,12,15,17 or 19
select * from Products where UnitPrice not IN (10,12,15,17,19)
--11.  Display the highest, lowest, sum and average UnitPrice of each Category, where highest UnitPrice  lies in the range of 50$ to 100$. Label column as CategoryId, Maximum, Minimum, Sum and Average.
select CategoryId, Max(UnitPrice) AS MaximumPrice, Min(UnitPrice) AS Minimum, Sum(UnitPrice) AS Sum ,  Avg(UnitPrice) AS Average from Products group by CategoryID having Max(UnitPrice) Between 50 and 100 Order by Max(UnitPrice) Desc
--12. From customers table, Count all customers is each region where region is not null. (Table: Customers)
	select Count(CustomerID) AS NoOfCustomers from Customers where Region is not Null
--13. Write a query to display the number of ContactName with same ContactTitle. Sort contact title in descending order. (Table: Customers)
select ContactTitle, Count(ContactName) from Customers group by ContactTitle Order by ContactTitle DESC;
--14. Write a query that count all orders against each product id. No of orders should be greater than 50. (Table: [Order Details])
	select COUNT(OrderID) AS NoOfOrders, ProductID from [Order Details] group by ProductID
--15.List only those cities in which more than or equals to 2 employees are living
	select City from Employees group by City having Count(City) >=2
