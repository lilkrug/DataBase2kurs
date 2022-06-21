Use Exam_shcema;
--1������
go 
Create procedure OneProcedure @p nvarchar(50)
as begin
begin try
	declare @k int = (select count(*) from SALESREPS);
	select * from SALESREPS where Name = @p;
return 1;
end try
begin catch
	print '����� ������: ' + cast(error_number() as varchar(6));
	print '���������: ' + error_message();
	print '�������: ' + cast(error_severity() as varchar(6));
	print '�����: ' + cast(error_state() as varchar(8));
	print '����� ������: ' + cast(error_line() as varchar(8));
	if error_procedure() is not null   
	print '��� ���������: ' + error_procedure();
return -1;
end catch;
end;

Create table #Zk(
 Empl_num int,
 Name nvarchar(50),
 Age int,
 Reo_office int,
 Title nvarchar(50),
 Hire_Date date,
 Manager int,
 quota int,
 Sales int
)

Select * from #Zk
Insert #Zk exec OneProcedure @p = 'Dan Roberts';
Drop procedure OneProcedure;
Drop table #Zk;

--2������
go
Create Function TwoFunction(@f nvarchar(50)) returns int
as begin 
declare @rc int = 0;
set @rc = (select avg(Amount) as Max_Amount From 
ORDERS ord inner join SALESREPS sal on ord.REP = sal.EMPL_NUM
Where sal.EMPL_NUM = @f);
return @rc;
end;

declare @f int = dbo.TwoFunction(102);
print '������� ���� ������ = ' + cast(@f as nvarchar(10));
Drop Function dbo.TwoFunction

--3������
go
Create procedure ThreeProcedure @N int
as begin
begin try
  SELECT top(@N)[Name] from SALESREPS Order By Age;
return 1;
end try
begin catch
  print '����� ������: ' + cast(error_number() as varchar(6));
  print '���������: ' + error_message();
  print '�������: ' + cast(error_severity() as varchar(6));
  print '�����: ' + cast(error_state() as varchar(8));
  print '����� ������: ' + cast(error_line() as varchar(8));
  if error_procedure() is not null   
  print '��� ���������: ' + error_procedure();
return -1;
end catch;
end;

Exec ThreeProcedure  5;
Drop procedure ThreeProcedure;

--4������
go
Create Function FourFunction(@region nvarchar(50)) returns int
as begin
declare @rc int = 0
set @rc = (SELECT count(*)[���-�� �������] FROM ORDERS o 
INNER JOIN CUSTOMERS c ON o.CUST = c.CUST_NUM
INNER JOIN SALESREPS s on o.REP = s.EMPL_NUM AND c.CUST_REP = s.EMPL_NUM
INNER JOIN OFFICES ofi ON s.EMPL_NUM = ofi.MGR Where ofi.REGION = @region);
return @rc
end

Declare @orderss int = dbo.FourFunction('Western');
print '���-�� ������� = '+ cast(@orderss as varchar(5))
Drop FUNCTION dbo.FourFunction

Select distinct Offices.Region, dbo.FourFunction(Offices.Region) as Amount_Order from OFFICES 