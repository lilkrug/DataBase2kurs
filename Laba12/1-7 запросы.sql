Use Univer;
--1запрос
go 
Create Procedure PSubject
as 
 begin
	declare @k int = (select count(*) From SUBJECT)
	select * From SUBJECT;
	return @k;
end;
	Declare @k int = 0;
	EXEC @k = PSubject;
	print 'кол-во предметов = ' + cast(@k as varchar(3));
drop Proc PSubject;
--3запрос
go 
Create Procedure PSubject_3 @find varchar(20)
as 
	begin
	select [SUBJECT] 'Код',SUBJECT_NAME 'Дисциплина', PULPIT 'Кафедра' from [SUBJECT] where PULPIT= @find;
	print 'параметры : p= ' + @find;
	declare @k int = (select count(*) from SUBJECT);
	return @k ;
end;

Create table #SUBJECT(
	Код char(20) not null,
	Дисциплина	varchar(100)			,
	Кафедра	char(20) not null
);

Insert #SUBJECT exec PSubject_3 @find = 'ИСИТ';
SELECT * FROM #SUBJECT;

DROP PROCEDURE PSUBJECT_3;
DROP TABLE #SUBJECT;
--4запрос
go
Create Procedure PAuditorium_Insert @a char(20),@n varchar(50),@c int = 0,@t char(10) 
as declare @ret int = 1;
begin try 
	insert into AUDITORIUM(AUDITORIUM,AUDITORIUM_NAME,AUDITORIUM_CAPACITY,AUDITORIUM_TYPE) values (@a,@n,@c,@t);
	return @ret;
end try
	begin catch 
	print 'Код ошибки: ' + cast(ERROR_NUMBER() as varchar(6));
		print 'Сообщение об ошибке: ' + ERROR_MESSAGE();
		print 'Строка ошибки: ' + cast(ERROR_LINE()as varchar(8));
		if ERROR_PROCEDURE() is not null
			print 'Имя процедуры ошибки: ' + ERROR_PROCEDURE();
		print 'Уровень серьёзности ошибки: ' + cast(ERROR_SEVERITY()as varchar(6));
		print 'Метка ошибки: ' + cast(ERROR_STATE()as varchar(8));
		return -1;
	end catch;
Declare @pand int;
EXEC @pand = PAuditorium_Insert @a='423-1',@n='423-1',@c='90',@t='ЛБ-К';

DELETE AUDITORIUM where AUDITORIUM_NAME='423-1';

DROP PROCEDURE PAUDITORIUM_INSERT;

--5запрос
use Univer;
go
Create Procedure SUBJECT_REPORT @p Char(10)
as 
  declare @rc int = 0;
  begin try
	declare @tv char(20),@t char(300) = '';
	declare  Sub_report cursor Local for
	 select s.[SUBJECT] From SUBJECT s Where s.PULPIT = @p;
	 if  not exists (select [SUBJECT] from [SUBJECT] where PULPIT = @p)
			raiserror('Ошибка',11,1);
	 else 
			open Sub_report;
			fetch Sub_report into @tv;
			set @t += RTRIM(@tv);
			while @@FETCH_STATUS = 0
				begin	
					fetch Sub_Report into @tv;
					set @t = RTRIM(@tv) + ',' +@t;
					set @rc = @rc + 1;
				end;
			print 'Дисциплины кафедры ' + @p;
			print @t;
			close Sub_report;
			return @rc;
	end try
	begin catch
		print 'Ошибка в параметрах.'
		if ERROR_PROCEDURE() is not null
			print 'Имя процедуры:' + error_procedure();
		return @rc;
	end catch;

DECLARE @res_rep int;
exec @res_rep = SUBJECT_REPORT @p = 'ИСиТ';
print 'Количество дисциплин: ' + cast(@res_rep as varchar(3));

DROP PROCEDURE SUBJECT_REPORT;
--6запрос
go
Create Procedure PAUDITORIUM_INSERTX @a char(20),@n varchar(50),@c int = 0,@t char(10),@tn varchar(50)
as 
	declare @rnm int = 1;
	begin try
		 set transaction isolation level SERIALIZABLE;
			begin tran
				INSERT into AUDITORIUM_TYPE(AUDITORIUM_TYPE,AUDITORIUM_TYPENAME)
					values(@t,@tn);
				EXEC PAUDITORIUM_INSERT @a='423-1',@n='423-1',@c='90',@t='ЛБ-К';
			commit tran;
			return  @rnm;
	end try

	begin catch
		print 'Код ошибки: ' + cast(ERROR_NUMBER() as varchar(6));
		print 'Сообщение об ошибке: ' + ERROR_MESSAGE();
		print 'Строка ошибки: ' + cast(ERROR_LINE()as varchar(8));
		if ERROR_PROCEDURE() is not null
			print 'Имя процедуры ошибки: ' + ERROR_PROCEDURE();
		print 'Уровень серьёзности ошибки: ' + cast(ERROR_SEVERITY()as varchar(6));
		print 'Метка ошибки: ' + cast(ERROR_STATE()as varchar(8));
		if @@TRANCOUNT > 0 rollback tran;
		return -1;
	end catch;

DECLARE @paud int;
EXEC @paud = PAUDITORIUM_INSERTX @a='423-1',@n='423-1',@c='90',@t='ЛЛ-К', @tn ='Компьютерный класс';
print 'код ошибки=' + cast(@rnm as varchar(3));  

DELETE AUDITORIUM where AUDITORIUM_NAME='423-1';
DROP PROCEDURE PAUDITORIUM_INSERTX;
	