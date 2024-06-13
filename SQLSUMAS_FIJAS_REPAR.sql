USE DSP

SELECT 
C.idCargo,
C.Descripcion,
S.codcpto,
D.Descripcion,
SUBSTRING(CONVERT(VARCHAR(10), S.vigencia_desde, 120), 1, 7) AS FormattedDate,
S.importe,
S.PORCENTAJE

FROM Sumas_Fijas S
JOIN Cargos C ON S.idcargo = C.idCargo
JOIN CDConcepto D ON D.codcpto = S.codcpto
WHERE S.nivelrepar = 171

