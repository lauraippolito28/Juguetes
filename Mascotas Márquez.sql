/*Punto 1*/
create database mascotas;
use mascotas;

/*Punto 2*/
create table Cliente (
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
create table Mascota (
idMascota int (11) primary key, 
nombreMascota varchar(15), 
generoMascota varchar(15),
razaMascota varchar(15), 
cantidad int(10)
);
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

/*Punto 3*/
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

/*Punto 4*/
ALTER TABLE Producto
ADD cantidad int NOT NULL;

/*Punto 5*/
alter table Mascota 
change column cantidad cantidadMascota int(10) not null;

/*Punto 6*/
ALTER TABLE Mascota_Vacuna RENAME TO Detalle_Vacuna;

/*CRUD*/
select * from Mascota;
select * from Vacuna;
select * from Cliente;
select * from Producto;
describe Mascota;
describe Producto;
describe Vacuna;
describe Cliente;
insert into Vacuna value('','Rabia',10,1);
insert into Vacuna value(1,'Eutanasia',3,2),(2,'hepatitis',5,3);
insert into Cliente value(10110921,'Luna','Márquez','C91 #7D-05',310850895,1);
insert into Cliente value('10149859','Camilo','Sanchez','C91 #7A-10',310576842,3);
insert into Producto value(1,'Shampoo','Pets',10500,10110921,1);
insert into Producto value(2,'Galletas','Pets',300,10149859,2);
insert into Mascota values(1,'Mani','F','Criollo', 1),(2,'Katy','F','Criollo', 1),(3,'Nyx','M','Smoking', 1),(4,'','','','');

/*Busqueda campos*/
select nombreMascota,razaMascota from Mascota;
select cedulaCliente as 'Documento', direccionCliente as 'Dirección' from Cliente;
select nombreVacuna as 'Vacuna' from Vacuna;
select dosisVacuna as 'Dosis' from Vacuna;
select razaMascota as 'Raza' from Mascota;
select idMascota as 'Código' from Mascota;
select nombreProducto as 'Producto' from Producto;
select precio as 'Precio' from Producto;
select cedulaCliente as 'Documento', idMascotaFK as 'Código mascota' from Cliente order by nombreCliente asc; /*ASC para ascendente y DSC para descendente*/
select nombreProducto as 'Producto', marca from Producto order by precio desc;
select nombreProducto from  Producto where precio >= 300; 
select enfermedad from Detalle_Vacuna where codigoVacunaFK = 1;
select nombreProducto from Producto where precio = 10500 and codigoProducto = 1;

/*Quiz, hacer 2 de cada tabla, 3 relacionales, 3 no relacionales*/
select nombreMascota from Mascota where razaMascota ='Smoking' or generoMascota ='M';
select idMascota from Mascota where cantidadMascota = 4 and razaMascota ='Criollo';
select idMascotaFK from Cliente where cedulaCliente <= 1 or telefono >= 10000;
select nombreProducto from Producto where marca like 'M%';

/*Tarea
Hacer  2 busquetas con like y not like en cada una de las tablas*/ 
