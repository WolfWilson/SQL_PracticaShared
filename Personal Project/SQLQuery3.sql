USE [MunicipalidadTP]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarBienes]    Script Date: 13/06/2024 12:27:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ConsultarBienes]
AS
BEGIN
    SELECT * FROM Bien;
END;


EXEC ConsultarBienes