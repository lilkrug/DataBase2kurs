Use Univer;
--1задание
go
Declare @tv char(40), @t char(300)='';
Declare Predmeti Cursor 
				for Select s.SUBJECT_NAME from SUBJECT s where s.PULPIT = 'ИСИТ';
Open Predmeti;
Fetch Predmeti into @tv;
print 'Дисциплины кафедры ИСиТ';
while @@FETCH_STATUS = 0
   begin 
   set @t = RTRIM(@tv)+ ',' + @t;
   Fetch Predmeti into @tv;
   end;
print @t;
CLOSE Predmeti;
--2задание
--Local
go
DECLARE Teacher_cursor CURSOR LOCAL for select TEACHER.TEACHER_NAME from TEACHER where TEACHER.PULPIT = 'ИСиТ';
DECLARE @teacher char(50), @teacher_ot char(100) ='';
OPEN Teacher_cursor;
print 'Преподаватели ИСиТ';
FETCH  Teacher_cursor into @teacher;
	set @teacher_ot ='1. ' + RTRIM(@teacher);	
	print @teacher_ot;
CLOSE Teacher_cursor;

go
DECLARE @teacher char(50), @teacher_ot char(100) ='';
OPEN Teacher_cursor;
FETCH  Teacher_cursor into @teacher;
	set @teacher_ot ='2. ' + RTRIM(@teacher);	
	print @teacher_ot;
CLOSE Teacher_cursor
--======================================================
--global
go
DECLARE Teacher_cursor_2 CURSOR GLOBAL for select TEACHER.TEACHER_NAME from TEACHER where TEACHER.PULPIT = 'ПИ';
DECLARE @teacher char(50), @teacher_ot char(100) ='';
OPEN Teacher_cursor_2;
print 'Преподаватели ПИ';
FETCH  Teacher_cursor_2 into @teacher;
	set @teacher_ot ='1. ' + RTRIM(@teacher);	
	print @teacher_ot;
CLOSE Teacher_cursor_2;

go
DECLARE @teacher char(50), @teacher_ot char(100) ='';
OPEN Teacher_cursor_2;
print 'Преподаватели ПИ';
FETCH  Teacher_cursor_2 into @teacher;
	set @teacher_ot ='1. ' + RTRIM(@teacher);	
	print @teacher_ot;
CLOSE Teacher_cursor_2;

--3задание
-- *************************************************
INSERT Into AUDITORIUM values('301-1','ЛБ-К','15','301-1');
-- *************************************************
DECLARE Auditorium_local_static CURSOR  STATIC for select AUDITORIUM,AUDITORIUM_CAPACITY from AUDITORIUM where  AUDITORIUM_TYPE = 'ЛБ-К';

-- *************************************************
DECLARE @q int = 0, @auditorium char(10), @iter int = 1;
open Auditorium_local_static;
print 'Количество строк: ' + cast(@@CURSOR_ROWS as varchar(5));
DELETE AUDITORIUM where AUDITORIUM ='301-1';
FETCH Auditorium_local_static into @auditorium, @q;
while @@FETCH_STATUS = 0
	begin
		print cast(@iter as varchar(5)) + '. Аудитория ' + rtrim(@auditorium) +': ' + cast(@q as varchar(5)) + ' мест' ;
		set @iter += 1;
		FETCH Auditorium_local_static into @auditorium, @q;
	end;
CLOSE Auditorium_local_static;

-- *************************************************
-- *************************************************

INSERT Into AUDITORIUM values('301-1','ЛБ-К','15','301-1');
-- *************************************************
DECLARE Auditorium_local_dynamic CURSOR  DYNAMIC for select AUDITORIUM,AUDITORIUM_CAPACITY from AUDITORIUM where  AUDITORIUM_TYPE = 'ЛБ-К';

-- *************************************************
DECLARE @q int = 0, @auditorium char(10), @iter int = 1;
open Auditorium_local_dynamic;
print 'Количество строк: ' + cast(@@CURSOR_ROWS as varchar(5));
DELETE AUDITORIUM where AUDITORIUM ='301-1';
FETCH Auditorium_local_dynamic into @auditorium, @q;
while @@FETCH_STATUS = 0
	begin
		print cast(@iter as varchar(5)) + '. Аудитория ' + rtrim(@auditorium) +': ' + cast(@q as varchar(5)) + ' мест' ;
		set @iter += 1;
		FETCH Auditorium_local_dynamic into @auditorium, @q;
	end;
CLOSE Auditorium_local_dynamic;

--4задание
go
DECLARE @number varchar(100), @sub varchar(10), @idstudent varchar(6), @pdate varchar (11), @note varchar (2);
DECLARE PROGRESS_CURSOR_SCROLL CURSOR LOCAL DYNAMIC SCROLL
	for select ROW_NUMBER() over (order by IDSTUDENT) Номер,
	* from PROGRESS;

OPEN PROGRESS_CURSOR_SCROLL
FETCH PROGRESS_CURSOR_SCROLL into @number, @sub ,@idstudent ,@pdate,@note;
print 'Первая выбранная строка: ' + CHAR(10) +
'Номер записи: '+ rtrim(@number)  +
'. Дисциплина: '+ rtrim(@sub) +
'. ID студента: ' + rtrim(@idstudent) +
'. Дата экзамена: '  + rtrim(@pdate) + 
'. Оценка: ' + rtrim(@note);

FETCH LAST from PROGRESS_CURSOR_SCROLL into @number, @sub ,@idstudent ,@pdate,@note;
print 'Последняя строка: ' + CHAR(10) +
'Номер записи: '+ rtrim(@number)  +
'. Дисциплина: '+ rtrim(@sub) +
'. ID студента: ' + rtrim(@idstudent) +
'. Дата экзамена: '  + rtrim(@pdate) + 
'. Оценка: ' + rtrim(@note);

FETCH RELATIVE -1  from PROGRESS_CURSOR_SCROLL into @number, @sub ,@idstudent ,@pdate,@note;
print 'Первая до предыдущей строка: ' + CHAR(10) +
'Номер записи: '+ rtrim(@number)  +
'. Дисциплина: '+ rtrim(@sub) +
'. ID студента: ' + rtrim(@idstudent) +
'. Дата экзамена: '  + rtrim(@pdate) + 
'. Оценка: ' + rtrim(@note);

FETCH ABSOLUTE 2  from PROGRESS_CURSOR_SCROLL into @number, @sub ,@idstudent ,@pdate,@note;
print 'Вторая с начала строка: ' + CHAR(10) +
'Номер записи: '+ rtrim(@number)  +
'. Дисциплина: '+ rtrim(@sub) +
'. ID студента: ' + rtrim(@idstudent) +
'. Дата экзамена: '  + rtrim(@pdate) + 
'. Оценка: ' + rtrim(@note);

FETCH RELATIVE 1  from PROGRESS_CURSOR_SCROLL into @number, @sub ,@idstudent ,@pdate,@note;
print 'Первая после предыдущей строка: ' + CHAR(10) +
'Номер записи: '+ rtrim(@number)  +
'. Дисциплина: '+ rtrim(@sub) +
'. ID студента: ' + rtrim(@idstudent) +
'. Дата экзамена: '  + rtrim(@pdate) + 
'. Оценка: ' + rtrim(@note);

FETCH ABSOLUTE -3  from PROGRESS_CURSOR_SCROLL into @number, @sub ,@idstudent ,@pdate,@note;
print 'Третья с конца строка: ' + CHAR(10) +
'Номер записи: '+ rtrim(@number)  +
'. Дисциплина: '+ rtrim(@sub) +
'. ID студента: ' + rtrim(@idstudent) +
'. Дата экзамена: '  + rtrim(@pdate) + 
'. Оценка: ' + rtrim(@note);
close PROGRESS_CURSOR_SCROLL

--5задание
Declare @tc char(40), @tn char(40);
Declare Primer2 cursor local for select f.Faculty, f.Faculty_Name From FACULTY f For Update;
Open Primer2;
Fetch Primer2 into @tc,@tn;
Delete FACULTY Where CURRENT of Primer2;
Fetch Primer2 into @tc,@tn; 
Update FACULTY set FACULTY.Faculty_Name = 'БЕБРА' where  Current of Primer2;
close Primer2;

--6задание
go 
Declare @note int,@idstudent1 varchar(40),@idGroup1 int,@idstudent varchar(40),@idGroup int;
Declare Primer6 cursor local for select p.NOTE From PROGRESS p 
inner join STUDENT s on p.IDSTUDENT = s.IDSTUDENT
inner join GROUPS g on s.IDGROUP = g.IDGROUP For Update;
Open Primer6;
Fetch Primer6 into @note;
While @@FETCH_STATUS = 0
	begin
if(@note <= 4)
	begin 
	Delete PROGRESS Where CURRENT of Primer6;
end;
Fetch Primer6 into @note;
end;



