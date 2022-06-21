Use Univer;
--1������
go
Create Function COUNT_STUDENT (@faculty varchar(20)) returns int 
as begin declare @rc int = 0;
set @rc = (select count(IDSTUDENT) 
	from GROUPS g inner join FACULTY f on g.FACULTY = f.FACULTY 
	inner join STUDENT s on g.IDGROUP = s.IDGROUP where g.FACULTY = @faculty)
	return @rc;
end;


declare @faculty_name char(10) = '��';
declare @f_result int = dbo.COUNT_STUDENT(@faculty_name);
print '���������� ��������� ���������� ' + rtrim(@faculty_name) + ': ' + cast(@f_result as varchar);

--2������
go 
Create Function FSUBJECTS (@p varchar(20)) returns char(300)
as begin 
declare @rnm varchar(20);
declare @dist varchar(300)= '';
declare Subject1 cursor local 
for select s.SUBJECT_NAME from SUBJECT s where s.PULPIT = @p;
open Subject1;
Fetch Subject1 into @rnm;
	While @@FETCH_STATUS = 0
		begin 
		set @dist = @dist + ',' + rtrim(@rnm);
		Fetch Subject1 into @rnm;
	end;
Close Subject1;
set @dist = '�����������: ' + @dist;
return @dist;
end;
-------------------------
select PULPIT.PULPIT '�������', dbo.FSUBJECTS(PULPIT.PULPIT) '��������� �������' from PULPIT;

--3������
go
Create Function FFACPUL(@f varchar(20),@p varchar(20)) returns table
as return
select f.Faculty,p.PULPIT from FACULTY f left outer join PULPIT p on f.FACULTY = p.FACULTY
Where f.FACULTY = isnull(@f, f.FACULTY) and p.PULPIT = isnull(@p,p.PULPIT);
-------------------
select * from dbo.FFACPUL(Null,Null);
select * from dbo.FFACPUL('����',Null);
select * from dbo.FFACPUL(Null,'����');
select * from dbo.FFACPUL('��','���');

--4������ 
go
Create Function FCTEACHER(@p varchar(20)) returns int 
as begin
	declare @rc int = 0;
	set @rc = (select count(*) from TEACHER t inner join PULPIT p on t.PULPIT = p.PULPIT
		where p.PULPIT = isnull(@rc,p.PULPIT));
		return @rc;
end;
------------------
select PULPIT, dbo.FCTEACHER(PULPIT) [���������� ��������������] from PULPIT;
select dbo.FCTEACHER(NULL) [����� ������];

--DROP FUNCTION FCTEACHER;

--6������
go 
create function COUNT_PULPIT(@faculty varchar(20)) returns int
as begin 
declare @ret int = 0;
set @ret = (select count(PULPIT) from 
			PULPIT where FACULTY = @faculty);
return @ret;
end;

go 
create function COUNT_GROUP(@faculty varchar(20)) returns int
as begin 
declare @ret int = 0;
set @ret = (select count(IDGROUP) from 
			[GROUP] where FACULTY = @faculty);
return @ret;
end;

go 
create function COUNT_PROFESSION(@faculty varchar(20)) returns int
as begin 
declare @ret int = 0;
set @ret = (select count(PROFESSION) from 
			PROFESSION where FACULTY = @faculty);
return @ret;
end;

--DROP FUNCTION COUNT_PULPIT;
--DROP FUNCTION COUNT_GROUP;
--DROP FUNCTION COUNT_PROFESSION;

-- �������!!!!!!!!!!!!!!!!
--create function FACULTY_REPORT(@c int) returns @fr table
--( [���������] varchar(50), [���������� ������] int, [���������� �����]  int, [���������� ���������] int, [���������� ��������������] int )
--as begin 
--declare cc CURSOR static for 
--select FACULTY from FACULTY 
--where dbo.COUNT_STUDENTS(FACULTY, default) > @c; 
--declare @f varchar(30);
--open cc;  
--fetch cc into @f;
--while @@fetch_status = 0
--	begin
--insert @fr values( @f,  (select count(PULPIT) from PULPIT where FACULTY = @f),
--(select count(IDGROUP) from GROUPS where FACULTY = @f),   dbo.COUNT_STUDENTS(@f, default),
--(select count(PROFESSION) from PROFESSION where FACULTY = @f)   ); 
--fetch cc into @f;  
--	end;   
--    return; 
--end;
