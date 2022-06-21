Use Exam_shcema;
--1 запрос
go 
Create Procedure SearchhOffices @a date,@b date
as begin
BEGIN TRY
	if(@b < @a)
	THROW 51000, 'Неверно введена дата', 1;
	else
	SELECT ofs.OFFICE from OFFICES ofs
		inner join SALESREPS s on s.EMPL_NUM = ofs.MGR
		inner join ORDERS o on ofs.MGR = o.REP
		where o.ORDER_DATE between @a and @b group by ofs.OFFICE
END TRY
BEGIN CATCH
  SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
end;
Declare @gg int = 0;
EXEC @gg = SearchhOffices @a = '2009-01-01' ,@b = '2008-01-01';

Drop Procedure SearchhOffices;



--if(@b < @a)
--	print 'Неправильная дата!!!';
--	else if(@a < @b)
--	print 'Правильная дата ';
	 

	--2запрос
go 
Create Procedure FirstSel @kkk varchar(25)
as begin
		Select s.rep_office, count(*) as amount_of_goods from ORDERS o
				inner join salesreps s on s.empl_num = o.rep
				group by s.rep_office
				having s.REP_OFFICE = @kkk
				order by amount_of_goods desc
end;
Declare @k int = 0;
EXEC @k = FirstSel @kkk = 12;

Drop Procedure FirstSel;
