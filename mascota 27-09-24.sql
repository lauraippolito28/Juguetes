create database mascotas;
use mascotas;
create table Cliente(
cedulaCliente int (11) primary key, 
nombreCliente varchar (15),
apellidoCliente varchar(15), 
direccionCliente varchar (10),
telefono int(10),
idMascotaFK int (11) not null
);

CREATE TABLE Producto (
    codigoProducto int(11) PRIMARY KEY,
    nombreProducto varchar(15),
    marca varchar(15),
    precio float, 
    cedulaClienteFK int(11) NOT NULL
);
ALTER TABLE Producto
ADD cantidad int NOT NULL;

create table Usuario(
idUsuario int primary key, 
cedulaUsuario int,
rolUsuario varchar(15), 
idVentaFK varchar(15),
cantidad int
);

create table Mascota (
idMascota int (11) primary key, 
nombreMascota varchar(15), 
generoMascota varchar(15),
razaMascota varchar(15), 
cantidad int(10)
);
alter table Mascota 
change column cantidad cantidadMascota int(10) not null;

create table Vacuna (
codigoVacuna int(11) primary key, 
nombreVacuna varchar (15), 
dosisVacuna int (10), 
enfermedad varchar(15)
); 

create table Mascota_Vacuna (
codigoVacunaFK int (11),
idMascotaFK int (11), 
enfermedad varchar (15)
);
ALTER TABLE Mascota_Vacuna RENAME TO Detalle_Vacuna;

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

alter table Cliente 
add constraint FKMascotaCliente 
foreign key (idMascotaFK)
references Mascota(idMascota);

alter table Producto 
add constraint FKClienteProducto 
foreign key (cedulaClienteFK)
references Cliente(cedulaCliente);

alter table Mascota_Vacuna 
add constraint FKVacunaDetalle_Vacuna
foreign key (codigoVacunaFK)
references Vacuna(codigoVacuna);

alter table Mascota_Vacuna 
add constraint FKMascotaDetalle_Vacuna
foreign key (idMascotaFK)
references Mascota(idMascota);

/*CRUD (Insert, Select, Update, Delete)*/
describe Mascota; 
select * from Mascota;
insert into Mascota values(1, 'Rusth', 'M', 'Criollo', 1);
insert into Mascota values(2, 'Macarena', 'F', 'Criollo', 1), (3, 'Frido', 'M', 'Criollo', 1);
insert into Mascota values(4, '', '', '', 1); 
select nombreMascota, razaMascota from Mascota; 
select nombreMascota as 'Nombre', razaMascota as 'Raza' from Mascota; 

describe Cliente; 
select * from Cliente;
insert into Cliente values(53168, 'Luna', 'Perez', 'Chia', 2147483647, 1);
insert into Cliente values(123456, 'Laura', 'Marquez', 'Chia', 3124574, 2);
insert into Cliente values(482996, 'Tatiana', 'Cabrera', 'Barrio', 3554296, 2);
select nombreCliente as 'Nombre', cedulaCliente as 'Identificación', idMascotaFK as 'Código Mascota' from Cliente order by nombreCliente asc; 

describe Producto; 
select cedulaCliente as 'Documento', direccionCliente as 'Dirección' from Cliente; 
select * from Producto;
insert into Producto values(1, 'Shampoo', 'Pets', 10500, 53168, 2);
insert into Producto values(2, 'Acondicionador', 'Pets', 9500, 53168, 2);
insert into Producto values(3, 'Ropa Bebé', 'Pepe Ganga', 445, 482996, 2);
select nombreProducto as 'Nombre', codigoProducto as 'Código' from Producto; 
select nombreProducto as 'Nombre', marca as 'Marca' from Producto order by precio desc;

describe Vacuna; 
select * from Vacuna;
insert into Vacuna values(12345, 'Contra Rabia', 2, 'Rabia');
insert into Vacuna values(12346, 'Moquillo canino', 2, 'Moquillo');
select nombreVacuna as 'Nombre', dosisVacuna as 'Dosis' from Vacuna; 

describe Detalle_Vacuna; 
select * from Detalle_Vacuna;
insert into Detalle_Vacuna values(12345, 1, 'Rabia');
insert into Detalle_Vacuna values(12346, 3, 'Rabia');

describe Venta;
select * from Venta;
insert into Venta values('',100,111,1,6384,65.000,'3-octubre'),(56,100,111,1,6384,65.000,'3-octubre');
select nombreProducto from Producto where precio >= 300; 
select enfermedad from Detalle_Vacuna where codigoVacunaFK = 1; 
select nombreProducto from Producto where precio >= 10500 and codigoProducto > 2; 
                                                                                 
select nombreMascota as 'Nombre' from Mascota where razaMascota = 'Criollo';
select  codigoVacuna as 'Código'from Vacuna where enfermedad = 'Rabia'; 
select idMascotaFK as 'identificación mascota' from Cliente where direccionCliente = 'Chia'; 
select nombreProducto from Producto where precio between 1000 and 100000; 

/* TAREA: hacer dos busquedas en cada tabla*/
/* Tabla Mascota */
select nombreMascota as 'Nombre', generoMascota as 'Género' from Mascota where generoMascota = 'M'; 
select nombreMascota as 'Nombre', razaMascota as 'Raza' from Mascota where razaMascota = 'Criollo';

/* Tabla Cliente */
select nombreCliente as 'Nombre', direccionCliente as 'Dirección' from Cliente where idMascotaFK IN (select idMascotaFK from Cliente group by idMascotaFK having count (idMascotaFK) > 1);
select nombreCliente as 'Nombre', telefono as 'Teléfono' from Cliente where telefono = 3124574; 

/* Tabla Producto */
select nombreProducto as 'Nombre', precio as 'Precio' from Producto where precio > 10000;
select nombreProducto as 'Nombre', cantidad as 'Cantidad' from Producto order by cantidad desc; 

/* Tabla Vacuna */
select nombreVacuna as 'Nombre', dosisVacuna as 'Dósis' from Vacuna where dosisVacuna > 1;
select nombreVacuna as 'Nombre', enfermedad as 'Enfermedad' from Vacuna order by enfermedad asc;

/* Tabla Detalle_Vacuna */
select enfermedad from Detalle_Vacuna where idMascotaFK = 1;
select codigoVacunaFK as 'Código de Vacunación' from Detalle_Vacuna where enfermedad = 'Moquillo';

select avg(precio) from Producto;
select count(nombreProducto) from Producto; 
select sum(cantidad) from Mascota; 
select sum(precio) from Producto; 
select cedulaClienteFK, max(precio) from Venta; 

/*INNER JOY*/
select * from Venta inner join CLiente on Venta.idClienteFK = Cliente.idCliente;
select m.*, c.nombreCliente, p.nombreProducto
from Mascota m 
inner join cliente c on m.idMascota=c.idMascotaFK
inner join producto p on p.cedulaClienteFK = pendiente***; 

/*ACTIVIDAD 25-09-24: 
1. CONSULTAR EL CLIENTE DE LA MÁXIMA VENTA HECHA
2. CONSULTAR USUARIO Y CLIENTE DE UNA VENTA
3. CONSULTAR LOS PRODUCTOS QUE COMPRÓ UN CLIENTE ESPECÍFICO
4. CONSULTAR TODOS LOS CLIENTES QUE HAN HECHO COMPRAS*/

select sum(totalVenta) from Venta;
select avg(precioporProducto) from Producto;
select * from Venta inner join Cliente on Venta.idCliente =Cliente.idCliente;

select p.*,c.nombreCliente, v.max(precio)
from Precio p
inner join cliente c on p.idPrecio=c.idPrecioFK;

/*Consultar el cliente de la máxima venta hecha*/
select c.*, nombreCliente, Venta.idClienteFK, Producto_Venta.totalVentaFK
from orden
inner join Cliente on Cliente.idCliente = venta.ClienteFK
inner join Producto_Venta on venta.idVenta = Producto_Venta.idVentaFK
where total = max(total);

/*Consultar el usuario y cliente de una venta específica*/
select Cliente.nombreCliente, Venta.idClienteFK, Usuario.nombreUsuario
from Venta
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
describe Cliente;
describe Venta; 
select * from Cliente;
select * from Venta;
/* 27 - 09 - 24*/
insert into Cliente values(43357, 'Tatiana','Cabrera', 'chia', 31446432, 2);
insert into Producto values(44, 'Ropa Bebe', 'Ganga', 50.000, 43357, 3);
insert into Usuario values(114, 345678,'Laura Admin', 1, 1);
insert into Venta values(50.000, 43357, 'Ropa Bebe');
insert into Cliente values(55163118, 'Tatiana','Cabrera', 'cll104#13-14', 3144606918, 2);

update Venta set cedulaClienteFK = 55163118 where idVenta = 3; 
delete from Cliente where cedulaCliente = 3;
