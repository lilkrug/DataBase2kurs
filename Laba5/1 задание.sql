Use Univer;
Select PULPIT_NAME
From PULPIT, FACULTY
Where PULPIT.FACULTY = FACULTY.FACULTY
and PULPIT.FACULTY in(select PROFESSION.FACULTY 
from PROFESSION 
Where PROFESSION_NAME like('%технология%') 
or PROFESSION_NAME like('%технологии%'));



