Use Univer;
 --5�������
Select distinct FACULTY_NAME from FACULTY, PULPIT
Where not exists (select * from PULPIT Where FACULTY.FACULTY = PULPIT.FACULTY)

 --6�������
Select top 1
(select avg(Note) from PROGRESS
		where SUBJECT like '����') [����],
(select avg(Note) from PROGRESS
		where SUBJECT like '��') [��],
(select avg(Note) from PROGRESS
		where SUBJECT like '����') [����]
From PROGRESS


