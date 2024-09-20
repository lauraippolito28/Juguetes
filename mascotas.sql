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


alter table Cliente 
add constraint FKMascotaCliente 
foreign key (idMascotaFK)
references Mascota(idMascota);

alter table Producto 
add constraint FKClienteProducto 
foreign key (cedulaClienteFK)
references Cliente(cedulaCliente);

alter table  Detalle_Vacuna
add constraint FKVacunaDetalle_Vacuna
foreign key (codigoVacunaFK)
references Vacuna(codigoVacuna);

alter table Detalle_Vacuna
add constraint FKMascotaDetalle_Vacuna
foreign key (idMascotaFK)
references Mascota(idMascota);

describe  Producto;

select * from Vacuna;
select * from Mascota;
select * from Cliente;
select * from Producto;
select * from Detalle_Vacuna;

insert into Mascota values (1, "Rush", "Masculino", "Criollo", 1), (2, "Macarena", "Femenino", "Criollo", 2), (3, "Norc", "Masculino", "Criollo", 1);
insert into Producto values (1, "Shampoo", "Garras", "10500", 100131, 50), (2, "Jabonso", "Garras", "20000", 528837, 50); 
insert into Vacuna values (1, "HGT", 30, "NOGS"), (2, "TZC", 20, "DFM"), (3, "T1", 40, "FNT");
insert into Cliente values (100131, "Prince", "Bermúdez", "calle 72", 279748, 3), (528837, "Ernesto", "Ruíz", "calle 70", 324879, 1); 
insert into Detalle_Vacuna values (1, 2, "NOGS"), (2, 1, "DFM"), (3, 3, "FNT");

/*Alías*/
select nombreMascota as 'Nombre', razaMascota as 'Raza' from Mascota; 
select nombreCliente as 'Nombre', cedulaCliente as 'Identificación' from Cliente; 
select nombreProducto as 'Nombre', codigoProducto as 'Código' from Producto; 
select nombreVacuna as 'Nombre', dosisVacuna as 'Dosis' from Vacuna; 
/*Orden by*/
select nombreCliente as "Nombre", cedulaCliente as "Identificación", idMascotaFK as "Código mascota" from Cliente order by nombreCliente asc;
select nombreProducto as "Producto", Marca as "Marca" from Producto order by Precio desc;
/*Clausula Where*/
select nombreProducto from Producto where precio >= 15000;
select enfermedad, codigoVacunaFK from Detalle_Vacuna where idMascotaFK > 1;
/*Clausula And*/
select nombreProducto from Producto where precio > 10000 and cantidad >= 50;

/*Actividad*/
select nombreMascota from mascota where razaMascota = 'Criollo' and cantidadMascota > 1; 
select nombreMascota from mascota where razaMascota = 'Criollo' or cantidadMascota > 1;

select marca as 'Marca Producto', codigoProducto as 'Código' from Producto; 
select nombreVacuna as 'Nombre', codigoVacuna as 'Código' from Vacuna; 
/*Clausula Between*/
select nombreProducto from Producto where precio between 1000 and 100000;
/*Clausula Like*/
select nombreCliente from Cliente where nombreCliente like "P%";
