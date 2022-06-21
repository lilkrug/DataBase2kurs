Use Univer;
--1������
go 
select t.teacher, t.TEACHER_NAME, t.PULPIT, t.GENDER
from TEACHER t inner join PULPIT p on t.PULPIT = p.PULPIT
where p.PULPIT = '����' for xml Raw('Teacher'),
root('�������'), elements

--2������
go
select aud.AUDITORIUM_NAME, aud.AUDITORIUM_CAPACITY, aud.AUDITORIUM_TYPE from AUDITORIUM aud
inner join AUDITORIUM_TYPE att on aud.AUDITORIUM_TYPE = att.AUDITORIUM_TYPE where aud.AUDITORIUM_TYPE = '��'
for xml Raw('���������'), root('������'), elements

--3 ������
go
declare @h int = 0,
@xmlstr varchar(2000) = 
	   '<?xml version="1.0" encoding="windows-1251"?>
       <SUBJECTS> 
       <SUBJECT SUBJECT="WEB" SUBJECT_NAME="WEB-������" PULPIT="����" /> 
	   <SUBJECT SUBJECT="��" SUBJECT_NAME="���������" PULPIT="����" /> 
	   <SUBJECT SUBJECT="�����" SUBJECT_NAME="�����������" PULPIT="�����" /> 
       </SUBJECTS>';
exec sp_xml_preparedocument @h output,@xmlstr;
select * from openxml(@h, '/SUBJECTS/SUBJECT', 0)
with([SUBJECT] nvarchar(50), [SUBJECT_NAME]  nvarchar(50), [PULPIT]  nvarchar(50)  )       
exec sp_xml_removedocument @h;                              -- �������� ���������

--4 ������
DELETE STUDENT where STUDENT.[NAME] = '����� ���� ���������';

INSERT INTO STUDENT(IDGROUP, [NAME], BDAY, INFO) 
values(28, '����� ���� ���������', '1995-04-09',
										'<�������>
											   <������� �����="��" �����="2249456" ����="01.03.2016" />
											   <������� �����="��" �����="2249456" ����="01.03.2016" />
											   <�������>375336939934</�������>
													 <�����>
													      <������>��������</������>
														  <�����>�����</�����>
														  <�����>���������</�����>
														  <���>1</���>
														  <��������>2</��������>
															 </�����>
														  </�������>');
select * from STUDENT where [NAME] = '����� ���� ���������';

update STUDENT set INFO = '<�������>
							<������� �����="��" �����="2249456" ����="01.03.2017" />
							<�������>375336939934</�������>
							<�����>
								<������>��������</������>
								<�����>�����</�����>
								<�����>���������</�����>
								<���>1</���>
								<��������>5</��������>
							 </�����>
							</�������>'
where STUDENT.INFO.value('(/�������/�����/���)[1]','int') = 1;

select * from STUDENT where [NAME] = '����� ���� ���������';

select NAME, 
	INFO.value('(�������/�������/@�����)[1]', 'char(2)')		[����� ��������],
	INFO.value('(�������/�������/@�����)[1]', 'varchar(10)')	[����� ��������],
	INFO.query('/�������/�������')								[�����]
from  STUDENT where NAME = '����� ���� ���������';

--5 ������
create xml schema collection Student as 
N'<?xml version="1.0" encoding="utf-16" ?>
<xs:schema attributeFormDefault="unqualified" 
   elementFormDefault="qualified"
   xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xs:element name="�������">
<xs:complexType><xs:sequence>
<xs:element name="�������" maxOccurs="1" minOccurs="1">
  <xs:complexType>
    <xs:attribute name="�����" type="xs:string" use="required" />
    <xs:attribute name="�����" type="xs:unsignedInt" use="required"/>
    <xs:attribute name="����"  use="required">
	<xs:simpleType>  <xs:restriction base ="xs:string">
		<xs:pattern value="[0-9]{2}.[0-9]{2}.[0-9]{4}"/>
	 </xs:restriction> 	</xs:simpleType>
     </xs:attribute>
  </xs:complexType>
</xs:element>
<xs:element maxOccurs="3" name="�������" type="xs:unsignedInt"/>
<xs:element name="�����">   <xs:complexType><xs:sequence>
   <xs:element name="������" type="xs:string" />
   <xs:element name="�����" type="xs:string" />
   <xs:element name="�����" type="xs:string" />
   <xs:element name="���" type="xs:string" />
   <xs:element name="��������" type="xs:string" />
</xs:sequence></xs:complexType>  </xs:element>
</xs:sequence></xs:complexType>
</xs:element></xs:schema>';

alter table STUDENT alter column INFO xml(Student);

drop XML SCHEMA COLLECTION Student;