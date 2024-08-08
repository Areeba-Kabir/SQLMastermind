--1. Display Product Name and its Category Name where Category Name starts with B (Hint: Left join category and product, use wild card)

SELECT CategoryName , ProductName from Categories AS c Left Join Products AS p on c.CategoryID =p.CategoryID where ProductName LIKE 'B%'

--2. Display Titles and their quantity (Hint Pubs database, table title and sales, left join) 

select Title,qty from titles t left join sales s on t.title_id=s.title_id 

--3. Use Right join to display Book Title and publisher Names (Hint pubs Database, Table Title and Publisher) Write down the reason for any null values if coming in title column.

select title,pub_name from titles t Right Join publishers p on t.pub_id=p.pub_id

--4. User Right join to display those publishers where title is null.

select pub_name,title from titles t Right Join publishers p on t.pub_id=p.pub_id where title is NULL

--5. Use self-join to display Publishers name where city is same (Publisher id should be different) Sample example

select p1.pub_name, p1.city from publishers as p1 , publishers as p2 where (p1.city = p2.city) and (p1.pub_id <> p2.pub_id);

--6. Use cross join (Cartesian join) to Display Book Title and Publisher Name.

select Distinct t.title, p.pub_name from titles t cross join publishers p 

--7. Use two full joins to Display Product Name, Category Name and Supplier Name (Hint: Below Example)

select  p.ProductName, c.CategoryName, s.ContactName from Suppliers s full join Products p on s.SupplierID=p.SupplierID full join Categories c on p.CategoryID=c.CategoryID 

--8. Use full join to display the name of Supplier for the product starting with letter C (Hint: Northwind)

select  p.ProductName, s.ContactName from Suppliers s full join Products p on s.SupplierID=p.SupplierID where p.ProductName LIKE 'C%'

--9. Get shipper’s Company Name for an order using inner join. (Display only orderID from orders and comapnayName from Customers table)

select o.OrderID, s.CompanyName from Orders o inner join Shippers s on o.ShipVia=s.ShipperID

--10.  Count no of Products’s against each suppliers name. list only those products whose count is greater than 3

select s.ContactName,Count(p.ProductID) AS ProductsSupplied from Products p inner join Suppliers s on p.SupplierID=s.SupplierID group by s.ContactName having Count(ProductID)>3

--11. Display Region ID, Region Description, Territories Description and (inner join with table Territories and Region)

select r.RegionID,r.RegionDescription,t.TerritoryDescription from Region r inner join Territories t on r.RegionID=t.RegionID

--12. Display Company Name and Total orders placed by the company (Table: orders, customer, use inner join, group by)

select c.CompanyName, Count(o.OrderID) AS TotalOrders from Orders o inner join Customers c on o.CustomerID=c.CustomerID
group by (c.CompanyName) 