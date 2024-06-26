USE [MunicipalidadTP]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarBienesPorPropietarios]    Script Date: 13/06/2024 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ConsultarBienesPorPropietarios]
AS
BEGIN
    SELECT 
        bp.Id_Bien, 
        b.Tipo, 
        b.Direccion, 
        b.Superficie, 
        b.Nomenclatura_catastral, 
        b.Marca, 
        b.Modelo, 
        b.Anio, 
        b.Patente, 
        bp.Id_Propietario, 
        p.ApeyNombre, 
        p.Numdoc, 
        p.Direccion AS DireccionPropietario, 
        bp.Porcentaje_propiedad 
    FROM 
        BienPropietario bp
    JOIN 
        Bien b ON bp.Id_Bien = b.Idbien
    JOIN 
        Propietario p ON bp.Id_Propietario = p.IDPropietario;
END;

--EXEC ConsultarBienesPorPropietarios 
