CREATE database DDCrudAngular
go

use DDCrudAngular

create table empleado (IdEmpleado int primary key identity,
NombreCompleto varchar(50),
Correo varchar(50),
Sueldo decimal (10,2),
FechaContrato date )

GO

Insert into empleado (NombreCompleto, Correo,Sueldo,FechaContrato)
values
('Maria Mendez', 'Maria@gmail.com',4500,'2024-01-12')

select * from empleado

--listar empleados

create proc sp_listaEmpleados 
as
begin

	select

	IdEmpleado,
	NombreCompleto,
	Correo,
	Sueldo,
	CONVERT(char(10), FechaContrato,103)[FechaContrato]
	from empleado
end
go

--obtener un empleado

create proc sp_obtenerEmpleado(
@IdEmpleado int
)
as
begin

	select

	IdEmpleado,
	NombreCompleto,
	Correo,
	Sueldo,
	CONVERT(char(10), FechaContrato,103)[FechaContrato]
	from empleado where IdEmpleado = @IdEmpleado
end

go

--Crear un empleado
create proc sp_CrearEmpleado(
@NombreCompleto varchar(50),
@Correo varchar(50),
@sueldo decimal(10,2),
@FechaContrato varchar(10)
)
as
begin
	Insert into empleado (
	NombreCompleto,
	Correo,
	Sueldo,
	FechaContrato)
	values
	(@NombreCompleto,
	@Correo,
	@sueldo,
	convert(date, @FechaContrato)
	)
	
end


--Actualizar un empleado

create proc sp_ActualizarEmpleado(
@IdEmpleado int,
@NombreCompleto varchar(50),
@Correo varchar(50),
@sueldo decimal(10,2),
@FechaContrato varchar(10)
)
as
begin
	update empleado 
	set
	NombreCompleto = @NombreCompleto,
	Correo = @Correo ,
	Sueldo = @sueldo,
	FechaContrato = convert(date, @FechaContrato)
	 where IdEmpleado = @IdEmpleado
	
end


--Eliminar empleado

create proc sp_EliminarEmpleado(
@IdEmpleado int

)
as
begin
	delete from empleado where IdEmpleado = @IdEmpleado
	
end


