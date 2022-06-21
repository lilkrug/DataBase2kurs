Use Univer;
--1запрос
go 
select t.teacher, t.TEACHER_NAME, t.PULPIT, t.GENDER
from TEACHER t inner join PULPIT p on t.PULPIT = p.PULPIT
where p.PULPIT = 'ИСИТ' for xml Raw('Teacher'),
root('Кафедры'), elements

--2запрос
go
select aud.AUDITORIUM_NAME, aud.AUDITORIUM_CAPACITY, aud.AUDITORIUM_TYPE from AUDITORIUM aud
inner join AUDITORIUM_TYPE att on aud.AUDITORIUM_TYPE = att.AUDITORIUM_TYPE where aud.AUDITORIUM_TYPE = 'ЛК'
for xml Raw('Аудитория'), root('Универ'), elements

--3 запрос
go
declare @h int = 0,
@xmlstr varchar(2000) = 
	   '<?xml version="1.0" encoding="windows-1251"?>
       <SUBJECTS> 
       <SUBJECT SUBJECT="WEB" SUBJECT_NAME="WEB-дизайн" PULPIT="ИСиТ" /> 
	   <SUBJECT SUBJECT="ЭК" SUBJECT_NAME="Экономика" PULPIT="ЭТиМ" /> 
	   <SUBJECT SUBJECT="ПЛТЛГ" SUBJECT_NAME="Политология" PULPIT="КИБиП" /> 
       </SUBJECTS>';
exec sp_xml_preparedocument @h output,@xmlstr;
select * from openxml(@h, '/SUBJECTS/SUBJECT', 0)
with([SUBJECT] nvarchar(50), [SUBJECT_NAME]  nvarchar(50), [PULPIT]  nvarchar(50)  )       
exec sp_xml_removedocument @h;                              -- удаление документа

--4 запрос
DELETE STUDENT where STUDENT.[NAME] = 'Копыл Ефим Андреевич';

INSERT INTO STUDENT(IDGROUP, [NAME], BDAY, INFO) 
values(28, 'Копыл Ефим Андреевич', '1995-04-09',
										'<студент>
											   <паспорт серия="АВ" номер="2249456" дата="01.03.2016" />
											   <паспорт серия="АВ" номер="2249456" дата="01.03.2016" />
											   <телефон>375336939934</телефон>
													 <адрес>
													      <страна>Беларусь</страна>
														  <город>Минск</город>
														  <улица>Свердлова</улица>
														  <дом>1</дом>
														  <квартира>2</квартира>
															 </адрес>
														  </студент>');
select * from STUDENT where [NAME] = 'Копыл Ефим Андреевич';

update STUDENT set INFO = '<студент>
							<паспорт серия="АВ" номер="2249456" дата="01.03.2017" />
							<телефон>375336939934</телефон>
							<адрес>
								<страна>Беларусь</страна>
								<город>Минск</город>
								<улица>Свердлова</улица>
								<дом>1</дом>
								<квартира>5</квартира>
							 </адрес>
							</студент>'
where STUDENT.INFO.value('(/студент/адрес/дом)[1]','int') = 1;

select * from STUDENT where [NAME] = 'Копыл Ефим Андреевич';

select NAME, 
	INFO.value('(студент/паспорт/@серия)[1]', 'char(2)')		[Серия паспорта],
	INFO.value('(студент/паспорт/@номер)[1]', 'varchar(10)')	[Номер паспорта],
	INFO.query('/студент/телефон')								[Адрес]
from  STUDENT where NAME = 'Копыл Ефим Андреевич';

--5 запрос
create xml schema collection Student as 
N'<?xml version="1.0" encoding="utf-16" ?>
<xs:schema attributeFormDefault="unqualified" 
   elementFormDefault="qualified"
   xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xs:element name="студент">
<xs:complexType><xs:sequence>
<xs:element name="паспорт" maxOccurs="1" minOccurs="1">
  <xs:complexType>
    <xs:attribute name="серия" type="xs:string" use="required" />
    <xs:attribute name="номер" type="xs:unsignedInt" use="required"/>
    <xs:attribute name="дата"  use="required">
	<xs:simpleType>  <xs:restriction base ="xs:string">
		<xs:pattern value="[0-9]{2}.[0-9]{2}.[0-9]{4}"/>
	 </xs:restriction> 	</xs:simpleType>
     </xs:attribute>
  </xs:complexType>
</xs:element>
<xs:element maxOccurs="3" name="телефон" type="xs:unsignedInt"/>
<xs:element name="адрес">   <xs:complexType><xs:sequence>
   <xs:element name="страна" type="xs:string" />
   <xs:element name="город" type="xs:string" />
   <xs:element name="улица" type="xs:string" />
   <xs:element name="дом" type="xs:string" />
   <xs:element name="квартира" type="xs:string" />
</xs:sequence></xs:complexType>  </xs:element>
</xs:sequence></xs:complexType>
</xs:element></xs:schema>';

alter table STUDENT alter column INFO xml(Student);

drop XML SCHEMA COLLECTION Student;