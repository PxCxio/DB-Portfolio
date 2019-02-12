
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




