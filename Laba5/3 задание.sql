Use Univer;
Select PULPIT_NAME
From PULPIT
inner join FACULTY F on F.Faculty = PULPIT.FACULTY
inner join PROFESSION G on G.FACULTY = PULPIT.FACULTY and 
(PROFESSION_NAME like('%технология%') or PROFESSION_NAME like('%технологии%'))