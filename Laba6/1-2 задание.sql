Use Univer;
Select min(AUDITORIUM_CAPACITY) As Минимальная_Вместимость_Аудиторий,
	   max(AUDITORIUM_CAPACITY) As Максимальная_Вместимость_Аудиторий,
	   sum(AUDITORIUM_CAPACITY) As Суммарная_Вместимость_Аудиторий,
	   avg(AUDITORIUM_CAPACITY) As Средняя_Вместимость_Аудиторий,
	   count(*) As Количество_Аудиторий
From AUDITORIUM

Select AUDITORIUM_TYPENAME,
	   min(AUDITORIUM_CAPACITY) [Минимальная_Вместимость_Аудиторий],
	   max(AUDITORIUM_CAPACITY) [Максимальная_Вместимость_Аудиторий],
	   sum(AUDITORIUM_CAPACITY) [Суммарная_Вместимость_Аудиторий],
	   avg(AUDITORIUM_CAPACITY) [Средняя_Вместимость_Аудиторий],
	   count(*) [Количество_Аудиторий]
From AUDITORIUM inner join AUDITORIUM_TYPE
On AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE
group by AUDITORIUM_TYPE.AUDITORIUM_TYPENAME

