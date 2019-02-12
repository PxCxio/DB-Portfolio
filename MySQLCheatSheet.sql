
-- Using the design wizard
--- Criteria or filtering with  the comparison operators
--- Computed Fields
--- Functions
--- Grouping
--- Sorting
--- Joining Tables
--- Updating data
--- Deleting Data
--- Make a Table
--- union
--- difference

--basic select
select * from customer

--computing a field
select customername,creditlimit, balance, creditlimit-balance as creditminusbalance from customer

--Sample query for count
select count(*) 
from customer
where city = 'Grove'

--Using a simple criteria
select * from customer 
where city = 'Grove'

--Get the balance of all customers into a total summarized value using the sum function
select sum(balance) as allBalance from customer

--Lets get the average creditlimit using the avg function
select AVG(creditlimit) as avglimit from customer

select * from customer

--using TOP gives the top N records
-- you still need to specify the columns
select top 5 * from customer 

--using top with a sort allows you to get the TOP N records
-- or the bottom N records
select top 5 * from customer 
order by customername asc


-- Grouping , first let's review the data
select * from customer

--Grouping statement. Lets get the average balancer per city for our customers
select city, avg(balance) from customer
group by city 

--Add Customer name to grouping. Changes the result
select city,customername,avg(balance) from customer
group by city,customername

-- Find the max balance per City .
select city, max(balance) 
 as maximumBalance  from customer
group by city 

--sorting
select * from customer
order by city asc ,customername desc

--joins

--inner join
select customername, firstname, lastname ,customer.repnum, rep.repnum
from customer inner join rep
on customer.repnum = rep.repnum

-- left outer join
select customername, firstname, lastname ,customer.repnum, rep.repnum
from customer left outer join rep
on customer.repnum = rep.repnum

-- right outer joiner
select customername, firstname, lastname ,customer.repnum, rep.repnum
from customer right outer join rep
on customer.repnum = rep.repnum

--full outer join
select customername, firstname, lastname ,customer.repnum, rep.repnum
from customer full outer join rep
on customer.repnum = rep.repnum

--inner join using a where clause
select customername, firstname, lastname from customer, rep
where customer.repnum = rep.repnum

--joining 3 tables
select customername, firstname,lastname , ordernum, orderdate
from 
rep inner join customer 
on rep.repnum = customer.repnum
		inner join orders
		on customer.CustomerNum = orders.CustomerNum

--Insert statement
insert into customer
(customernum, customername)
values
(99, 'Home Depot')

--More join examples

--multiple table join
select customer.customernum, customername, customer.city, 
firstname as repFirst, lastname as repLast, OrderDate
from (customer inner join rep
on customer.repnum = rep.RepNum) inner join orders
	on customer.customernum = orders.customernum

--left
select customer.customernum, customer.repnum,customername, customer.city, 
firstname as repFirst, lastname as repLast
from (customer left join rep
on customer.repnum = rep.RepNum)

--inner
select customer.customernum, customer.repnum,customername, customer.city, 
firstname as repFirst, lastname as repLast
from (customer inner join rep
on customer.repnum = rep.RepNum)

--delete
insert into rep
(repnum, lastname,firstname)
values
(20,'testlast','testfirst')

delete from rep
where repnum = '20'


-- insert
insert into rep
values
('20','Smith','John','123 Street','Miami','FL','33012',5.5, 4.2)

insert into rep
(repnum,lastname,firstname)
values
('99','Smith','John')


--update
--record 99 must exist, add your own record
update rep
set City = 'newcity',
state = 'FL'
where repnum = '99'


--make-a-table query
select * into AnalystOrderline
from orderline
where QuotedPrice > 100

select * from AnalystOrderline

--if you need to delete the table AND its data, use DROP
drop table AnalystOrderline

--union
select OrderNum, QuotedPrice from AnalystOrderline
union
select OrderNum, QuotedPrice from orderline

--unione all
select OrderNum, QuotedPrice from AnalystOrderline
union all
select OrderNum, QuotedPrice from orderline

--difference
select * from orderline o
where  not exists (select ordernum from AnalystOrderline p where o.ordernum = p.ordernum)


--records in common
select * from orderline o
where  exists (select ordernum from AnalystOrderline p where o.ordernum = p.ordernum)--Changing fonts and colors for SQL Server Management studio
https://msdn.microsoft.com/en-us/ms173754.aspx

--removes table and data
drop table student
--Creating a table

create table Student
(
	id int identity(1,1),
	studentNum char(9) not null primary key,
	FirstName varchar(50) not null,
	LastName varchar(50) not null,
	AddressLine1 varchar(250) not null,
	AddressLine2 varchar(250) null,
	birthdate date null,
	gpa decimal(8,2) null,
	createdOn datetime default(getdate())
)

insert into Student
(studentNum, FirstName, LastName,AddressLine1,birthdate,gpa)
values
('000000001', 'Steve','Masters', '1234 West Drive','01/30/83',4.0)

insert into Student
(studentNum, FirstName, LastName,AddressLine1,birthdate,gpa)
values
('000000002', 'Jennifer','Masters', '1234 West Drive','04/30/83',4.0)

select * from student


--Example of using a computation operation with numbers
select CreditLimit - balance 
as availablecredit 
from customer

--Example of using computation to concatenate a literal and a varchar data column
select 'Awesome ' + customername from customer

--Example of using an alias to rename a column and
--a condition with the WHERE clause
select customername as VIPName, Street as VIPStreet,*
 from customer
where Creditlimit > 7000

--Using an aggregate function AVG to calculate the average for the all the values in the query
select avg(balance) as avgbalance
 from customer
where Creditlimit > 7000

select * from student where AddressLine2 is null

select * from Student where birthdate between '01/28/1983' and '02/28/1983'

select * from student where birthdate > '01/28/1983' and birthdate < '02/28/1983'



--Example of an inner query in combination with the IN statement. 
--The inner query is execuated first.
select * from customer
where balance in
(select balance from customer
where balance > 1000)

--Example of  IN operator with a list of numbers
select customername,creditlimit,* from
customer where CreditLimit in (2000,7500,5001)

select repnum,* from 
customer where customername in ('Toys Galore','The Everything Shop')

select * from customer
where repnum in (select  repnum from rep where Commission >25000 )

---% in SQl Server is the wildcard for any characters, for any length
select * from customer
where customerName like '%Store%'

select * from customer
where city like 'F%_l%'

select * from customer
where city ='F%_l%'

--_ in SQL Server is the wildcard for any character, for a length of 1
select * from customer
where customerName like '_line''s'

-- RTRIM trims any spaces from the right side of a value, LTRIM trims any from the left side
select city, customername,
ltrim(rtrim(street))  as street
from customer
order by city asc,customername asc

--UPDATE statement used to update a field based on a condition
update customer
set customername = 'Johnson''s Department Store2'         
where customerNum = 608

--Aggregate function COUNT gives the count of the records in the query
select count(*) from customer
where City = 'grove'

--Aggregate function AVG gives the average of the records in the query
select avg(balance) from customer
where City = 'grove'


--Group By

--The GROUP BY clause is used to group records by similar values, which in this case is grouping
--the customer records by the similar repnum. In addition, we are using
--the aggregate functions on the group for COUNT and SUM.
--Out of this record set, we use the HAVING clause to filter those records out whose count
--is greater or equal to 3
select count(*) as NumberOfCustomers,sum(balance) as TotalBalancePerRepCity, 
repnum from customer
group by repnum
having count(*) >= 3

select count(*) as NumberOfCustomers,sum(balance) as TotalBalancePerRepCity, 
repnum from customer
group by repnum
having sum(balance) > 7000

--Using the make a table functionality. This creates a new table named ValerieCustomer
--when the INTO clause is used. Table must not exists.
select * into REP30Table
from customer
where repnum = 30  

select * from rep30table


--The DROP statement will remove an entire object from the database (with all its data)
--BE CAREFUL! It is commented for safety, uncomment to use.
DROP table rep30table


--Here we are creating a view named vw_MeganCustomer to show
--only representative Megan's custoemrs.
Create view vw_MeganCustomer  as 
(
select CustomerName,street,city 
from customer where repnum = 30
)

select * from vw_MeganCustomer

--Common join using INNER JOIN
select customername, rtrim(rep.LastName) + ',' 
+ rep.FirstName as RepName
from customer inner join rep
on customer.repnum = rep.repnum


--Another Way to do a join, using a WHERE clause
select customername, rep.FirstName,Rep.lastName from customer, rep
where customer.repnum = rep.repnum

--Performing a UNION or UNION ALL with 2 result sets
select customername, rep.FirstName,Rep.lastName from customer, rep
where customer.repnum = rep.repnum
union all
select customername, rep.FirstName,Rep.lastName from customer, rep
where customer.repnum = rep.repnum and rep.repnum = 35


--Putting different commands together in one query
select 
repnum,
count(*)as numberrecords,
avg(balance) as Balance,
sum(creditlimit) as CredSum
from customer
where CreditLimit > 7000
group by repnum
having count(*) > 3
order by balance



--GO is a keyword used by many SQL Editors and Parsers to separate batches. Can be used for scoping SQL statements together
https://msdn.microsoft.com/en-us/library/ms188037.aspx

--Example for MSDN
DECLARE @MyMsg VARCHAR(50)
SELECT @MyMsg = 'Hello, World.'
GO -- @MyMsg is not valid after this GO ends the batch.
-- Yields an error because @MyMsg not declared in this batch.
PRINT @MyMsg
GO


SELECT @@VERSION;
-- Yields an error: Must be EXEC sp_who if not first statement in 
-- batch.
sp_who
GO









--Create the celebrities table with a primary key amd itentity column
create table Celebrities 
(
    id int primary key identity(1,1),
	firstName varchar(250) not null,
	lastName varchar(250) not null,
	Address varchar(500) null,
	Income money null,
	MarriedToAKardasian bit null
)

--Drop the table
drop table Celebrities

--Create the table Celebrities again without a PK
create table Celebrities 
(
    id int not null,
	firstName varchar(250) not null,
	lastName varchar(250) not null,
	Address varchar(500) null,
	Income money null,
	MarriedToAKardasian bit null
)

--Alter the table to add a primary after the table has already been created
alter table Celebrities 
add constraint pk_ID primary key (id) 

--This statement will delete all records from the Celebrities table
delete from Celebrities


--Modify a column with a constraint for legal values
alter table Celebrities 
add constraint chk3_Income check (income between 1 and 99999  )

alter table Celebrities 
add constraint chk2_Income check (income > 0)

alter table Celebrities 
add constraint chk4_Income check (income > 0 and income < 500000  )

alter table Celebrities 
add constraint chk4_Income check (income between 1 and 500000  )

--Example of a table creation with a legal value constraint
CREATE TABLE Products_2
(
    ProductID int PRIMARY KEY,
    UnitPrice money,
    CONSTRAINT CK_UnitPrice2 CHECK(UnitPrice > 0 AND UnitPrice < 100)
)


--Creating indexes
--Single Column
create index idx_lastName
on celebrities (lastname)

--Multiple Column index
create index idx_lastName2
on celebrities (firstname,lastname)

--Modifying a column in the celebrities table to another data type
alter table celebrities
alter column firstname int

--Drop the Primary Key from a table
alter table Celebrities
drop pk_INT

--Add a column to a talbe 
alter table celebrities
add IsBabyDaddyMommy bit

--Insert some sample values into celebrities
insert into celebrities
(firstname,lastName,Address,Income,MarriedToAKardasian,IsBabyDaddyMommy)
values
('John','Smith','123 Star Island',50000,0,1)


--Drop a column from a table
alter table celebrities
drop column lastName

--Alter the data type
alter table celebrities
add lastName varchar(250) null 






--Adding a Legal Value Constraints
alter table Celebrities 
 add constraint chk_Tst check (id between 1 and 99999) 

-- FOREIGN KEY CONSTRAINT

--Creating foreign key constraints
--Given that we have the customers table


drop table customerprofiles

CREATE TABLE dbo.CustomerProfiles
(
	ProfileId int NOT NULL PRIMARY KEY,
	UserName varchar(50) NOT NULL,
	ProfileCustomerNum char(3)
	constraint fk_customerNumber FOREIGN KEY (ProfileCustomerNum)
	REFERENCES Customer(CustomerNum)
)

--or through an alter
ALTER TABLE CustomerProfiles
ADD CONSTRAINT fk_profilecustomerNum
FOREIGN KEY (ProfileCustomerNum)
REFERENCES Customer(CustomerNum)


--SCHEMAS

--NOTE: Schemas are container for which objects belong to
-- For example, in the statement 
select * from dbo.rep
--dbo is a schema (the default database owner schema)

--Schemas are useful to group objects together for administrative and management services
-- For example

GRANT SELECT ON SCHEMA :: dbo TO sqluser WITH GRANT OPTION

--Creating Schemas, further reading
http://technet.microsoft.com/en-us/library/dd207005.aspx


/*
Documentation for object catalog views can be found in MSDN
http://technet.microsoft.com/en-us/library/ms189783.aspx

The system catalog cotains information about the database. What
tables are in the database? What views have been defined?

*/

--System Catalog sample Queries
--sysobjects
--syscolumns
--sysconstraints
--sysforeignkeys

--Retrieve all the tables in the database
select * from sys.tables


--Objects that belong to schemas
select * from sys.objects

--Xtype U - User tables
select xtype,name,* from sysobjects
where xtype = 'U'

--Xtype V - Views
select xtype,name,* from sysobjects
where xtype = 'V'

--Select all the columns that are in the Customer table
select * from sys.columns
where object_id in (select id from sysobjects
where name = 'Customer')

--select information on the views
SELECT name AS view_name,
   schema_id
  ,SCHEMA_NAME(schema_id) AS schema_name
  ,create_date
  ,modify_date
FROM sys.views;

--Select all the tables that dont have a primary key
SELECT SCHEMA_NAME(t.schema_id) AS schema_name
    ,t.name AS table_name
FROM sys.tables t 
WHERE object_id NOT IN 
   (
    SELECT parent_object_id 
    FROM sys.key_constraints 
    WHERE type_desc = 'PRIMARY_KEY_CONSTRAINT' -- or type = 'PK'
    );

--Select all the Primary keys in the DB
 SELECT parent_object_id,* 
    FROM sys.key_constraints 
    WHERE type_desc = 'PRIMARY_KEY_CONSTRAINT'


--Find the  SP in the database
SELECT name AS procedure_name 
    ,SCHEMA_NAME(schema_id) AS schema_name
    ,type_desc
    ,create_date
    ,modify_date
FROM sys.procedures;

--STORED PROCEDURES
-- A stored procedure is an independt boody of logic that can be executed in the database
-- which can modify objects in the SQL database

--Add an additional column to the Celebrities table
alter table celebrities
add typeOfCar varchar(50)

alter table celebrities
drop column typeOfChar


drop procedure UpdateCelebrities
go
--why must we use GO?

--Creating a stored procedure to update our celebrities table
Create procedure UpdateCelebrities
(
   @FirstName varchar(500) = null,
   @Address varchar(500) ,
   @Income money,
   @MarriedToAKardasian bit,
   @IsBabyDaddyMommy bit,
   @lastName varchar(250),
   @TypeOfCar varchar(50)
)
As
Begin
	Print 'Entering our Update Procedure'

	if exists(select * from Celebrities where lastName = @lastName)
	Begin

		print 'Doing an update'

		--Update the fields
		update Celebrities
		set firstName = isnull(@FirstName,firstname),
		Address = @Address,
		Income =  @Income,
		MarriedToAKardasian = @MarriedToAKardasian,
		IsBabyDaddyMommy = @IsBabyDaddyMommy,
		TypeOfCar = @TypeOfCar
		
		where lastName = @lastName

	End
	else
	Begin

		print 'Doing an insert'

		--Insert a new record
		--Insert the values into the Celebrities table
		insert into Celebrities
		(firstName,Address,Income,MarriedToAKardasian,
		IsBabyDaddyMommy,lastName,TypeOfCar)
		values
		(@FirstName,@Address,@Income,@MarriedToAKardasian,
		@IsBabyDaddyMommy,@lastName,@TypeOfCar)
	end
End
--End of UpdateCelebrities
GO


--Execute our UpdateCelebrities Stored Procedure
exec UpdateCelebrities
@Address = '9232 Star Island',
@Income = 500000,
@MarriedToAKardasian = 1,
@IsBabyDaddyMommy = 0 ,
@lastName = 'FilthyRich'
@TypeOfCar = 'Porsche'



select * from Celebrities




--Create an SP to Delete a record on a particular field
Create procedure DeleteCelebrities
(
	@LastName varchar(250)
)
As 
Begin
	delete from Celebrities
	where lastName = @LastName

End
GO


exec dbo.DeleteCelebrities @lastName = 'FilthyRich'
--Example to create a table

-- Lets create a table to hold customer login accounts. It should have a customer's customer number, username, password, 
-- customer type (small market, enterprise market), date account was created, date last customer logged in

drop table customerLogin


create table CustomerLogin
(
	id int not null identity(1,1) primary key,
	customernum char(3) not  null,
	username varchar(25) not null,
	[password] varbinary(20) not null,
	customerType varchar(100) null,
	datecreated datetime not null default(getdate()),
	lastloggedin datetime not null 
)




insert into CustomerLogin
(customernum,username,password,lastloggedin)
values
('081', 'arogers01',HASHBYTES('MD2', 'sUp3rS3cr3t1'), getdate())


select * from CustomerLogin

--http://msdn.microsoft.com/en-us/library/ms174415.aspx

-- use varbinary to store this value
SELECT HASHBYTES('MD2', 'sUp3rS3cr3t1')

update CustomerLogin
set lastloggedin = getdate()
where username = 'arogers01'











--Grouping example with GROUP BY
select * from customer 

--Let Get the total balance fir a city
select sum(balance) as TotalBalance from customer
group by city

--But we need to include the cities wich totaled, so we'll include the city column
select sum(balance) as TotalBalance, City from customer
group by city

--Lets try to show the street also
select sum(balance) as TotalBalance, City,street  from customer
group by city
--ERROR: The above statement will give you an error. Why?
-- The street column  is not included in the grouping.
--So when doing a grouping, the columns displayed need to either:
	-- 1) Be part of the group by statement OR
	-- 2) Be the argument of an aggregate function (SUM,AVG,COUNT...etc)

select count(*) from customer

select count(customernum) from customer


--Lets get the total number of records per city
select count(*) as NumberofRecords,city from customer
group by city

--Since the COUNT function is working on counting the entire record, 
--the column which we use as an argument in count is irrelevant

--This statement
select count(customernum) as NumberofRecords,city from customer
group by city

-- yields the same result as

select count(customerName) as NumberofRecords,city from customer
group by city

--Filter your grouping with HAVING

--Using the HAVING statements, performs your grouping first, then filters the records from the grouped set
select sum(balance) as TotalBalance, City from customer
group by city
having sum(balance)  > 10000

select * from customer

--Can I add a WHERE filter? Yes, but that is different than HAVING. See the following statement
select sum(balance) as TotalBalance, City 
from customer 
where customername = 'Kline''s'  
group by city 
having sum(balance)  > 10000 
--The previous statement, first filtered the records by customer name, 
--then grouped those records, then filtered the grouped set by the city of fillmore

--In the Henry Books tables, do the following: 
--Find the average price of books, grouped by book code in branch number 1, 
--whose average price is less than $10
select * from copy

select avg(price) as AvgPrice , bookcode
from copy
where Branchnum = 1
group by bookcode
having avg(price) < 10




-- This example will help us visualized the differences between the joins on tables


--The command sp_help gives me information on an object
--sp_help 'Rep'


insert into rep
(repnum,FirstName,LastName)
values
(28, 'Knowshon' ,'Moreno')

select * from rep

--sp_help 'Customer'


insert into customer
(customernum,customername)
values
(99,'Ha Ha Industries')

select * from customer

--Left Join
select * from rep left join customer on rep.repnum = customer.RepNum


--Inner Join
select * from rep inner join customer on rep.repnum = customer.RepNum

--Right Join
select * from rep right join customer on rep.repnum = customer.RepNum

--Full Outer Join
select * from rep full outer join customer 
on rep.repnum = customer.RepNum

--delete
delete from rep where repnum = 28
delete from customer where CustomerNum = 99






drop table Employee
drop table Employee2

create table Employee
( 
	pkId int primary key identity(1,1) ,
	empName varchar(50)
)


create table Employee2
( 
	pkId int primary key identity(1,1) ,
	empName varchar(50)
)

insert into Employee
select 'John'
union
select 'Steve'

select * from Employee

insert into Employee2
select 'Mary'




select * from Employee
select * from Employee2


--Incomplete Transaction
--Run a transaction and update the table without committing the transaction, which will
--cause this process maintain a lock on Employee
Begin tran
update Employee set empName = 'John Smith'
where pkId = 1


Begin tran
update Employee2 set empName = 'Geno Smith'
--where pkId = 1


--Wrap a statement in a transction an use logic to determine wether to commit or not

Begin tran
update Employee set empName = 'John Smith2'
where pkId = 1



IF @@ROWCOUNT = '1'
Begin
	print 'Committed transaction'
	Commit tran
End
ELSE
Begin
	rollback tran
	print 'RolledBack transaction'
End

--Query the table that is being locked by our update
--without (nolock) hint. It is waiting for another process to release the lock

select * from Employee 


--Query the table that is being locked by our update
--with  a (nolock) hint, which can give back uncommited data (Dirty Read)

select * from Employee (nolock)- Whats the whole point about the relational model? Why was it created?

_ Understand relationships between tables and how are they enforced.
   One to one, One to Many, Many to Many

- Create tables
	- Primary Key
	- Foreign Key
	- Create a constraint for one of the columns

- What are alternate keys? Candidate Keys?

- Whats a legal value constraint? 

alter table table
add constraint myconstraint check (column in ('value1','value2'))
add constraint myconstraint2 check (column < 100)


- Queries
	- Select
	- Agregate functions (sum, avg, max, top, count)
	- grouping
	- sort columns
	- Alias
	- Sorting
	- Joining between multiple tables
	- Select Into
	- Between 
	- using wildcards to search a partial string

- Subqueries

   select * from mytable where column in (select column from table2)
					  ('a','b','c')

- Update Queries
	- Conditional, subqueries

    Update table
    set column = value
     where condition	

- Delete from a table

 Deletes an entire row(s) of data.
   delete from mytable [condition]	
	

- What are indexes, write a script to create one. 
  Create index idx_MyIndex
  on Table (column)

- Unions
	- What are the requirements for 2 tables to be union compatible

- Views: What's the purpose and how do you create one?

- Integrity Rules, what are they?

 Entity integrity, referential integrity.

- System Catalog, whats the purpose and how do you use it?

Contains information about the objects in a database. sys.tables, sys.views,etc

Create a Stored Procedure/Trigger:

Create a stored procedure or atrigger to achieve a function.

Create Procedure MyProcedure
as
BEGIN
	[Logic]
END

Create TRigger MyTrigger
ON [Table]
[AFTER|INSTEAD] Insert, Update, Delete
begin
	[Logic]
end
- Normalization: What's the purpose, and how do you convert a table design to 3NF.

1NF: Remove repeating groups
2NF: Focus on the primary key. Remove any partial dependencies.
3NF: Focus on determinants. Remove any dependencies.



select customername,creditlimit-balance as available_balance from customer

--Sample query for count
select count(customernum) as numberAlton from customer
where city = 'AltonVille'

--Get the balance of all customers into a total summarized value
select sum(balance) as allBalance from customer

/* Lets get the average creditlimit
*/
select AVG(creditlimit) as avglimit from customer

select top 1 * from customer
where Zip = '33336'
order by CustomerName desc

select customername,city,balance from customer
group by city,customername,balance

select sum(balance),city from customer
group by city

select * from customer
order by city asc, customername desc


select customer.customernum, customername, customer.city, 
firstname as repFirst, lastname as repLast, OrderDate
from (customer inner join rep
on customer.repnum = rep.RepNum) inner join orders
	on customer.customernum = orders.customernum

--left
select customer.customernum, customer.repnum,customername, customer.city, 
firstname as repFirst, lastname as repLast
from (customer left join rep
on customer.repnum = rep.RepNum)

--inner
select customer.customernum, customer.repnum,customername, customer.city, 
firstname as repFirst, lastname as repLast
from (customer inner join rep
on customer.repnum = rep.RepNum)

delete from rep
where repnum = '20'

select * from rep where repnum = '35'

update rep
set City = 'Sheldonville',
[state] = 'NY'
where repnum = '35'



insert into rep
values
('20','Smith','John','123 Street','Miami','FL','33012',5.5, 4.2)

insert into rep
(repnum,lastname,firstname)
values
('99','Smith','John')

select *
from orderline


select * into orderline21617
from orderline
where ordernum = '21617'


select *, '' as column1 from orderline21617
union 
select *, '' as column1
from orderline


--Example of Create Table
create table Students_02
(
	Id int  identity(1,1) primary key  not null,
	FirstName varchar(50) not null,
	LastName varchar(50) not null,
	ssn char(9) not null,
	address varchar(250) null,
	state char(2) null,
	dateofBirth datetime null		
)


--Example of Drop Table - This will remove the table structure and all its data
--drop table Students_02

select * from Students_02

--Inserts of Data
insert into Students_02
(FirstName,LastName,ssn,[address],[state],dateofbirth)
values
('ohn','Smith','555443344','1234 Ste','FL','01/30/1978')

insert into Students_02
(FirstName,LastName,ssn,[address],[state],dateofbirth)
values
('John','Smith','555443344','1234 Ste','FL','01/30/1978')

insert into Students_02
(FirstName,LastName,ssn,[address],[state],dateofbirth)
values
('Randal','Smith','555443344','1234 Ste','FL','01/30/1978')

--OR example for a compound criteria
select firstname as [EmployeeFName], lastname 
,* 
from Students_02
where id = 1 or id =2

--Three different ways of doing NOT EQUAL TO
select * from
Students_02
where not id = 1

select * from
Students_02
where id != 1

select * from
Students_02
where id <> 1

--Between Example
select * from
Students_02
where dateofBirth between '01/01/1970' and '01/01/1980'

--Underscore Wildcard
select * from Students_02
where FirstName like '_ohn'

select * from Students_02
where FirstName like '%anda%'

select * from Students_02
where FirstName like 'R_nda%'


--IN Example
select * from Students_02
where FirstName in ('John','Steve','Santa')
and ssn like '55%'

--Aggregate function example
select sum(quotedprice) as totalvalue from orderline
where PartNum = 'DR93'







--Stored Procedure
select * from customer
select * from rep

--Lets comapare a view versus a stored procedure

--- Begin- Create view -------------------
--High_Commission_Repswith_1kBalanceorHigher
-- This is a view
create view High_Commission_Repswith_1kBalanceorHigher
as 
--next line is a query
select customernum, customername, balance, rep.repnum,
lastname,firstname, commission
from customer inner join rep
on customer.repnum = rep.repnum
where commission > 25000 and  balance>1000
--- End - End of View -----------------

--We can only select from the view, but we cant pass parameters or do deletes, inserts for example
--Lets do an SP
--pass the repnum
select customernum, customername, balance, rep.repnum,
lastname,firstname, commission
from customer inner join rep
on customer.repnum = rep.repnum

--Lets create an SP to retrieve the data
create procedure GetCustomerRep
(
	--my parameters (if any)
	@myRep char(2)
) as
begin
	print @myRep

	-- my logic
	select customernum, customername, balance, rep.repnum,
	lastname,firstname, commission
	from customer inner join rep
	on customer.repnum = rep.repnum
	where rep.repnum = @myRep	

	select getdate()
end

--executes the SP
execute GetCustomerRep @myRep = '45'
execute GetCustomerRep '45'

--Lets take the same SP but add an auditing table to it, so that
--everytime it runs it tracks the SP execution in our audit table
create table ProcAudit
(
	procname varchar(500),
	procExecuteDate datetime,
	numberOfTimes int
)
go

--more complex SP
create procedure getAllCustomersWithRepInfo
as
begin

	declare @procname varchar(500)
	set @procname = 'getAllCustomersWithRepInfo'

	declare @dateexecuted datetime
	set @dateexecuted = getdate()

	select @dateexecuted as DateExecuted,customernum, 
	customername, balance, rep.repnum,
	lastname,firstname, commission
	from customer inner join rep
	on customer.repnum = rep.repnum

	if exists(select * from procaudit where procname = @procname)
	begin
		update ProcAudit
		set numberofTimes = numberOfTimes + 1,
		procExecuteDate = @dateexecuted
		where procname = @procname
	end
	else
	begin
		insert into ProcAudit
		select @procname,@dateexecuted,1
	end
end


execute getAllCustomersWithRepInfo

select * from procAudit
delete  from procAudit



/*

Using the Colonial database, create the following Stored Procedure. 

CreateDynamicTripAd

This procedure will take in a Trip Id as a parameter and perform the following:

It will return a resultset with the following info

Trip Id
Trip Name 
Season
Average Reservation Price
Number of Reservations
Most positive review note


Reviews are stored in a table called Trip reviews. The table contains  the columns
Trip Id, rating from 1 to 5 , date of review and  a review Note. 
Assuming all columns are filled with data. 


The procedure will also update a new table named TripAds which keeps track of 
the ad count generate for this trip, the trip Id and last time it was updated. 

- Note: For this exercise, create the following tables:

TripReviews
	- TripId
	- rating
	- reviewNote
	- dateofreview

TripAds
	-TripID
	-ad count
	-dateof generation


*/
--Look at our part table
select * from item

--Create a Table to hold the item audit
CREATE TABLE [dbo].[ItemAudit](
	[ItemNum] [char](4) NOT NULL,
	[Description] [char](30) NULL,
	[onhand] [decimal](4, 0) NULL,
	[category] [char](3) NULL,
	[storehouse] [char](1) NULL,
	[Price] [decimal](6, 2) NULL,
	[dateTimeCreated] smalldatetime NULL,
	[Operation] varchar(50)
)
--Add the username column to the table
alter table itemAudit
add UserName varchar(50)
GO

select * from itemaudit

select 1 from itemaudit

--If the trigger exists, drop it first
drop trigger trg_InsertPartAudit
GO

--Here is the SQL code to create the trigger
--which will insert a record into our audit table
--if either the operation is an insert or a delete
create TRIGGER trg_InsertPartAudit
ON item
After Insert,Delete,Update
AS
Begin

	 if exists(select itemnum from deleted)
	 begin
		INSERT INTO itemAudit 
		 (itemnum, description,onhand,category,storehouse,
		 price,datetimecreated,Operation,username )
		 SELECT itemnum, description, onhand, category, 
		 storehouse, price, getdate(), 'DELETE',System_user
		 FROM deleted	
	 end

	 if exists(select itemnum from inserted)
	 BEGIN 
		 INSERT INTO itemAudit 
		 (itemnum, description,onhand,category,storehouse,
		 price,datetimecreated,Operation,username )
		 SELECT itemnum, description, onhand, category, 
		 storehouse, price, getdate(), 'INSERT',System_user
		 FROM Inserted
	 END

	

	 --check if a column update
	 if (update(description) or update(category))
	 begin
		print 'Description or category column was updated '
	 end
End
GO


--This will insert a record into pur part table, which will
--cause the trigger to be executed
insert into item
values
('SM02','Electric Stove3',49,'AP',3,300.00)

select * from item

select * from itemAudit order by DATEtimecreated asc

--An update will also trigger the logic
update item
set description = 'Electric'
where itemNum = 'SM02'


update item
set onhand = 77
where itemNum = 'SM02'

-- Test the delete
delete from item where  itemnum = 'SM02'






