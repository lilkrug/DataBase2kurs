Use Univer;
select isnull (TEACHER.TEACHER_NAME, '***') [�������������], PULPIT.PULPIT_NAME[�������]
from TEACHER right outer join PULPIT
on TEACHER.PULPIT = PULPIT.PULPIT

select isnull (TEACHER.TEACHER_NAME, '***') [�������������], PULPIT.PULPIT_NAME[�������]
from TEACHER left outer join PULPIT
on TEACHER.PULPIT = PULPIT.PULPIT