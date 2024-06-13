--Procedimientos de la BD

--Procedimientos de consultas

CREATE PROCEDURE ConsultarBienes
AS
BEGIN
    SELECT * FROM Bien;
END;
GO

CREATE PROCEDURE ConsultarPropietarios
AS
BEGIN
    SELECT * FROM Propietario;
END;
GO

CREATE PROCEDURE ConsultarBienesPorPropietarios
AS
BEGIN
    SELECT 
        bp.Idbien, 
        b.Tipo, 
        b.Direccion, 
        b.Superficie, 
        b.Nomenclatura_catastral, 
        b.Marca, 
        b.Modelo, 
        b.Anio, 
        b.Patente, 
        bp.Id_Propietario, 
        p.ApeyNombre, 
        p.Numdoc, 
        p.Direccion AS DireccionPropietario, 
        bp.Porcentaje_propiedad 
    FROM 
        BienesPropietarios bp
    JOIN 
        Bien b ON bp.Idbien = b.Idbien
    JOIN 
        Propietario p ON bp.Id_Propietario = p.IDPropietario;
END;
GO

CREATE PROCEDURE ConsultarCuotasImpagas
AS
BEGIN
    SELECT 
        c.Idcuota, 
        c.Id_bien, 
        c.Monto, 
        c.Fecha_vencimiento, 
        c.CodEstado, 
        e.Descripcion AS EstadoDescripcion 
    FROM 
        Cuota c
    JOIN 
        CDCuotaestado e ON c.CodEstado = e.Id_estado
    WHERE 
        e.Id_estado = 2; --impaga
END;
GO

CREATE PROCEDURE ConsultarPagosRealizados
AS
BEGIN
    SELECT 
        p.Id, 
        p.Id_cuota, 
        p.Fecha_pago, 
        p.Monto_pagado, 
        c.Id_bien, 
        c.Monto AS MontoCuota, 
        c.Fecha_vencimiento 
    FROM 
        Pagos p
    JOIN 
        Cuota c ON p.Id_cuota = c.Idcuota
		
END;
GO
--Procedimientos de INSERCIÓN

CREATE PROCEDURE InsertarPropietario
    @ApeyNombre NVARCHAR(50),
    @Numdoc INT,
    @Direccion NVARCHAR(50),
    @Fechanac DATE,
    @Clavedeacceso VARBINARY(64)
AS
BEGIN
    INSERT INTO Propietario (ApeyNombre, Numdoc, Direccion, Fechanac, Clavedeacceso)
    VALUES (@ApeyNombre, @Numdoc, @Direccion, @Fechanac, @Clavedeacceso);
END;
GO

CREATE PROCEDURE InsertarBien
    @Tipo INT,
    @Direccion NVARCHAR(50) = NULL,
    @Superficie DECIMAL(10, 2) = NULL,
    @Nomenclatura_catastral NVARCHAR(15) = NULL,
    @Marca NVARCHAR(50) = NULL,
    @Modelo NVARCHAR(50) = NULL,
    @Anio INT = NULL,
    @Patente NVARCHAR(15) = NULL
AS
BEGIN
    INSERT INTO Bien (Tipo, Direccion, Superficie, Nomenclatura_catastral, Marca, Modelo, Anio, Patente)
    VALUES (@Tipo, @Direccion, @Superficie, @Nomenclatura_catastral, @Marca, @Modelo, @Anio, @Patente);
END;
GO


CREATE PROCEDURE InsertarCuota
    @Id_bien INT,
    @Monto DECIMAL(10, 2),
    @Fecha_vencimiento DATE,
    @CodEstado INT
AS
BEGIN
    INSERT INTO Cuota (Id_bien, Monto, Fecha_vencimiento, CodEstado)
    VALUES (@Id_bien, @Monto, @Fecha_vencimiento, @CodEstado);
END;
GO

CREATE PROCEDURE InsertarPago
    @Id_cuota INT,
    @Fecha_pago DATE,
    @Monto_pagado DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Pagos (Id_cuota, Fecha_pago, Monto_pagado)
    VALUES (@Id_cuota, @Fecha_pago, @Monto_pagado);
END;
GO

--Procedimientos de relaciones

CREATE PROCEDURE RelacionarPropietarioBien
    @Idbien INT,
    @Id_Propietario INT,
    @Porcentaje_propiedad DECIMAL(5, 2)
AS
BEGIN
    INSERT INTO BienesPropietarios (Idbien, Id_Propietario, Porcentaje_propiedad)
    VALUES (@Idbien, @Id_Propietario, @Porcentaje_propiedad);
END;
GO
--PROCEDIMIENTOS DE BORRADO DE REGISTROS
-- Borrar Propietario
CREATE PROCEDURE BorrarPropietario
    @IDPropietario INT
AS
BEGIN
    -- Primero, eliminamos las relaciones de BienesPropietarios
    DELETE FROM BienesPropietarios WHERE Id_Propietario = @IDPropietario;

    -- Luego, eliminamos los registros de PagosPropietarios
    DELETE FROM PagosPropietarios WHERE Id_propietario = @IDPropietario;

    -- Finalmente, eliminamos el Propietario
    DELETE FROM Propietario WHERE IDPropietario = @IDPropietario;
END;
GO

-- Borrar Bien
CREATE PROCEDURE BorrarBien
    @Idbien INT
AS
BEGIN
    -- Primero, eliminamos las relaciones de BienesPropietarios
    DELETE FROM BienesPropietarios WHERE Idbien = @Idbien;

    -- Luego, eliminamos los registros de Cuotas relacionadas
    DELETE FROM Cuota WHERE Id_bien = @Idbien;

    -- Finalmente, eliminamos el Bien
    DELETE FROM Bien WHERE Idbien = @Idbien;
END;
GO

-- Borrar Cuota
CREATE PROCEDURE BorrarCuota
    @Idcuota INT
AS
BEGIN
    -- Primero, eliminamos los registros de Pagos relacionados
    DELETE FROM Pagos WHERE Id_cuota = @Idcuota;

    -- Luego, eliminamos la Cuota
    DELETE FROM Cuota WHERE Idcuota = @Idcuota;
END;
GO

-- Borrar Pago
CREATE PROCEDURE BorrarPago
    @Id INT
AS
BEGIN
    -- Eliminamos el Pago
    DELETE FROM Pagos WHERE Id = @Id;
END;
GO


