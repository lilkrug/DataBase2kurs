Use Univer;
Select AUDITORIUM.AUDITORIUM[����� ���������], AUDITORIUM_TYPE.AUDITORIUM_TYPE[��� ���������]
From AUDITORIUM_TYPE Cross Join AUDITORIUM
	Where AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE