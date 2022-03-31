Use Univer;
 --5задание
Select distinct FACULTY_NAME from FACULTY, PULPIT
Where not exists (select * from PULPIT Where FACULTY.FACULTY = PULPIT.FACULTY)

 --6задание
Select top 1
(select avg(Note) from PROGRESS
		where SUBJECT like 'ОАиП') [ОАИП],
(select avg(Note) from PROGRESS
		where SUBJECT like 'БД') [БД],
(select avg(Note) from PROGRESS
		where SUBJECT like 'СУБД') [СУБД]
From PROGRESS


