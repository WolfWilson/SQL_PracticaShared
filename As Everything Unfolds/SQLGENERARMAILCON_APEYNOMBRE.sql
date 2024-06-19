USE [MunicipalidadTP]
GO

-- funci�n para eliminar acentos
ALTER FUNCTION dbo.EliminarAcentos(@input NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @output NVARCHAR(MAX)
    SET @output = @input
    SET @output = REPLACE(@output, '�', 'A')
    SET @output = REPLACE(@output, '�', 'E')
    SET @output = REPLACE(@output, '�', 'I')
    SET @output = REPLACE(@output, '�', 'O')
    SET @output = REPLACE(@output, '�', 'U')
    SET @output = REPLACE(@output, '�', 'a')
    SET @output = REPLACE(@output, '�', 'e')
    SET @output = REPLACE(@output, '�', 'i')
    SET @output = REPLACE(@output, '�', 'o')
    SET @output = REPLACE(@output, '�', 'u')
    SET @output = REPLACE(@output, '�', 'N')
    SET @output = REPLACE(@output, '�', 'n')
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