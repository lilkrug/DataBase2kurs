Use Univer;
Select SUBJECT,NOTE From PROGRESS
		Where NOTE >= all (select NOTE From PROGRESS
		Where SUBJECT like 'O%')

Select SUBJECT,NOTE From PROGRESS
		Where NOTE >= any (select NOTE From PROGRESS
		Where IDSTUDENT = 1020)