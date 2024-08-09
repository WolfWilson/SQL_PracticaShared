 /*necesitan un listado de los jubilados que cobran actualmente 
 (mes junio normal) en el banco 8 (pago a domicilio) la tabla es jubi,
  el campo se llama L-cobro, tenes que unirla a Maestros para ver que cobro el mes de junio
Los datos, nro de jubilado, dni, apellido y nombre, dirección, localidiad y CUIL*/
USE DSP
SELECT TOP 100 
j.Nro FROM Jubi j