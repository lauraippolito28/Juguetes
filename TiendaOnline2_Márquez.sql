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
foreign key (idPoductoFK)
references Producto(idProducto);

alter table Producto_Venta
add constraint FKOrden
foreign key (idOrdenFK)
references Orden(idOrden);

/*Punto 5*/
describe Venta;
describe Cliente_To;
select * from Usuario;
select * from Producto;
select * from Venta;
select * from Cliente_TO;

insert into Cliente_TO values('',1111112,'Luna',31056894,'Marzo'),(1,1111113,'Sofía',31056857,'Abril'),(2,11111879,'Diego',31057684,'Junio'),(3,1111114,'Camilo',31083684,'Julio');
insert into Producto_O values('',1569,'Chaqueta azul',65.000),(11,6895,'Silla reclinable',186.000),(22,6384,'Libro de colorear',16.000),(33,0935,'Caja Chicles',3.200);
insert into Usuario values('',659843,'Cajero',4,1),(111,364859,'Personal Bodega',2,6),(112,659843,'Cajero',6,3),(113,959334,'Administrador',1,9);
insert into Venta values(1,111,1,11,65.000,'Octubre'),(2,113,4,33,186.000,'Febrero');

/*Punto 6*/

select * from Producto_O;

/*25/8*/

select sum(totalVenta) from Venta;
select avg(precio) from Producto;

select * from Venta inner join Cliente on Venta.idCliente_TO=Cliente.idCliente_TO;

select p.*,c.nombreCliente, v.max(precio)
from Precio p
inner join cliente c on p,idPrecio = c. idPrecioFK;

/*Consultar el cliente de la máxima venta hecha*/
select c.*, nombreCliente_TO, Venta.idCliente_TOFK, Producto_Venta.totalVentaFK
from orden
inner join Cliente_TO on Cliente_TO.idCliente_TO = venta.Cliente_TOFK
inner join Producto_Venta on venta.idVenta = Producto_Venta.idVentaFK
where total = max(total)

/*Consultar el usuario y cliente de una venta específica*/
select Cliente_TO.nombreCliente_TO, Venta.idCliente_TOFK, Usuario.nombreUsuario
fom Venta
join Cliente_TO on Cliente_TO.idCliente_TO = Venta.idCliente_TOfk
join Usuario on Usuario.idUsuario = Venta.idUsuariofk
whwere Venta.idVenta = 111;

/*Consultar los productos que compró un cliente específico*/
select Producto.nombreProducto, Producto_Venta.cantidad, Producto_Venta.totalVenta
from Producto_Venta
join Venta on Producto_Venta.idVentaFK = Venta.idVenta
join Producto on Producto_Venta.idProductoFK = Producto.idProducto
where Venta.idCliente = 111;

/*Consultar todos los clientes que han hecho compras*/
select Cliente_TO.nombreCliente
from Cliente_TO
join Venta on Cliente_TO.idCliente_TO = Venta.idCliente_TO
