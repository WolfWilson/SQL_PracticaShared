USE DSP

SELECT 
C.idCargo,
C.Descripcion,
S.codcpto,
D.Descripcion,
SUBSTRING(CONVERT(VARCHAR(10), S.vigencia_desde, 120), 1, 7) AS Fecha_Desde,
S.importe,
S.PORCENTAJE

FROM Sumas_Fijas S
LEFT JOIN Cargos C ON S.idcargo = C.idCargo
JOIN CDConcepto D ON D.codcpto = S.codcpto
WHERE S.nivelrepar = 171

SELECT * FROM Sumas_Fijas WHERE Sumas_Fijas.nivelrepar = 171

