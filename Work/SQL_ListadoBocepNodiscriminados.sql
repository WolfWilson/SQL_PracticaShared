USE DSP
/* listar los BOCEP y EX BANCO DEL CHACO que estén ACTIVOS , NO DISCRIMINADOS */
GO
SELECT
	j.Nro_doc,
	j.Nombre,
	b.Descripcion
FROM Jubi j  join CDTipo_Benef b ON J.Tipo_Benef = B.Codigo
JOIN Maestros m on j.Nro_jub = m.Nro_jub 
	Where m.Periodo = '202404N1' and j.Discriminado = 0 and b.Codigo in (3 , 4)
Order by b.Codigo, j.Nro_doc



