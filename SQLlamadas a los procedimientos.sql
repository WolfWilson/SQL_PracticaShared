-- Llamados a procedimientos de inserción

-- Insertar Propietario
EXEC InsertarPropietario 'Nombre', 'Apellido', '12345678', 'Dirección', '1990-01-01', HASHBYTES('SHA2_256', 'contraseña');

-- Insertar Bien
EXEC InsertarBien 'Inmueble', 'Dirección', 100.00, 'Nomenclatura', NULL, NULL, NULL, NULL;

-- Insertar Pago
EXEC InsertarPago @IdCuota = 1, @FechaPago = '2024-06-28', @MontoPagado = 500.00;

-- Insertar Cuota
EXEC InsertarCuota @IdBien = 1, @Monto = 1000.00, @FechaVencimiento = '2024-07-01', @CodEstado = 1;

-- Llamados a procedimientos de consultas

-- Consultar Bienes
EXEC ConsultarBienes;

-- Consultar Propietarios
EXEC ConsultarPropietarios;

-- Consultar Bienes por Propietario
EXEC ConsultarBienesPorPropietarios


-- Consultar Cuotas Impagas
EXEC ConsultarCuotasImpagas;

-- Consultar Pagos Realizados
EXEC ConsultarPagosRealizados;

-- Llamados a procedimientos de eliminación

-- Borrar Propietario
EXEC BorrarPropietario @IDPropietario = 1;

-- Borrar Bien
EXEC BorrarBien @Idbien = 1;

-- Borrar Cuota
EXEC BorrarCuota @Idcuota = 1;

-- Borrar Pago
EXEC BorrarPago @Id = 1;

-- Llamado al procedimiento BorrarPropietario
EXEC BorrarPropietario @IDPropietario = 1;

-- Llamado al procedimiento BorrarBien
EXEC BorrarBien @Idbien = 1;

-- Llamado al procedimiento BorrarCuota
EXEC BorrarCuota @Idcuota = 1;

-- Llamado al procedimiento BorrarPago
EXEC BorrarPago @Id = 1;

-- Llamado al procedimiento de relacionar bienes con propietarios
EXEC RelacionarBienPropietario @IdBien = 1, @IdPropietario = 1, @PorcentajePropiedad = 50.0;
