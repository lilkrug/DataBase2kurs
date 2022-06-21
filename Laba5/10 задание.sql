Use Univer;
Select Name, BDAY From STUDENT 
where BDAY in(select BDAY From STUDENT group by BDAY having count(BDAY) >= 2)
order by BDAY asc;
