Use Univer;
go
Drop table User_Event_LOG;
CREATE TABLE User_Event_LOG
(   
	SystemUser NVARCHAR(30), 
	DBUser nvarchar(30),
	SPID NVARCHAR(30),
	LogonTime DATE
);
go
Create trigger My_Trigger_LogOn On all server for LOGON
As begin
	 insert into Univer.dbo.User_Event_LOG 
	 Select SYSTEM_USER,USER,@@SPID,GETDATE()
	end;

Drop trigger My_Trigger_LogOn;

go
Create trigger My_Trigger_LogOff On all server for LOGOFF
As begin 
	 insert into Univer.dbo.User_Event_LOG 
	 Select SYSTEM_USER,USER,@@SPID,GETDATE()
	end;

select * from User_Event_LOG;


