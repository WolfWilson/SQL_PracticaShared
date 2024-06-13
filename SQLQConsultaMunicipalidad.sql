SELECT * FROM Propietario
SELECT * FROM Bien
SELECT * FROM BienesPropietarios
/*
-- Llamado al procedimiento de relacionar bienes con propietarios
EXEC RelacionarPropietarioBien @IdBien = 18, @IdPropietario = 1, @PorcentajePropiedad = 100.0;

EXEC RelacionarPropietarioBien 28, 12, 100*/

SELECT 
    bp1.Id_Propietario AS ID_Propietario_1, 
    p1.ApeyNombre AS Nombre_Propietario_1,
    bp2.Id_Propietario AS ID_Propietario_2,
    p2.ApeyNombre AS Nombre_Propietario_2,
    bp1.Idbien AS ID_Bien,
	bp3.Idbien AS ID_BIEN_FROM_BIEN,
	bp3.Marca,
	bp3.Direccion,
	bp3.Patente,
	bp3.Tipo

--CONSULTA DE COINCIDENCIA DE PROPIETARIOS EN BIENES	
FROM 
    BienesPropietarios bp1
INNER JOIN 
    BienesPropietarios bp2 ON bp1.Idbien = bp2.Idbien AND bp1.Id_Propietario < bp2.Id_Propietario
INNER JOIN 
    Propietario p1 ON bp1.Id_Propietario = p1.IDPropietario
INNER JOIN 
    Propietario p2 ON bp2.Id_Propietario = p2.IDPropietario
INNER JOIN Bien bp3 ON bp3.Idbien = bp2.Idbien;

