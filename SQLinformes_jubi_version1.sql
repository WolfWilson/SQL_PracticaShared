USE Gestion
go
SELECT DISTINCT 
    m.actuacion,
    m.letra,
    m.ejercicio as año,
    CONVERT(VARCHAR, m.fech_alta, 105) AS fech_alta,
    N.IdMovimiento,
	p.descripcion as Operador,
	M.origen_nomenc,
    L.Descripcion,
	LTRIM(RTRIM(REPLACE(REPLACE(Extracto, CHAR(13), ''), CHAR(10), ''))) AS ExtractoLimpio
    /*'[' + M.extracto+ ']' AS Extracto*/
	/*LEFT(m.extracto, 80) AS extracto*/
FROM Maestro M  
INNER JOIN (
    SELECT MIN(n.IdMovimiento) AS IdMovimiento, n.IdMaestro
    FROM Movimiento N
    GROUP BY n.IdMaestro
) N ON M.IdMaestro = N.IdMaestro
INNER JOIN nomenclador L ON L.Codigo = M.origen_nomenc 
INNER JOIN Movimiento B ON B.IdMovimiento = n.IdMovimiento
inner JOIN personal P ON P.Codigo = b.origen_operador

	WHERE M.fech_alta >= '2024-07-01'  and M.fech_alta <='2024-08-01'
	AND M.letra IN ('E', 'K', 'V', '3') 
	AND M.Boca IN (1, 88)
	ORDER BY M.letra, M.origen_nomenc, M.actuacion