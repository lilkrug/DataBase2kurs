Use Univer;
--1 �������
go
declare @x int,
		@y smallint,
		@z numeric,
		@a char = 'c',
		@b varchar(50) = 'Hi',
		@c tinyint,
		@e datetime,
		@f time;
SET @e = getdate();
SET @f = (SELECT @e dt);
	DECLARE @h TABLE
			(
			num int identity(1,1)
			);
INSERT @h default values;
INSERT @h default values;
INSERT @h default values;
INSERT @h default values;
SET @x =	(SELECT * from @h where num = 1);
SET	@y =	(SELECT * from @h where num = 2);
SET	@z =	(SELECT * from @h where num = 3);
SET	@c =	(SELECT * from @h where num = 4);
	--Select @a As a
	--Select @b = 'Hello Alexei', @c = 2, @e = '20140202',@f = '3:00';
	Select @b,@a,@e,@f;
	Print @x;print @y;print @z;print @c;
--2 �������

go 
Declare @sum int = (select cast(sum(AUDITORIUM_CAPACITY) as int) from AUDITORIUM),
		@c int = (select cast(count(*) as int) from AUDITORIUM),
	    @avg int = (select cast(avg(AUDITORIUM_CAPACITY) as int) from AUDITORIUM);
DECLARE	@lessavg int =  (select cast(count(*) as int) from AUDITORIUM where AUDITORIUM_CAPACITY < @avg);
DECLARE	@percent float =  cast(cast(@lessavg as float) / cast(@c as float) * 100  as float);
		If @sum > 200
		begin
	    SELECT @c '���������� ���������',			@avg '������� ����������� ���������',
			   @lessavg  '����������� < �������',		cast(@percent as varchar) + '%'   '������� �� ����� ���-�� ���������'
		end
	ELSE IF @sum < 200
		begin
		PRINT @sum
		end;
--3 �������
print('����� ������������ �����: ' + cast(@@RowCount as varchar);
print '������ SQL Server: ' +			@@VERSION  ;
print '��������� ������������� �������� ' +
	  '����������� �������� �������� ���-��������: ' +	cast(@@SPID  as varchar);
print '��� ��������� ������: ' + cast(@@ERROR as varchar);	
print '��� �������: ' +		@@SERVERNAME  ;
print '������� ����������� ����������: ' +	cast(@@TRANCOUNT as varchar);
print '�������� ���������� ���������� ����� ��������������� ������: ' +	cast(@@FETCH_STATUS as varchar);
print '������� ����������� ������� ���������: ' + cast(@@NESTLEVEL as varchar);

--4 �������
Declare @t int = 3, @x int = 4, @z int;
if(@t>@x)
	begin
	Set @z = POWER(Sin(@t),2);
end
else if (@t<@x)
	begin
	Set @z = 4*(@t + @x)
end
else if (@t=@x)
	begin
	Set @z = exp(@x - 2);
end
Select @z z;

DECLARE @tableFIO varchar(50) = (select top 1 [NAME] from STUDENT)
DECLARE @resultFIO varchar(50);
		SET @resultFIO = (select substring(@tableFIO, 1, charindex(' ', @tableFIO)) +
								 substring(@tableFIO, charindex(' ', @tableFIO)+1,1)+'.'+
								 substring(@tableFIO, charindex(' ', @tableFIO, charindex(' ', @tableFIO)+1)+1,1)+'.');
print @resultFIO;

declare @dt datetime = getdate();
declare @month int = 13;
if @month = 13
	set @month = 1;
select * from (select *, DATEDIFF(YEAR,BDAY,GETDATE()) ������� from STUDENT where MONTH(BDAY)  = @month) as tr;

	
	
	

select * from( select *, (Case
				        when DATEPART(weekday,PDATE) = 1 then '�����������'
						when DATEPART(weekday,PDATE) = 2 then '�������'
						when DATEPART(weekday,PDATE) = 3 then '�����'
						when DATEPART(weekday,PDATE) = 4 then '�������'
						when DATEPART(weekday,PDATE) = 5 then '�������'
						when DATEPART(weekday,PDATE) = 6 then '�������'
						when DATEPART(weekday,PDATE) = 7 then '�����������'
					end) [���� ������] from PROGRESS where [SUBJECT] like '%����%') as tr;
--5 �������
Select s.IDGROUP, round(avg(cast(p.NOTE as float(2))),2) [������� ������]
			From STUDENT s inner join Groups g
				on g.IDGROUP = s.IDGROUP
				inner join PROGRESS p
				on s.IDSTUDENT = p.IDSTUDENT 
				group by s.IDGROUP
DECLARE @gr varchar(3) = '28';
DECLARE @ttp float(2) = (SELECT round(avg(cast(PROGRESS.NOTE as float(2))),2) [������� ������]
			From STUDENT inner join GROUPS
				on GROUPS.IDGROUP = STUDENT.IDGROUP
				inner join PROGRESS	
				on STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT  where STUDENT.IDGROUP = @gr
				group by STUDENT.IDGROUP);
if(@ttp < 4)
	begin 
	Print('������������ ������ ����� : ' + cast(@gr as varchar) + '������.������� ���� : ' + cast(@ttp as varchar);
	end
ELSE IF (@ttp  > 4 and @ttp  < 8)
	begin 
	PRINT '������������ ������ ����� ' + cast(@gr as varchar) + ' �������. ������� ����: ' + cast(@ttp as varchar);
	end
ELSE IF (@ttp  > 8)
	begin 
	PRINT '������������ ������ ����� ' + cast(@gr as varchar) + ' �������. ������� ����: ' + cast(@ttp as varchar);
	end
--6�������
SELECT IDSTUDENT,
		CASE 
			WHEN avg (PROGRESS.NOTE) = 4 then '��������� �� ��������' 
			WHEN avg (PROGRESS.NOTE) between 5 and 6 then '����������� 1.2' 
			WHEN avg (PROGRESS.NOTE) between 7 and 8 then '����������� 1.3' 
			WHEN avg (PROGRESS.NOTE) between 9 and 10 then '����������� 1.4' 
			else '��� ���������'
		end [��������� ���������]
		FROM PROGRESS
		GROUP BY IDSTUDENT 

--7�������
CREATE TABLE #TEMP1
		(
			ID int identity(1,1),
			RANDOM_NUMBER int,
			WORD varchar(50) default '�������� ��-���������'
		);

DECLARE  @iter int = 0;
WHILE @iter < 10
	begin
	INSERT #TEMP1(RANDOM_NUMBER)
			values(rand() * 1000);
	SET @iter = @iter + 1;
	end
SELECT * from #TEMP1;

--8�������
begin try
Select * from STUDENT where STUDENT.NAME = '������ ������� ����������';
end try
begin catch
print '��� ������: ' + ERROR_NUMBER()
print '��������� �� ������: ' + ERROR_MESSAGE()
print '������ ������: ' + ERROR_LINE()
print '��� ��������� ������: ' + ERROR_PROCEDURE()
print '������� ����������� ������: ' + ERROR_SEVERITY()
print '����� ������: ' + ERROR_STATE()
end catch

--go 
--Declare @t int = 1
--While(@t < 11)
--	begin 
--	if(@t % 2 = 1)
--	print @t;
--	Set @t = @t + 1;
--end

		