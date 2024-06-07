/*Use Gestion
/*Para encontrar expedientes que tienen informe generados y estan en primer etapa no asignados a nadie*/

Select *
from Maestro a inner join Movimiento b on a.IdMaestro = b.IdMaestro and b.destino_nomenc is null
where b.origen_nomenc = 888100 and a.letra = 'E'
order by fech_alta*/

Use Gestion;
GO
ALTER PROCEDURE Buscar_exptes_no_generados (@letra varchar(1)
)
AS
BEGIN
--DROP TABLE #tempWill
	CREATE TABLE #tempWill (idMaestro INT, actuacion INT, letra char(1), ejercicio INT, fechaalta datetime); 
	INSERT INTO #tempWill
	SELECT
	    m.IdMaestro,   
	    m.actuacion,
		m.letra,
		m.ejercicio,
		m.fech_alta
		FROM Maestro m inner join Movimiento b ON m.IdMaestro = b.IdMaestro
		AND b.destino_nomenc IS NULL
		WHERE b.origen_nomenc = 888100 AND m.letra = @letra
		ORDER BY fech_alta;

		IF (SELECT COUNT(*) FROM #tempWill)<>0 --hay resultados
		BEGIN
		PRINT 'SE ENCONTRO' 
		EXEC [dbo].[carga_estado_repart_Mailv2]--es otro procedimiento para.-
		END
		ELSE
		BEGIN
		PRINT 'NO SE ENCONTRO'
		END
		
END

						
/* PARA CREAR EL JOB 
EXEC Buscar_exptes_no_generados E
*/


