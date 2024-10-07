create database tiendaOnline; 
use tiendaOnline; 

/*Punto 1*/
create table Cliente_(
idCliente int primary key, 
cedulaCliente varchar(20),
nombreCliente varchar(15),
telefonoCliente int,
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
idClienteFK int,
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

/*Punto 2*/
alter table Venta
add constraint FKVentaCliente
foreign key (idClienteFK)
references Cliente(idCliente);

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
describe Cliente;
describe Producto;
select * from Usuario;
select * from Producto;
select * from Venta;
select * from Cliente;

insert into Cliente values('',111234,'Laura',3138579707,'Mayo'),(1,11112345,'Ana',31056857,'Noviembre'),(2,1112346,'Juan',31057684,'Diciembre'),(3,1111114,'Juana',31083684,'Octubre');
insert into Producto values(01,1369,' Medias',6,30.000),(11,6895,'Silla de madera',25,90.000),(22,6385,'Enciclopedia',21,56.000),(33,0935,'Bloqueador',110,56.000);
insert into Usuario values('',659843,'Cajero',4,1),(111,364859,'Personal',2,6),(112,659843,'Limpieza',6,3),(113,959334,'Administrador',1,9);
insert into Venta values('',100,111,1,6385,90.000,'6-marzo'),(56,100,111,1,6385,90.000,'6-marzo');

/*Punto 6*/
select * from Producto;

/*25/8*/
select sum(totalVenta) from Venta;
select avg(precioporProducto) from Producto;
select * from Venta inner join Cliente on Venta.idClienteFK=Cliente.idCliente;
DESCRIBE Cliente;
select p.*,c.nombreCliente, v.max(precioporProducto)
from Precio.p
inner join cliente c on p.idPrecio=c.idPrecioFK;

/*Consultar el cliente de la máxima venta hecha*/
select c.*, nombreCliente, Venta.idClienteFK, Producto_Venta.totalVentaFK
from orden
inner join Cliente on Cliente.idCliente = venta.ClienteFK
inner join Producto_Venta on venta.idVenta = Producto_Venta.idVentaFK
where total = max(total);

/*Consultar el usuario y cliente de una venta específica*/
select Cliente.nombreCliente, Venta.idClienteFK, Usuario.nombreUsuario
fRom Venta
join Cliente on Cliente.idCliente = Venta.idClientefk
join Usuario on Usuario.idUsuario = Venta.idUsuariofk
where Venta.idVenta = 111;

/*Consultar los productos que compró un cliente específico*/
select Producto.nombreProducto, Producto_Venta.cantidad, Producto_Venta.totalVenta
from Producto_Venta
join Venta on Producto_Venta.idVentaFK = Venta.idVenta
join Producto on Producto_Venta.idProductoFK = Producto.idProducto
where Venta.idCliente = 111;

/*Consultar todos los clientes que han hecho compras*/
select Cliente.nombreCliente
from Cliente
join Venta on Cliente.idCliente = Venta.idCliente;

/*27-9*/
insert into Cliente values(4,1111812,'Tatiana',310846894,'Agosto');
insert into Producto values(44,8765,'Ropa bebé',8,40.000);
insert into Usuario values(114,959334,'Laura Administradora',1,1);
insert into Venta values(49,161,114,4,8759,40.000,'25-septiembre');

describe Venta;
update Cliente set nombreCliente='Tatiana Cabrera Vargas' where idCliente=4;
update Cliente set fechaNacimiento='24/11/1985' where idCliente=4;
update Cliente set telefonoCliente=3144606978 where idCliente=4;
update Cliente set telefonoCliente=3144606978 where idCliente=4;
insert into Cliente values(55163118,1111812,'Tatiana Cabrera Vargas',3144606978,24/11/24);

select * from Producto;
select * from venta;

update Venta set idClienteFK=55163118 where idVenta=49;
delete from Cliente where idCliente=4;

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

create view consultarCliente as 
select * from Cliente;

select * from consultarCliente;

/*Tarea modificar prodedimientos*/

/*1.Inactivar un cliente*/
alter table Cliente;

/*2. Consultar los productos que ha comprado un cliente*/
select Producto.nombreProducto, Producto_Venta.cantidad, Producto_Venta.totalVentaFK
from Producto_Venta
join Venta on Producto_Venta.idVentaFK = Venta.idVenta
join Producto on Producto_Venta.idProductoFK = Producto.idProducto
where Venta.idCliente = 111;
select * from Producto;

/*3. Modificar la fecha de nacimiento de Cliente*/
update Cliente set fechaNacimiento=18/03/1996 where idCliente=4;


/*Crear:*/

/*1. Que cliente compró un producto y cual fue su número de orden*/
delimiter //
create procedure registrarProducto(idProducto int, codigoBarrasProducto varchar(50),nombreProducto varchar(50),cantidadProducto int, precioporProducto float)
begin 
insert into Producto values (idProducto,codigoBarrasProducto,nombreProducto,cantidadProducto,precioporProducto);
end//
delimiter ;

/*2. Lista que muestre el cliente que más compras haya hecho*/
delimiter //
create procedure registrarProducto(idProducto int, codigoBarrasProducto varchar(50),nombreProducto varchar(50),cantidadProducto int, precioporProducto float)
begin 
insert into Producto values (idProducto,codigoBarrasProducto,nombreProducto,cantidadProducto,precioporProducto);
end//
delimiter ;
call registrarProducto(55,'34985','Chicles',25,4000);
describe producto;
select * from Producto;

/*Subconsultas: consultas anidadas dentro de otra consulta
select campo2, campo3 from tablaGrande
where campo2 = (select columnsa2x from tablaPequeña where condición);*/

/* Consultar los datos de los empleados ys su sueldo promedio */
select nombreEmpleado, idEmpleado, salarioEmpleado, (select avg(salario) from empleado) as promedio from empleado;

/* Consultar empleado con salario mayor que el promedio*/
select nombreEmpleado, idEmpleado, salarioEmpleado from empleado where salarioEmpleado>(select avg(salario) from empleado);

/* Consultar el area a la que pertenece un empleado*/
select nombreEmpleado, idEmpleado, idArea, nombreArea from empleado where idArea in (select idArea from area where nombreEmpleado='Laura');

/*Consultar los productos que se vendan a un precio mayor que el del promedio*/
select nombreProducto, idProducto, precioporProducto from Producto where precioporProducto>(select avg(precioporProducto) from Producto);
select * from producto;

/*Mostrar los clientes que el total de compra sea mayor que el del promedio*/
select nombreCliente, idCliente from Cliente where salarioEmpleado>(select avg(salario) from empleado);