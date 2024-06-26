USE [MunicipalidadTP]
GO
/****** Object:  StoredProcedure [dbo].[InsertarBien]    Script Date: 13/06/2024 12:38:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InsertarBien]
    @Tipo INT,
    @Direccion NVARCHAR(50) = NULL,
    @Superficie DECIMAL(10, 2) = NULL,
    @Nomenclatura_catastral NVARCHAR(15) = NULL,
    @Marca NVARCHAR(50) = NULL,
    @Modelo NVARCHAR(50) = NULL,
    @Anio INT = NULL,
    @Patente NVARCHAR(15) = NULL
AS
BEGIN
    INSERT INTO Bien (Tipo, Direccion, Superficie, Nomenclatura_catastral, Marca, Modelo, Anio, Patente)
    VALUES (@Tipo, @Direccion, @Superficie, @Nomenclatura_catastral, @Marca, @Modelo, @Anio, @Patente);
END;

/*EXEC InsertarBien 1, 'Manzana y limones 325', 350, 'nom9879', NULL, NULL, NULL, NULL
SELECT * from Bien*/