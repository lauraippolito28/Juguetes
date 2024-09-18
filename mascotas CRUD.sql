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
describe Cliente; 
select * from Cliente;
insert into Cliente values(53168, 'Luna', 'Perez', 'Chia', 2147483647, 1);
insert into Cliente values(123456, 'Laura', 'Marquez', 'Chia', 3124574, 2);
describe Producto; 
select * from Producto;
insert into Producto values(1, 'Shampoo', 'Pets', 10500, 53168, 2);
insert into Producto values(2, 'Acondicionador', 'Pets', 9500, 53168, 2);
describe Vacuna; 
select * from Vacuna;
insert into Vacuna values(12345, 'Contra Rabia', 2, 'Rabia');
insert into Vacuna values(12346, 'Moquillo canino', 2, 'Moquillo');
describe Detalle_Vacuna; 
select * from Detalle_Vacuna;
insert into Detalle_Vacuna values(12345, 1, 'Rabia');
insert into Detalle_Vacuna values(12346, 3, 'Rabia');