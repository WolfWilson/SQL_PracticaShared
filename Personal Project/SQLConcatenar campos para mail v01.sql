USE [MunicipalidadTP]
GO

CREATE PROCEDURE GenerarEmail
AS
BEGIN
    UPDATE [dbo].[Propietario]
    SET [Email] = LOWER(REPLACE([ApeyNombre], ' ', '') + '1234@yopmail.com')
END
GO

--EXEC GenerarEmail

select * from Propietario