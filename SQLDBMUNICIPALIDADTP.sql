-- Usar la base de datos
USE Municipalidad;
GO

-- Crear tabla Propietario
CREATE TABLE Propietario (
    IDPropietario INT IDENTITY(1,1) PRIMARY KEY,
    ApeyNombre NVARCHAR(50) NOT NULL,
    Numdoc INT NOT NULL,
    Direccion NVARCHAR(50) NOT NULL,
    Fechanac DATE NOT NULL UNIQUE,
    Clavedeacceso NVARCHAR(50) NOT NULL -- Encriptada
);
GO

-- Crear tabla Bien
CREATE TABLE Bien (
    Cod_tipobien INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion NVARCHAR(15) NOT NULL
);
GO

-- Crear tabla Automotor
CREATE TABLE Automotor (
    Idauto INT IDENTITY(1,1) PRIMARY KEY,
    Id_bien INT FOREIGN KEY REFERENCES Bien(Cod_tipobien),
    Cod_tipo_bien INT FOREIGN KEY REFERENCES Cdtipoautomotor(Cod_tipo),
    Marca NVARCHAR(50) NOT NULL,
    Modelo NVARCHAR(50) NOT NULL,
    Anio INT NOT NULL,
    Patente NVARCHAR(10) NOT NULL UNIQUE
);
GO

-- Crear tabla Inmueble
CREATE TABLE Inmueble (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Id_bien INT FOREIGN KEY REFERENCES Bien(Cod_tipobien),
    Cod_tipo INT FOREIGN KEY REFERENCES Cdtipoinmueble(Cod_tipo),
    Direccion NVARCHAR(100) NOT NULL,
    Superficie DECIMAL(10, 2) NOT NULL,
    Nomenclatura_catastral NVARCHAR(50) NOT NULL UNIQUE
);
GO

-- Crear tabla Cdtipoinmueble
CREATE TABLE Cdtipoinmueble (
    Cod_tipo INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion NVARCHAR(20) NOT NULL
);
GO

-- Crear tabla Cdtipoautomotor
CREATE TABLE Cdtipoautomotor (
    Cod_tipo INT IDENTITY(1,1) PRIMARY KEY,
    Descripcion NVARCHAR(20) NOT NULL
);
GO

-- Crear tabla Cuota
CREATE TABLE Cuota (
    Idcuota INT IDENTITY(1,1) PRIMARY KEY,
    Id_bien INT FOREIGN KEY REFERENCES Bien(Cod_tipobien),
    Monto DECIMAL(10, 2) NOT NULL,
    Fecha_vencimiento DATE NOT NULL,
    Estado NVARCHAR(50) NOT NULL
);
GO

-- Crear tabla Pagos
CREATE TABLE Pagos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Id_cuota INT FOREIGN KEY REFERENCES Cuota(Idcuota),
    Fecha_pago DATE NOT NULL,
    Monto_pagado DECIMAL(10, 2) NOT NULL
);
GO

-- Crear tabla BienesPropietarios
CREATE TABLE BienesPropietarios (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Idbien INT FOREIGN KEY REFERENCES Bien(Cod_tipobien),
    Id_Propietario INT FOREIGN KEY REFERENCES Propietario(IDPropietario),
    Porcentaje_propiedad DECIMAL(5, 2) NOT NULL
);
GO

-- Crear tabla PagosPropietarios
CREATE TABLE PagosPropietarios (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Id_pago INT FOREIGN KEY REFERENCES Pagos(Id),
    Id_propietario INT FOREIGN KEY REFERENCES Propietario(IDPropietario),
    Id_bien INT FOREIGN KEY REFERENCES Bien(Cod_tipobien),
    MontoPagado DECIMAL(10, 2) NOT NULL
);
GO
