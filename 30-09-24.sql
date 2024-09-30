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

create table Usuario(
idUsuario int primary key,
cedulaUsuario int,
rolUusario varchar(15),
idVentaFK varchar(15),
cantidad int
);

CREATE TABLE Producto (
    codigoProducto int(11) PRIMARY KEY,
    nombreProducto varchar(15),
    marca varchar(15),
    precio float, 
    cedulaClienteFK int(11) NOT NULL,
    codigoBarras int
);
ALTER TABLE Producto
ADD cantidad int NOT NULL;


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

CREATE TABLE Venta (
    idVenta int(11) PRIMARY KEY, 
    numeroOrden varchar(20) NOT NULL,
    cedulaClienteFK int(11) NOT NULL,  
    codigoProductoFK int(11) NOT NULL,  
    idUsuarioFK int(11) NOT NULL,
    totalVenta DECIMAL(10,2) NOT NULL,  
    fechaVenta DATE NOT NULL            
);
DROP TABLE Venta;

ALTER TABLE Venta
ADD CONSTRAINT FKClienteVenta
FOREIGN KEY (cedulaClienteFK) REFERENCES Cliente(cedulaCliente);

ALTER TABLE Venta
ADD CONSTRAINT FKProductoVenta
FOREIGN KEY (codigoProductoFK) REFERENCES Producto(codigoProducto);

ALTER TABLE Venta
ADD CONSTRAINT FKUsuarioVenta
FOREIGN KEY (idUsuarioFK) REFERENCES Usuario(idUsuario); 


create table Producto_Venta(
codigoBarrasFk int, 
idVentaFK int, 
cantidad int, 
cedulaClienteFK int, 
codigoProductoFK int, 
totalVentaFK int
);
DROP TABLE Producto_Venta;

alter table Producto_Venta 
add constraint FKProductoProducto_Venta
foreign key (codigoProductoFK)
references Producto(codigoProducto);

alter table Producto_Venta 
add constraint FKVentaProducto_Venta
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
select nombreCliente as 'Nombre', cedulaCliente as 'Identificación', idMascotaFK as 'Código Mascota' from Cliente order by nombreCliente asc; 

describe Usuario;
select * FROM Usuario; 
insert into Usuario values(2, 1023082969,'admin', 1, 3);

describe Producto; 
select cedulaCliente as 'Documento', direccionCliente as 'Dirección' from Cliente; 
select * from Producto;
insert into Producto values(1, 'Shampoo', 'Pets', 10500, 53168, 2);
insert into Producto values(2, 'Acondicionador', 'Pets', 9500, 53168, 2);
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

select nombreProducto from Producto where precio >= 300; 
select enfermedad from Detalle_Vacuna where codigoVacunaFK = 1; 
select nombreProducto from Producto where precio >= 10500 and codigoProducto > 2; 
                                                                                 
select nombreMascota as 'Nombre' from Mascota where razaMascota = 'Criollo';
select  codigoVacuna as 'Código'from Vacuna where enfermedad = 'Rabia'; 
select idMascotaFK as 'identificación mascota' from Cliente where direccionCliente = 'Chia'; 
select nombreProducto from Producto where precio between 1000 and 100000; 

describe Venta; 
select * from Venta;
insert into Venta values(1, 1, 53168, 1, 1, 10, '2-octubre');

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
SELECT m.*, c.nombreCliente, p.nombreProducto
FROM Mascota m
INNER JOIN Cliente c ON m.idMascota = c.idMascotaFK
INNER JOIN Producto p ON p.idClienteFK = c.idCliente; 


/*ACTIVIDAD 20-09-24: 
1. CONSULTAR EL CLIENTE DE LA MÁXIMA VENTA HECHA
2. CONSULTAR USUARIO Y CLIENTE DE UNA VENTA
3. CONSULTAR LOS PRODUCTOS QUE COMPRÓ UN CLIENTE ESPECÍFICO
4. CONSULTAR TODOS LOS CLIENTES QUE HAN HECHO COMPRAS*/

/*1.*/
select cliente.nombreCliente, venta.cedulaClienteFK, detalleVenta.total
from Venta
inner join cliente on cliente.cedulaCliente = venta.idclienteFK
inner join detalleVenta on venta.idVenta = detalleVenta.idOrdenFK
where total=max(total);

/*2.*/
SELECT v.idVenta, c.nombreCliente, p.nombreProducto, v.precioFK
FROM Venta v
INNER JOIN Cliente c ON v.cedulaClienteFK = c.cedulaCliente
INNER JOIN Producto p ON v.nombreProductoFK = p.nombreProducto;

/*3.*/
SELECT p.nombreProducto, p.precio
FROM Producto p
INNER JOIN Venta v ON v.nombreProductoFK = p.nombreProducto
INNER JOIN Cliente c ON v.cedulaClienteFK = c.cedulaCliente
WHERE c.cedulaCliente = 53168;  -- Cambia por el ID del cliente específico


/*4.*/
SELECT DISTINCT c.nombreCliente, c.cedulaCliente
FROM Cliente c
INNER JOIN Venta v ON c.cedulaCliente = v.cedulaClienteFK;

/* 27-09-2024*/
insert into Cliente values(4,123467,'Tatiana',310846894,'Agosto');
insert into Producto values(44,8669,'Ropa bebé',8,30.000);
insert into Usuario values(114,959334,'Laura Admin',1,1);
insert into Venta values(49,161,114,4,8669,30.000,'5-diciembre');

describe Venta;
update Cliente set nombreCliente='Tatiana Cabrera Vargas' where idCliente=4;
update Cliente set fechaNacimiento='24/11/1985' where idCliente=4;
update Cliente set telefonoCliente=3144606978 where idCliente=4;
update Cliente set telefonoCliente=3144606978 where idCliente=4;
insert into Cliente values(55163118,1111812,'Tatiana Cabrera Vargas',3144606978,24/11/24);

select * from Cliente;
select * from venta;

update Venta set idClienteFK=55163118 where idVenta=49;
delete from Cliente where idCliente=4;


/*30-09-2024*/
/* Procedimientos alternados: subrutinas para almacenar la información en la base de datos 
delimiter;
create procedure nombre_procedimiento(parametros)
begin
lógica sentencia
end
*/

delimiter //
create procedure registrarProducto(codigoProducto int, nombreProducto varchar(15), marca varchar(15), precio float, cedulaClienteFK int(11), cantidad int(11), fechaVenta varchar(15))
begin
insert into Producto values (codigoProducto, nombreProducto, marca, precio, cedulaClienteFK, cantidad, fechaVenta);
end//

delimiter ; 
call registrarProducto(3, 'Tijeras', 'PaperMate', 5000, 23456, 2, '3-octubre')
