/*la repartición 24 APA, algunos empleados cobraban un concepto 248 “Insalubridad” hasta el mes de julio del 2006, luego se transformó en el concepto 254 Riesgo Visual.
Queremos saber quiénes eran ya que el sistema hace el computo de servicio tomando 5x1 a la parte de Insalubridad cuando no corresponde..
Ejemplo: DNI 16004505
La base de datos es “aportes” ya que eran activos, las tablas aportes y aportes_lineas le van a dar los meses y conceptos */

USE Aportes
SELECT
a.DNI,
a.Apeynom,
a.IdCab,
a.Reparticion,
a.Insalubridad,
a.Mes,
a.Año,
p.CodConc,
p.DescConc

FROM Aportes a 
inner join  Aportes_linea p on a.IdCab = p.IdCab
WHERE a.Año > 1990 and a.Reparticion = 24 AND
                            exists (select 1 from Aportes_linea p1 where a.IdCab = p1.IdCab and p1.CodConc = 248  and a.Mes >=1 and a.Mes <= 12)
							AND p.CodConc = 248 --muestra todos los recibos cargados con codigo 248 hasta que dejo de aparecer dicho concepto para cada persona
					   
order by a.DNI, a.Año DESC, a.Mes asc
/*SELECT TOP 50 * FROM Aportes
SELECT TOP 50 * FROM Aportes_linea*/

