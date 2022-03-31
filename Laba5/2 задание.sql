Use Univer;
Select PULPIT_NAME
From PULPIT inner join FACULTY
on PULPIT.FACULTY = FACULTY.FACULTY
Where PULPIT.FACULTY in(select PROFESSION.FACULTY 
from PROFESSION 
Where PROFESSION_NAME like('%технология%') 
or PROFESSION_NAME like('%технологии%'));