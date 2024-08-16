--Write a simple stored procedure name “CustomerRecord” that
-- returns the desired Customer record from the Northwind
-- database given a parameter of the CustomerID.

Use Northwind
GO
Create Procedure Cust_Record
@CustomerID nchar(5)
AS
BEGIN
select * from Customers where CustomerID= @CustomerID
END
GO

EXEC Cust_Record 'ALFKI'

--2. Write a stored procedure name “Territory” that accepts a
--Territory ID, Territory Description, and Region ID and inserts
-- them as new row in the Territories table in Northwind.

Use Northwind
GO
Create Procedure Territory
@TerritoryID nvarchar(20),
@Ter_Des nchar(50),
@R_ID int 
AS
BEGIN
Insert Into Territories values (@TerritoryID,@Ter_Des,@R_ID )
END
GO

EXEC Territory 'NewID','New Description',1

select * from Territories

--3. Write a stored procedure name “depts20” that accepts a
--Department no, Department name where department no is less than 20.

Use Authorize
GO
Create Procedure depts20
@dep_no int =1,
@dep_name varchar(255)='Medicines'
AS
BEGIN
	IF Not Exists (select * from Department)
		Insert into Department values (@dep_name);
	ELSE
		select dep_no,dep_name from Department
END
GO

EXEC depts20 1,'Fruits'

--ALter the above Procedure

Use Authorize
GO
Alter Procedure depts20
@dep_no int =1,
@dep_name varchar(255)='Medicines'
AS
BEGIN
	IF Not Exists (select * from Department)
	Begin
		Insert into Department values (@dep_name);
	END
	ELSE
	BEGIN
		select dep_no,dep_name from Department where dep_no<20;
	END
END
GO

--4. Write a stored procedure name “SelectAllCustomers” that accepts a
--City nvarchar(15), Region nvarchar(15) and returns records using any.

Use Northwind
Go
Create Procedure SelectAllCustomers
@City nvarchar(15), @Region nvarchar(15)
AS
BEGIN
	IF Not Exists (select * from Customers where City=@City or Region=@Region)
		BEGIN
			PRINT 'No Records Exist for given '+@City+' and '+@Region+' .'
		END
	Else
		BEGIN		
			select * from Customers where City=@City or Region=@Region
		END
END
GO

Exec SelectAllCustomers 'Karachi','Sindh'

--5. What will be the output of the stored procedure spcase when it is executed? Specifically,
--how will the Position column be determined for the top 10 records from the Orders table

Use Northwind
Go
Create Procedure spcase
AS
BEGIN
	select Top 10 OrderID,OrderDate, Position =
	CASE OrderID%10
	when 1 Then 'First'
	when 2 Then 'Second'
	when 3 Then 'Third'
	when 4 Then 'Four'
	else 'Something Else'
	END
	 from Orders 
END
GO

--6. What does the stored procedure spcase1 do when executed on the OrderDetails table,
--particularly in terms of the categorization of OrderID values relative to ProductID?
--Additionally, explain the significance of the "Last Digit" column in the query results.

Use Northwind
Go
Create Procedure spcase1 
AS
BEGIN
	select Top 10 OrderID, ProductID, Last_SignificantDigit=
	Case ProductID%10
	When ProductID Then 'Match'
	When ProductID+1 Then '1 Digit above'
	When ProductID-1 Then '1 Digit below'
	Else 'Far'
	END
	from [Order Details] where UnitPrice between 17 and 50
END
GO