Use Univer; 
exec sp_helpindex 'AUDITORIUM' 
exec sp_helpindex 'AUDITORIUM TYPE'
exec sp_helpindex 'FACULTY'
exec sp_helpindex 'GROUP'
exec sp_helpindex 'PROFESSION'
exec sp_helpindex 'PROGRESS'
exec sp_helpindex 'PULPIT'
exec sp_helpindex 'STUDENT'
exec sp_helpindex 'SUBJECT'
exec sp_helpindex 'TEACHER'
exec sp_helpindex 'TIMETABLE'


Create table #EXAMPLE1(
	ID int identity(1,1),
	STRING varchar(13)
);

Set nocount on;
declare @i int =0;
While @i < 10000
	begin
	insert into #EXAMPLE1 values (REPLICATE('строка ',2));
	set @i = @i + 1;
	end;

DROP TABLE #EXAMPLE1

CREATE CLUSTERED INDEX #EXAMPLE_CL1 on #EXAMPLE1(ID asc);
DROP INDEX [#EXAMPLE].[#EXAMPLE_CL1]
--
SELECT * FROM #EXAMPLE1 where ID between 150 and 200 order by ID;
checkpoint;  
DBCC DROPCLEANBUFFERS; 
-- НАЧАЛЬНАЯ СТОИМОСТЬ: 0.042 ▬ КОНЕЧНАЯ СТОИМОСТЬ: 0.011

--2запрос
--CREATE index #EXAMPLE_CL2 on #EXAMPLE(ID,STRING);
--DROP index [#EXAMPLE].[#EXAMPLE_CL2]
checkpoint;  
DBCC DROPCLEANBUFFERS;
SELECT COUNT(*) from #EXAMPLE where STRING = 'строка' and ID = 2;

-- НАЧАЛЬНАЯ СТОИМОСТЬ: 0.043 ▬ КОНЕЧНАЯ СТОИМОСТЬ: 0.0032

--3запрос
--CREATE INDEX #EXAMPLE_ID_X on #EXAMPLE(ID) INCLUDE (STRING);
--DROP index [#EXAMPLE].[#EXAMPLE_ID_X]
SELECT STRING from #EXAMPLE where ID between 1 and 10;


-- НАЧАЛЬНАЯ СТОИМОСТЬ: 0.043 ▬ КОНЕЧНАЯ СТОИМОСТЬ: 0.0032

--4запрос
--CREATE INDEX #EXAMPLE_ID_WHERE on #EXAMPLE(ID) where (ID >= 1 and ID <= 10);
--DROP index [#EXAMPLE].[#EXAMPLE_ID_WHERE]
SELECT STRING from #EXAMPLE where ID >= 1 and ID <= 10;


-- НАЧАЛЬНАЯ СТОИМОСТЬ: 0.043 ▬ КОНЕЧНАЯ СТОИМОСТЬ: 0.0030

--5запрос
