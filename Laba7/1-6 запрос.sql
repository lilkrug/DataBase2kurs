Use Univer;
--1 запрос
go
Create View [Преподаватель]
 as select  TEACHER_NAME[Имя преподователя],
		    GENDER[Пол],
			PULPIT[Кафедра] 
			From TEACHER;
--2 запрос
go
Create View [Количество кафедр]
 as select f.Faculty_name[факультет],
		   count(p.PULPIT)[Количество кафедр]
		   From FACULTY f inner join PULPIT p
		   On f.FACULTY = p.FACULTY
		   group by FACULTY_NAME;
--3 запрос
go 
Create View [Аудитории]
as select a.Auditorium[Код],
		  a.Auditorium_name[Наименование_Аудитории]
		  From AUDITORIUM a
		  Where a.AUDITORIUM_TYPE like 'ЛК%'
		  insert Аудитории values ('318-9','318-9')
--4 запрос
go
Create View [Лекционные аудитории]
as select  Auditorium[Код],
		  Auditorium_name[Наименование_Аудитории]
		  From AUDITORIUM 
		  Where AUDITORIUM_TYPE like 'ЛК%'
		  and AUDITORIUM_NAME = AUDITORIUM with check option
--5 запрос 
go 
Create View [Дисциплины]
as select top(10) SUBJECT[код],
		  SUBJECT_Name[Наименование дисциплины],
		  Pulpit[Код кафедры]
		  From SUBJECT
		  Order by SUBJECT_NAME
--6 запрос
go
Alter View [Количество кафедр] with Schemabinding
as Select f.Faculty_name[факультет],
		   count(p.PULPIT)[Количество кафедр]
		   From dbo.FACULTY f inner join dbo.PULPIT p
		   On f.FACULTY = p.FACULTY
		   group by FACULTY_NAME;

--DROP VIEW [Преподаватель];
--DROP VIEW [Количество кафедр];
--DROP VIEW [Аудитории];
--DROP VIEW [Лекционные аудитории];
--DROP VIEW [Дисциплины];

		  
		  


