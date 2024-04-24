Use Gestion
/*Para encontrar expedientes que tienen informe generados y estan en primer etapa no asignados a nadie*/

Select *
from Maestro a inner join Movimiento b on a.IdMaestro = b.IdMaestro and b.destino_nomenc is null
where b.origen_nomenc = 888100 and a.letra = 'E'
order by fech_alta

 