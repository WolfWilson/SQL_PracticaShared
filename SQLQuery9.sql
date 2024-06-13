-- Insertar 10 registros en la tabla Cuota
INSERT INTO Cuota (Id_bien, Monto, Fecha_vencimiento, CodEstado)
VALUES 
(1, 1000.00, '2023-01-10', 2),
(2, 1500.50, '2023-02-15', 2),
(3, 1200.75, '2023-03-20', 2),
(4, 1800.00, '2023-04-25', 2),
(5, 1300.25, '2023-05-30', 2),
(6, 1100.50, '2023-06-10', 2),
(7, 1600.75, '2023-07-15', 2),
(8, 1400.00, '2023-08-20', 2),
(9, 1700.25, '2023-09-25', 2),
(10, 1900.50, '2023-10-30', 2);
GO
SELECT * FROM Bien WHERE Idbien BETWEEN 1 AND 10;
