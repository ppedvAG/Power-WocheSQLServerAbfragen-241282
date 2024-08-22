create or alter  trigger trgLogin2 on ALL Server
for CREATE_LOGIN
as

SELECT 
	EVENTDATA().value('(/EVENT_INSTANCE/ServerName)[1]','nvarchar(max)')  ,
	EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]','nvarchar(max)')  , Getdate(),
	EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(max)') ,
	EVENTDATA().value('(/EVENT_INSTANCE/LoginName)[1]','nvarchar(max)'),
	Suser_Name(), APP_Name() into 
GO

	
	

USE [master]
GO
DROP LOGIN Mrx
CREATE LOGIN [Mrx] WITH PASSWORD=N'123', DEFAULT_DATABASE=[master]
, CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
