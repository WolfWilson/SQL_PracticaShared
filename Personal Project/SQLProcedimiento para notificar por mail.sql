USE Aportes
GO
/****** Object:  StoredProcedure [dbo].[carga_estado_repart_Mailv2]    Script Date: 26/04/2024 08:47:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[carga_estado_repart_Mailv2]
AS

Declare @variable varchar (200)
DECLARE @DNI INT, @ApeyNomb VARCHAR(100), @MAIL NVARCHAR(100), @PCUserName NVARCHAR(50), @FechaNac datetime


Declare CursorWill CURSOR FOR
SELECT DNI, Apeynomb, MAIL, PCUserName, FechaNac
FROM ##TempoWill 

OPEN CursorWill
DECLARE @textomail nvarchar(max) = ''

FETCH NEXT FROM CursorWill INTO @DNI, @ApeyNomb, @MAIL, @PCUserName, @FechaNac
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @textomail = @textomail +  CAST(@DNI AS NVARCHAR(10)) + ', ' 
	+ @ApeyNomb + ', ' + @MAIL + ', ' + @PCUserName + ', '
	 + CONVERT(NVARCHAR, @FechaNac, 120) + CHAR(13) + CHAR(10)
	 
	 FETCH NEXT FROM CursorWill INTO @DNI, @ApeyNomb, @MAIL, @PCUserName, @FechaNac
END

-- Cerrar el cursor
CLOSE CursorWill
DEALLOCATE CursorWill

--Select @variable = 'Este correo se envia al finalizar la ejecucion del Job verificar_limbo 
--y habiendose encontrado expedientes sin generar ni asignados a nadie.'

BEGIN
	SET NOCOUNT ON;

	EXEC msdb.dbo.sp_send_dbmail
	@profile_name = 'MailGestion',
	@recipients = 'wbenitez@insssep.gov.ar ; abouvier@insssep.gov.ar',
	@body_format = 'html',
	@body = @textomail,
	--@query = 'SELECT * FROM  ##TempoWill',
	@query_result_separator = '',
	@execute_query_database = 'Aportes',
	@subject = 'AVISO de expedientes en el LIMBO!';

	END