Use Univer;
Select min(AUDITORIUM_CAPACITY) As �����������_�����������_���������,
	   max(AUDITORIUM_CAPACITY) As ������������_�����������_���������,
	   sum(AUDITORIUM_CAPACITY) As ���������_�����������_���������,
	   avg(AUDITORIUM_CAPACITY) As �������_�����������_���������,
	   count(*) As ����������_���������
From AUDITORIUM

Select AUDITORIUM_TYPENAME,
	   min(AUDITORIUM_CAPACITY) [�����������_�����������_���������],
	   max(AUDITORIUM_CAPACITY) [������������_�����������_���������],
	   sum(AUDITORIUM_CAPACITY) [���������_�����������_���������],
	   avg(AUDITORIUM_CAPACITY) [�������_�����������_���������],
	   count(*) [����������_���������]
From AUDITORIUM inner join AUDITORIUM_TYPE
On AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE
group by AUDITORIUM_TYPE.AUDITORIUM_TYPENAME

