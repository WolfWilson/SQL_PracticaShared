use Gestion

select top 100 * from Maestro where Maestro.fech_alta > '2024-07-30'

select top 100 * from Movimiento where ejercicio = 2024

select * from areas
/*cod: 4 desc: Jubi*/

select top 100 * from Asignacion

select top 100 * from Expediente

select top 100 * from personal where personal.Codigo = 1046

select * from oficxarea where area=4

select * from OPadmin

SELECT TOP 100 * FROM Boca

SELECT * FROM Movimiento where fech_ingr  >= '2024-08-01'

/*1046 yo
1052 anto*/

SELECT DISTINCT
    /* m.IdMaestro, */   
    m.actuacion,
    m.letra,
    m.ejercicio as año,
    CONVERT(VARCHAR, m.fech_alta, 105) AS fech_alta,
    m.origen_nomenc,
    N.IdMovimiento,
    m.extracto,
    L.Descripcion 
FROM Maestro M  
INNER JOIN (
    SELECT MIN(n.IdMovimiento) AS IdMovimiento, n.IdMaestro
    FROM Movimiento N
    GROUP BY n.IdMaestro
) N ON M.IdMaestro = N.IdMaestro
INNER JOIN nomenclador L ON L.Codigo = M.origen_nomenc
WHERE M.fech_alta >= '2024-08-01' 
  AND M.letra IN ('E', 'K', 'V') 
  AND M.Boca IN (1, 88)
ORDER BY M.letra, M.origen_nomenc, M.actuacion

