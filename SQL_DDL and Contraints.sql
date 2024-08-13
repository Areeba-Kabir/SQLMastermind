--create database Authorization. 
--create table department where columns include dep_no,dep_name,location.
--create table employee where columns include empno,emp_name,job,mgr,hiredate.
--alter table employee and Add columns salary, commission, deptno.
--Drop Column location from Department table
--Delete all record from Employee table 
--Drop Department Table.
--CREATE TABLE StarsIn ( movieTitle char(30),   movieYear int,starName char(30) );
--Add a column ‘Address’ in Starsin table in database Authorization.

create Database Authorize;

use Authorize;

create table Department (
dep_no int identity(1,1) Primary key Not NULL,
dep_name varchar(255) Not Null,
loc varchar(255) Not Null
);

create table Employee (
emp_no int identity(1,1) Primary key Not NULL,
emp_name varchar(255) Not Null,
HireDate Date Not Null,
job varchar(20),
mgr decimal(4,0) Not NULL
);

alter Table Employee
Add salary money, commission money,
dep_no int ,
Foreign Key (dep_no) references Department(dep_no);

Alter table Department
Drop column loc

Truncate table Employee

create Table StarsIn(
movieTitle char(30) Not Null,
movieYear int,
starName char(30)
);

Alter table StarsIn
Add Address varchar(250);

create Table Customers(
Customer_id int Primary key,
FirstName varchar(255),
LastName varchar(255),
City varchar(255) default 'Karachi',
Address varchar(255),
Constraint check_City Check (City='Karachi' or City='Lahore')
);

create Table Orders(
Order_ID int Primary key,
Customer_ID int,
Order_Details varchar(255),
Order_Date date,
Required_Date date,
Foreign Key (Customer_ID) references Customers(Customer_ID)
);

Alter table Customers
Add CNIC char(15) unique NOT NULL

