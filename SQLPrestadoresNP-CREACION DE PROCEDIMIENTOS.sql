go
use PrestadoresNP
go
--************************ VALIDAMOS SI EXISTE EL PROCEDIMIENTO ************************--

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'usp_registrar')
DROP PROCEDURE usp_registrar

go

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'usp_modificar')
DROP PROCEDURE usp_modificar

go

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'usp_obtener')
DROP PROCEDURE usp_obtener

go

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'usp_listar')
DROP PROCEDURE usp_obtener

go

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'usp_eliminar')
DROP PROCEDURE usp_eliminar

go

--************************ PROCEDIMIENTOS PARA CREAR ************************

/*PROCEDIMIENTO PARA REGISTRAR UN PRESTADOR POR ID*/
create procedure usp_registrar(

@nombres varchar(50),
@telefono varchar(100),
@direccion varchar(100),
@localidad int,
@especialidad int

)

as
begin

insert into Prestadores(Nombre, Numero, Direccion, id_localidad, id_especialidad)
values
(
@nombres,
@telefono,
@direccion,
@localidad,
@especialidad 

)

end


go

create procedure usp_modificar(
@idmedico int,
@nombres varchar(50),
@telefono varchar(100),
@direccion varchar(100),
@localidad int,
@especialidad int
)
as
begin

update Prestadores set 
Nombre = @nombres,
Numero = @telefono,
Direccion = @direccion,
id_localidad = @localidad
where ID_Medico = @idmedico

end

go

/*PROCEDIMIENTO PARA OBTENER UN PRESTADOR POR ID*/
create procedure usp_obtener(@idmedico int)
as
begin

select * from Prestadores where ID_Medico = @idmedico
end

go
/*PROCEDIMIENTO PARA LISTAR TODOS*/
create procedure usp_listar
as
begin

select * from Prestadores
end


go

go

create procedure usp_eliminar(
@idmedico int
)
as
begin

delete from Prestadores where ID_Medico = @idmedico

end

go