Use Univer;
--1 ������
go
Create View [�������������]
 as select  TEACHER_NAME[��� �������������],
		    GENDER[���],
			PULPIT[�������] 
			From TEACHER;
--2 ������
go
Create View [���������� ������]
 as select f.Faculty_name[���������],
		   count(p.PULPIT)[���������� ������]
		   From FACULTY f inner join PULPIT p
		   On f.FACULTY = p.FACULTY
		   group by FACULTY_NAME;
--3 ������
go 
Create View [���������]
as select a.Auditorium[���],
		  a.Auditorium_name[������������_���������]
		  From AUDITORIUM a
		  Where a.AUDITORIUM_TYPE like '��%'
		  insert ��������� values ('318-9','318-9')
--4 ������
go
Create View [���������� ���������]
as select  Auditorium[���],
		  Auditorium_name[������������_���������]
		  From AUDITORIUM 
		  Where AUDITORIUM_TYPE like '��%'
		  and AUDITORIUM_NAME = AUDITORIUM with check option
--5 ������ 
go 
Create View [����������]
as select top(10) SUBJECT[���],
		  SUBJECT_Name[������������ ����������],
		  Pulpit[��� �������]
		  From SUBJECT
		  Order by SUBJECT_NAME
--6 ������
go
Alter View [���������� ������] with Schemabinding
as Select f.Faculty_name[���������],
		   count(p.PULPIT)[���������� ������]
		   From dbo.FACULTY f inner join dbo.PULPIT p
		   On f.FACULTY = p.FACULTY
		   group by FACULTY_NAME;

--DROP VIEW [�������������];
--DROP VIEW [���������� ������];
--DROP VIEW [���������];
--DROP VIEW [���������� ���������];
--DROP VIEW [����������];

		  
		  


