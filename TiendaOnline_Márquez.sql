create database tiendaOnline; /*Punto 1*/
use tiendaOnline; /*Punto 2*/

/*Punto 3*/
create table Cliente_TO(
idCliente_TO int primary key, 
cedulaCliente_TO varchar(20),
nombreCliente_TO varchar(15),
telefonoCliente_TO int,
mesNacimiento varchar (15)
);
create table Producto_O(
idProducto int primary key,
codigoBarrasProducto varchar(15),
nombreProducto varchar(15),
precio float
);
create table Usuario(
idUsuario int primary key, 
cedulaUsuario int,
rolUsuario varchar(15), 
idVentaFK varchar(15),
cantidad int
);
create table Venta(
idVenta int primary key, 
idUsuarioFk int,
idCliente_TOFK int,
idProductoFK int, 
totalVenta varchar(15), 
mesVenta varchar(15)
);
create table Producto_Venta(
codigoBarrasProductoFK int,
cedulaClienteFK int,
totalVentaFK int
);

/*Punto 4*/
alter table Venta
add constraint FKVentaCliente_TO
foreign key (idCliente_TOFK)
references Cliente_TO(idCliente_TO);

alter table Venta
add constraint FKVentaUsuario
foreign key (idUsuarioFK)
references Usuario(idUsuario);

alter table Producto_Venta
add constraint FKVentaUsuario
foreign key (idVentaFK)
references Venta(idVenta);

/*Punto 5*/
describe Venta;
describe Cliente_To;
select * from Usuario;

insert into Cliente_TO values('',1111112,'Luna',31056894,'Marzo'),(1,1111113,'Sofía',31056857,'Abril'),(2,11111879,'Diego',31057684,'Junio'),(3,1111114,'Camilo',31083684,'Julio');
insert into Producto_O values('',1569,'Chaqueta azul',65.000),(11,6895,'Silla reclinable',186.000),(22,6384,'Libro de colorear',16.000),(33,0935,'Caja Chicles',3.200);
insert into Usuario values('',659843,'Cajero',4,1),(111,364859,'Personal Bodega',2,6),(112,659843,'Cajero',6,3),(113,959334,'Administrador',1,9);
insert into Venta values(1,111,1,11,65.000,'Octubre'),(2,113,4,33,186.000,'Febrero');
/*Punto 6*/
