USE [Univer]
GO
/****** Object:  StoredProcedure [dbo].[PSubject]    Script Date: 26.04.2022 18:35:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[PSubject] @p varchar(20), @c int output
as 
 begin
	declare @k int = (select count(*) from SUBJECT);
	print 'параметры: @p=' + @p + ',@c =' + cast(@c as varchar(3));
	select SUBJECT 'Код',SUBJECT_NAME 'Дисциплина', PULPIT 'Кафедра' from SUBJECT where PULPIT= @p;
	set @c = @@ROWCOUNT;
	return @k;
end;



