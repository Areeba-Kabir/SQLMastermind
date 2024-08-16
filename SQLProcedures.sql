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

