USE [MunicipalidadTP]
GO

-- función para eliminar acentos
ALTER FUNCTION dbo.EliminarAcentos(@input NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @output NVARCHAR(MAX)
    SET @output = @input
    SET @output = REPLACE(@output, 'Á', 'A')
    SET @output = REPLACE(@output, 'É', 'E')
    SET @output = REPLACE(@output, 'Í', 'I')
    SET @output = REPLACE(@output, 'Ó', 'O')
    SET @output = REPLACE(@output, 'Ú', 'U')
    SET @output = REPLACE(@output, 'á', 'a')
    SET @output = REPLACE(@output, 'é', 'e')
    SET @output = REPLACE(@output, 'í', 'i')
    SET @output = REPLACE(@output, 'ó', 'o')
    SET @output = REPLACE(@output, 'ú', 'u')
    SET @output = REPLACE(@output, 'Ñ', 'N')
    SET @output = REPLACE(@output, 'ñ', 'n')
    RETURN @output
END
GO

-- Crear el procedimiento para generar el email
ALTER PROCEDURE GenerarEmail3
AS
BEGIN
    UPDATE [dbo].[Propietario]
    SET [Email] = LOWER(REPLACE(dbo.EliminarAcentos([ApeyNombre]), ' ', '') + '1234@yopmail.com')
END
GO

--EXEC GenerarEmail3
--select * from Propietario