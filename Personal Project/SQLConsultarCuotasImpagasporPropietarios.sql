alter PROCEDURE [dbo].[ConsultarCuotasImpagasPorPropietarios]
AS
BEGIN
    SELECT 
        c.Idcuota, 
        c.Id_bien, 
        c.Monto, 
        c.Fecha_vencimiento, 
        c.CodEstado, 
        e.Descripcion AS EstadoDescripcion, 
        bp.Id_Propietario,
        p.ApeyNombre
    FROM 
        Cuota c
    JOIN 
        CDCuotaestado e ON c.CodEstado = e.Id_estado
    JOIN 
        BienPropietario bp ON c.Id_bien = bp.Id_Bien
    JOIN 
        Propietario p ON bp.Id_Propietario = p.IDPropietario
    WHERE 
        e.Id_estado=2; 
END;
GO



