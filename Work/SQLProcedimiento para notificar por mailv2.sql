USE Aportes
GO
/****** Object:  StoredProcedure [dbo].[carga_estado_repart_Mailv2]    Script Date: 26/04/2024 08:47:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[carga_estado_repart_Mailv2]
AS
Declare @variable varchar (200), @body_text varchar(max)

SET @body_text = N'Resultados de la búsqueda:' + CHAR(13) + CHAR(10);
 -- Insertar los datos de la tabla temporal en el cuerpo del correo
 -- ##TempoWill (DNI INT, ApeyNomb VARCHAR(100), MAIL NVARCHAR (100), PCUserName NVARCHAR(50), FechaNac datetime) 
  SELECT @body_text = @body_text + 
                       CAST(DNI AS NVARCHAR(255)) + ' ' + 
                       CAST(ApeyNomb AS NVARCHAR(255)) + ' ' + 
                       CAST(MAIL AS NVARCHAR(255)) + ' ' +  
                       CAST(PCUserName AS NVARCHAR(255)) + ' ' + 
                       CAST(FechaNac AS NVARCHAR(255) ) + CHAR(13) + CHAR(10)
					   
    FROM ##TempoWill;

    

Select @variable = 'Este correo se envia al finalizar la ejecucion del Job verificar_limbo 
y habiendose encontrado expedientes sin generar ni asignados a nadie.'

BEGIN
	SET NOCOUNT ON;

	EXEC msdb.dbo.sp_send_dbmail
	@profile_name = 'MailGestion',
	@recipients = 'wbenitez@insssep.gov.ar ; abouvier@insssep.gov.ar',
	@body_format = 'text',
	@body = @body_text,
	--@query = 'SELECT * FROM  ##TempoWill',
	--@query_result_separator = '',
	@execute_query_database = 'Aportes',
	@subject = 'AVISO de expedientes en el LIMBO!';

	END