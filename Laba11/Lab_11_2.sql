Use Univer;
-----�������� B-----
	begin transaction
		select @@SPID;
		insert AUDITORIUM_TYPE values ('��', '���������� ���');
		update AUDITORIUM_TYPE set AUDITORIUM_TYPENAME = '���������� �������' where AUDITORIUM_TYPE = '��';
	
	-----T1-----
	-----T2-----
	rollback;


--5

begin transaction
------------t1
update PULPIT set FACULTY = '��' 
where FACULTY = '���' 
commit; 
-------------------------- t2 --------------------	
	

--6

begin transaction 	  
	-------------------------- t1 --------------------
          insert TEACHER values ('���', 'GGGGGGGG', '�', '����');
          commit; 
	-------------------------- t2 --------------------
	select * from TEACHER

--7

begin transaction 
		  delete TEACHER where TEACHER = '�����';  
          insert TEACHER values ('�����', '������ ������ ���������', '�', '��');
          update TEACHER set TEACHER = '����' where TEACHER = '���';
          select TEACHER from TEACHER  where PULPIT = '��';
          -------------------------- t1 --------------------
          commit; 
           select TEACHER from TEACHER  where PULPIT = '��';
      -------------------------- t2 --------------------





--��� ����� 11 ����
Begin tran
Delete from AUDITORIUM Where AUDITORIUM = '140-1'
-----
RollBack tran


--��� ������� ������ �������� (Read Committed) �� ������ ������ ������
Begin tran
Delete from AUDITORIUM Where AUDITORIUM = '140-1'
-----
RollBack tran


--��� ������� ������ �������� (Read Committed) c ������ �������
begin tran
Delete from AUDITORIUM Where AUDITORIUM = '140-1'
Commit tran




--��� ������� ������ �������� (Repeatable read)
Begin tran
Delete from AUDITORIUM Where AUDITORIUM = '140-1'
-----
Commit tran

Rollback tran
