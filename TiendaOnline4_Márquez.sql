create database tiendaOnline; /*Punto 1*/
use tiendaOnline; /*Punto 2*/

/*Punto 3*/
create table Cliente_TO(
idCliente_TO int primary key, 
cedulaCliente_TO varchar(20),
nombreCliente_TO varchar(15),
telefonoCliente_TO int,
fechaNacimiento date
);
create table Producto(
idProducto int primary key,
codigoBarrasProducto varchar(15),
nombreProducto varchar(15),
cantidadProducto int,
precioporProducto float
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
numeroOrden varchar(20), 
idUsuarioFK int,
idCliente_TOFK int,
idProductoFK int, 
totalVenta varchar(15), 
fechaVenta varchar(15)
);
create table Producto_Venta(
codigoBarrasProductoFK int,
idVentaFK int,
cantidad int,
cedulaClienteFK int,
idProducto int,
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
add constraint FKProducto
foreign key (idProducto)
references Producto(idProducto);

alter table Producto_Venta
add constraint FKVenta
foreign key (idVentaFK)
references Venta(idVenta);

/*Punto 5*/
describe Venta;
describe Cliente_To;
describe Producto;
select * from Usuario;
select * from Producto;
select * from Venta;
select * from Cliente_TO;

insert into Cliente_TO values('',1111112,'Luna',31056894,'Marzo'),(1,1111113,'Sofía',31056857,'Abril'),(2,11111879,'Diego',31057684,'Junio'),(3,1111114,'Camilo',31083684,'Julio');
insert into Producto values('',1569,'Chaqueta azul',6,65.000),(11,6895,'Silla reclinable',25,186.000),(22,6384,'Libro de colorear',21,16.000),(33,0935,'Caja Chicles',110,3.200);
insert into Usuario values('',659843,'Cajero',4,1),(111,364859,'Personal Bodega',2,6),(112,659843,'Cajero',6,3),(113,959334,'Administrador',1,9);
insert into Venta values('',100,111,1,6384,65.000,'3-octubre'),(56,100,111,1,6384,65.000,'3-octubre');

/*Punto 6*/
select * from Producto;

/*25/8*/
select sum(totalVenta) from Venta;
select avg(precioporProducto) from Producto;
select * from Venta inner join Cliente_TO on Venta.idCliente_TOFK=Cliente_TO.idCliente_TO;
DESCRIBE cLIENTE_TO;
select p.*,c.nombreCliente_TO, v.max(precioporProducto)
from Precio.p
inner join cliente c on p.idPrecio=c.idPrecioFK;

/*Consultar el cliente de la máxima venta hecha*/
select c.*, nombreCliente_TO, Venta.idCliente_TOFK, Producto_Venta.totalVentaFK
from orden
inner join Cliente_TO on Cliente_TO.idCliente_TO = venta.Cliente_TOFK
inner join Producto_Venta on venta.idVenta = Producto_Venta.idVentaFK
where total = max(total);

/*Consultar el usuario y cliente de una venta específica*/
select Cliente_TO.nombreCliente_TO, Venta.idCliente_TOFK, Usuario.nombreUsuario
fRom Venta
join Cliente_TO on Cliente_TO.idCliente_TO = Venta.idCliente_TOfk
join Usuario on Usuario.idUsuario = Venta.idUsuariofk
where Venta.idVenta = 111;

/*Consultar los productos que compró un cliente específico*/
select Producto.nombreProducto, Producto_Venta.cantidad, Producto_Venta.totalVenta
from Producto_Venta
join Venta on Producto_Venta.idVentaFK = Venta.idVenta
join Producto on Producto_Venta.idProductoFK = Producto.idProducto
where Venta.idCliente = 111;

/*Consultar todos los clientes que han hecho compras*/
select Cliente_TO.nombreCliente
from Cliente_TO
join Venta on Cliente_TO.idCliente_TO = Venta.idCliente_TO;

/*27-9*/
insert into Cliente_TO values(4,1111812,'Tatiana',310846894,'Agosto');
insert into Producto values(44,8669,'Coche grande',8,230.000);
insert into Usuario values(114,959334,'Luna Administradora',1,1);
insert into Venta values(49,161,114,4,8669,230.000,'25-septiembre');

describe Venta;
update Cliente_TO set nombreCliente_TO='Tatiana Cabrera Vargas' where idCliente_TO=4;
update Cliente_TO set fechaNacimiento='24/11/1985' where idCliente_TO=4;
update Cliente_TO set telefonoCliente_TO=3144606978 where idCliente_TO=4;
update Cliente_TO set telefonoCliente_TO=3144606978 where idCliente_TO=4;
insert into Cliente_TO values(55163118,1111812,'Tatiana Cabrera Vargas',3144606978,24/11/24);

select * from Producto;
select * from venta;

update Venta set idCliente_TOFK=55163118 where idVenta=49;
delete from Cliente_TO where idCliente_TO=4;

/*Prodecimientos almacenados: Subrutinas para almacenar la información en la base de datos
delimiter; 
create procedure nombre_procedimiento(parametros)
begin
lógica sentencia
end
*/

delimiter //
create procedure registrarProducto(idProducto int, codigoBarrasProducto varchar(50),nombreProducto varchar(50),cantidadProducto int, precioporProducto float)
begin 
insert into Producto values (idProducto,codigoBarrasProducto,nombreProducto,cantidadProducto,precioporProducto);
end//
delimiter ;
call registrarProducto(55,'34435','Sticker',25,3000);
describe producto;
select * from Producto;

delimiter //
create procedure updateProducto(idProducto int, codigoBarrasProducto varchar(50),nombreProducto varchar(50),cantidadProducto int, precioporProducto float)
begin 
update Producto set
nombreProducto=nuevonombre where idProducto=idProducto;
end//
delimiter ;
call updateProducto(55,'34435','Calcomanias',25,3000);
describe producto;
select * from Producto;

create view consultarCliente_TO as 
select * from Cliente_TO;

select * from consultarCliente_TO;

/*Tarea modificar prodedimientos
1.Inactivar un cliente
2. Consultar los productos que ha comprado un cliente
3. Modificar la fecha de nacimiento de Cliente
Crear:
1. Que cliente compróo un producto y cual fue su número de orden
2. Lista que muestre el cliente que más compras haya hecho*/