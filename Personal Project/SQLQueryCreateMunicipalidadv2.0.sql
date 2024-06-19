-- Crear la base de datos
CREATE DATABASE MunicipalidadTP;
GO

-- Usar la base de datos
USE MunicipalidadTP;
GO

-- Crear la tabla Propietario
CREATE TABLE Propietario (
    IDPropietario INT PRIMARY KEY IDENTITY(1,1),
    ApeyNombre NVARCHAR(50) NOT NULL,
    Numdoc INT NOT NULL,
    Direccion NVARCHAR(50),
    Fechanac DATE UNIQUE,
    Clavedeacceso VARBINARY(64) -- Asumimos uso de SHA2_256
);
GO

-- Insertar valores de prueba en la tabla Propietario
INSERT INTO Propietario (ApeyNombre, Numdoc, Direccion, Fechanac, Clavedeacceso)
VALUES 
('Juan Pérez', 12345678, 'Calle Falsa 123', '1980-05-01', HASHBYTES('SHA2_256', 'password1')),
('María García', 23456789, 'Av. Siempre Viva 742', '1975-03-15', HASHBYTES('SHA2_256', 'password2')),
('Carlos López', 34567890, 'Boulevard de los Sueños 456', '1988-07-22', HASHBYTES('SHA2_256', 'password3')),
('Ana Martínez', 45678901, 'Calle del Sol 789', '1990-12-30', HASHBYTES('SHA2_256', 'password4')),
('Luis González', 56789012, 'Avenida Libertador 101', '1982-01-20', HASHBYTES('SHA2_256', 'password5')),
('Marta Rodríguez', 67890123, 'Calle de la Luna 202', '1979-11-11', HASHBYTES('SHA2_256', 'password6')),
('Jorge Fernández', 78901234, 'Camino de los Vientos 303', '1985-06-25', HASHBYTES('SHA2_256', 'password7')),
('Laura Sánchez', 89012345, 'Calle del Mar 404', '1992-04-04', HASHBYTES('SHA2_256', 'password8')),
('Pedro Ramírez', 90123456, 'Avenida de los Pinos 505', '1978-09-09', HASHBYTES('SHA2_256', 'password9')),
('Elena Torres', 12345679, 'Boulevard de la Esperanza 606', '1995-08-08', HASHBYTES('SHA2_256', 'password10')),
('Roberto Álvarez', 23456780, 'Calle de los Sueños 707', '1983-02-14', HASHBYTES('SHA2_256', 'password11')),
('Gloria Mendoza', 34567891, 'Avenida de la Paz 808', '1976-10-18', HASHBYTES('SHA2_256', 'password12')),
('Fernando Romero', 45678902, 'Calle del Amor 909', '1991-07-07', HASHBYTES('SHA2_256', 'password13')),
('Silvia Ortega', 56789013, 'Camino del Sol 111', '1989-03-23', HASHBYTES('SHA2_256', 'password14')),
('Diego Silva', 67890124, 'Avenida de las Flores 222', '1987-11-30', HASHBYTES('SHA2_256', 'password15')),
('Patricia Ruiz', 78901235, 'Calle del Río 333', '1993-05-19', HASHBYTES('SHA2_256', 'password16')),
('Héctor Herrera', 89012346, 'Boulevard del Bosque 444', '1977-04-16', HASHBYTES('SHA2_256', 'password17')),
('Isabel Castro', 90123457, 'Calle de los Andes 555', '1984-09-25', HASHBYTES('SHA2_256', 'password18')),
('Andrés Moreno', 12345670, 'Avenida del Valle 666', '1986-12-05', HASHBYTES('SHA2_256', 'password19')),
('Lucía Vega', 23456781, 'Camino de la Montaña 777', '1990-08-15', HASHBYTES('SHA2_256', 'password20'));
GO

-- Crear la tabla CDtipoBien
CREATE TABLE CDtipoBien (
    Cod_tipo INT PRIMARY KEY IDENTITY(1,1),
    Descripcion NVARCHAR(10) NOT NULL
);
GO

-- Insertar valores en CDtipoBien
INSERT INTO CDtipoBien (Descripcion) VALUES ('Inmueble');
INSERT INTO CDtipoBien (Descripcion) VALUES ('Automotor');
GO

-- Crear la tabla Bien
CREATE TABLE Bien (
    Idbien INT PRIMARY KEY IDENTITY(1,1), -- Identificador del bien
    Tipo INT FOREIGN KEY REFERENCES CDtipoBien(Cod_tipo), --puede ser tipo 1 inmuebles o 2 automotor
    Direccion NVARCHAR(50) NULL,
    Superficie DECIMAL(10, 2) NULL,
    Nomenclatura_catastral NVARCHAR(15) NULL,
    Marca NVARCHAR(50) NULL,
    Modelo NVARCHAR(50) NULL,
    Anio INT NULL,
    Patente NVARCHAR(15) NULL
);
GO

INSERT INTO Bien (Tipo, Direccion, Superficie, Nomenclatura_catastral)
VALUES 
(1, 'Calle 11', 120.50, 'NOM001'),
(1, 'Calle 12', 130.00, 'NOM002'),
(1, 'Calle 13', 90.75, 'NOM003'),
(1, 'Calle 14', 85.30, 'NOM004'),
(1, 'Calle 15', 150.00, 'NOM005');
GO

-- Insertar 5 registros para automotores en la tabla Bien
INSERT INTO Bien (Tipo, Marca, Modelo, Anio, Patente)
VALUES 
(2, 'Toyota', 'Camry', 2021, 'PAT001'),
(2, 'Honda', 'Accord', 2020, 'PAT002'),
(2, 'Ford', 'Mustang', 2019, 'PAT003'),
(2, 'Chevrolet', 'Malibu', 2018, 'PAT004'),
(2, 'Nissan', 'Altima', 2017, 'PAT005');
GO


-- Crear la tabla CDCuotaestado
CREATE TABLE CDCuotaestado (
    Id_estado INT PRIMARY KEY IDENTITY(1,1),
    Descripcion NVARCHAR(15)
);
GO

-- Crear la tabla Cuota
CREATE TABLE Cuota (
    Idcuota INT PRIMARY KEY IDENTITY(1,1),
    Id_bien INT FOREIGN KEY REFERENCES Bien(Idbien),
    Monto DECIMAL(10, 2),
    Fecha_vencimiento DATE,
    CodEstado INT FOREIGN KEY REFERENCES CDCuotaestado(Id_estado)
);
GO

-- Crear la tabla Pagos
CREATE TABLE Pagos (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Id_cuota INT FOREIGN KEY REFERENCES Cuota(Idcuota),
    Fecha_pago DATE,
    Monto_pagado DECIMAL(10, 2)
);
GO

-- Crear la tabla BienesPropietarios
CREATE TABLE BienesPropietarios (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Idbien INT FOREIGN KEY REFERENCES Bien(Idbien),
    Id_Propietario INT FOREIGN KEY REFERENCES Propietario(IDPropietario),
    Porcentaje_propiedad DECIMAL(5, 2)
);
GO

-- Crear la tabla PagosPropietarios
CREATE TABLE PagosPropietarios (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Id_pago INT FOREIGN KEY REFERENCES Pagos(Id),
    Id_propietario INT FOREIGN KEY REFERENCES Propietario(IDPropietario),
    Id_bien INT FOREIGN KEY REFERENCES Bien(Idbien),
    MontoPagado DECIMAL(10, 2)
);
GO

-- Insertar 10 registros ficticios en la tabla Bien para Automotores
INSERT INTO Bien (Tipo, Marca, Modelo, Anio, Patente) VALUES (2, 'Toyota', 'Corolla', 2015, 'KKK111');
INSERT INTO Bien (Tipo, Marca, Modelo, Anio, Patente) VALUES (2, 'Honda', 'Civic', 2018, 'LLL222');
INSERT INTO Bien (Tipo, Marca, Modelo, Anio, Patente) VALUES (2, 'Ford', 'Focus', 2016, 'MMM333');
INSERT INTO Bien (Tipo, Marca, Modelo, Anio, Patente) VALUES (2, 'Chevrolet', 'Cruze', 2017, 'NNN444');
INSERT INTO Bien (Tipo, Marca, Modelo, Anio, Patente) VALUES (2, 'Volkswagen', 'Golf', 2019, 'OOO555');
INSERT INTO Bien (Tipo, Marca, Modelo, Anio, Patente) VALUES (2, 'Nissan', 'Sentra', 2015, 'PPP666');

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

