-- Consultar los nombres de las restricciones únicas en la tabla Bien
SELECT name, type_desc
FROM sys.indexes
WHERE object_id = OBJECT_ID('Bien') AND is_unique_constraint = 1;


-- Eliminar la restricción UNIQUE de la columna Nomenclatura_catastral
ALTER TABLE Bien
DROP CONSTRAINT UQ__Bien__CA655166F50F89F0;

-- Eliminar la restricción UNIQUE de la columna Patente
ALTER TABLE Bien
DROP CONSTRAINT UQ__Bien__B70F206126602614;
