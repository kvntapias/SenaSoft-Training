
create database RODAMIENTOS_PULIDOS;
use RODAMIENTOS_PULIDOS;


create table Rol(
	idRol int not null IDENTITY primary key,
	nombre_rol varchar(20) not null
);

create procedure ListarRoles
as begin
select *from Rol;
end

/*semillas */
insert into Rol (nombre_rol) values ('Gerente');
insert into Rol (nombre_rol) values ('Supervisor');
insert into Rol (nombre_rol) values ('Secretaria');
insert into Rol (nombre_rol) values ('Auxiliar');
insert into Rol (nombre_rol) values ('Tecnico');
select *from Rol;

create table Empleado(
	idEmpleado int  IDENTITY PRIMARY KEY,
	tipo_documento varchar(10) not null,
	num_documento varchar(10) not null,
	nombres varchar(50) not null,
	apellidos varchar(50) not null,
	sexo varchar(10) not null,
	edad varchar(50) not null,
	usuario varchar(50) not null,
	contraseña varchar(50) not null,
	Idrol int,
	foreign key (IdRol) references Rol (idRol)
);

/*CRUD EMPLEADO*/
create procedure insert_empleado(
@tipo_documento varchar(10),
@num_documento varchar(10),
@nombres varchar(50),
@apellidos varchar(50),
@sexo varchar(10),
@edad varchar(50),
@usuario varchar(50),
@contraseña varchar(50),
@idRol int)
as begin 
insert into Empleado(tipo_documento, num_documento, nombres, apellidos, sexo, edad,usuario,contraseña,Idrol) 
values (@tipo_documento, @num_documento, @nombres, @apellidos,@sexo,@edad,@usuario,@contraseña, @idRol);
END

EXEC insert_empleado 'CC','1020494820','Kevin Leonardo','Tapias Parra','M','18','KVN', '123', 1;
EXEC update_empleado 1, 'CC','1020494820','Kevin leo','Tapias Parra','M','18','KVN', '123', 1;
EXEC read_empleado;
EXEC delete_empleado 1;
EXEC loginEmpleado 'KVN','123', 1;

alter procedure loginEmpleado(@usuario varchar(50) , @contraseña varchar(50), @idRol int)
as begin
select nombres, Idrol from Empleado where usuario = @usuario and contraseña = @contraseña and Idrol= @idRol;
end

create procedure update_empleado(
@idEmpleado int,
@tipo_documento varchar(10),
@num_documento varchar(10),
@nombres varchar(50),
@apellidos varchar(50),
@sexo varchar(10),
@edad varchar(50),
@usuario varchar(50),
@contraseña varchar(50),
@idRol int) 
as begin
update Empleado set 
tipo_documento = @tipo_documento,
num_documento = @num_documento,
nombres = @nombres,
apellidos = @apellidos,
sexo = @sexo,
edad = @edad,
usuario = @usuario,
contraseña = @contraseña,
Idrol = @idRol where idEmpleado = @idEmpleado;
end

create procedure delete_empleado(@idEmpleado int)
as
delete from Empleado where idEmpleado = @idEmpleado; 

create procedure read_empleado
as 
select *from Empleado;


/*TABLA CLIENTE*/
create table Cliente(
	idCliente int identity primary key not  null,
	tipo_documento varchar(10) not null,
	num_documento varchar(10) not null,
	nombres varchar(50) not null,
	apellidos varchar(50) not null,
	sexo varchar(10) not null,
	edad varchar(50) not null,
	estado varchar(20),
);

/*CRUD CLIENTE*/
create procedure insert_cliente(
@tipo_documento varchar(10),
@num_documento varchar(10),
@nombres varchar(50),
@apellidos varchar(50),
@sexo varchar(10),
@edad varchar(50),
@estado varchar(20))
as begin 
insert into Cliente(tipo_documento, num_documento, nombres, apellidos, sexo, edad, estado) 
values (@tipo_documento, @num_documento, @nombres, @apellidos,@sexo,@edad,@estado);
END

create procedure update_cliente(
@idcliente int,
@tipo_documento varchar(10),
@num_documento varchar(10),
@nombres varchar(50),
@apellidos varchar(50),
@sexo varchar(10),
@edad varchar(50),
@estado varchar(20)) 
as begin
update Cliente set 
tipo_documento = @tipo_documento,
num_documento = @num_documento,
nombres = @nombres,
apellidos = @apellidos,
sexo = @sexo,
edad = @edad,
estado = @estado
where idCliente = @idcliente;
end

create procedure delete_cliente(@idcliente int)
as
delete from Empleado where idEmpleado = @idcliente; 

create procedure read_cliente
as 
select *from Cliente;


/*TABLA AUTOMOVIL*/
create table Automovil(
	idAutomovil int identity primary key not null,
	placa varchar(10) not null,
	marca varchar(50) not null,
	modelo varchar(10) not null,
	color varchar(20) not null,
	idCliente int,
	foreign key (idCliente) references Cliente(idCliente)
);



/*TABLA TIPOS DE SERVICIO*/
create table tipos_servicio(
	idTipoServicio int identity primary key not null,
	nombre_servicio varchar(50),
	valor_servicio float not null,
	tipo_servicio varchar(50),
);

/*TABLA SERVICIO*/
create table Servicio(
	idServicio int identity primary key not null,
	idEmpleado int,
	idAutomovil int,
	idTipoServicio int,
	tipo_servicio varchar(45) not null,
	confirmado BIT DEFAULT 0,
	estado_pago BIT DEFAULT 'POR PAGAR'
);

