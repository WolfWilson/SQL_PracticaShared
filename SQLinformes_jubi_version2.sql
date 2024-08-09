USE Gestion
GO

SELECT DISTINCT 
	m.letra,
    m.actuacion,
    m.ejercicio as año,
    CONVERT(VARCHAR, m.fech_alta, 105) AS fech_alta,
    N.IdMovimiento,
    p.descripcion as Operador,
    M.origen_nomenc,
    L.Descripcion,
    LTRIM(RTRIM(REPLACE(REPLACE(Extracto, CHAR(13), ''), CHAR(10), ''))) AS ExtractoLimpio

FROM Gestion.dbo.Maestro M  
INNER JOIN (
    SELECT MIN(n.IdMovimiento) AS IdMovimiento, n.IdMaestro
    FROM Gestion.dbo.Movimiento N
    GROUP BY n.IdMaestro
) N ON M.IdMaestro = N.IdMaestro
INNER JOIN Gestion.dbo.nomenclador L ON L.Codigo = M.origen_nomenc 
INNER JOIN Gestion.dbo.Movimiento B ON B.IdMovimiento = n.IdMovimiento
INNER JOIN Gestion.dbo.personal P ON P.Codigo = b.origen_operador
/*INNER JOIN Aportes.dbo.Aportes A ON M.documento = A.DNI  -- unión con la tabla Aportes
INNER JOIN Aportes.dbo.reparticion R ON A.Reparticion = R.Cd_reparticion  -- unión adicional con la tabla reparticion*/
WHERE M.fech_alta >= '2024-08-01'  
    AND M.fech_alta <= '2024-08-08'
    AND M.letra IN ('E', 'K', 'V', '3') 
    AND M.Boca IN (1, 88)
ORDER BY M.letra, M.origen_nomenc, M.actuacion;

