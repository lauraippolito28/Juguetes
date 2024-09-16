/*Punto 1*/
create database mascotas;
use mascotas;
/*Punto 2*/
create table Cliente(
cedulaCliente int(11) primary key,
nombreCliente varchar(15),
apellidoCliente varchar(15),
direccionCliente varchar(10),
telefono int(10),
idMascotaFK int(11)
);
create table Producto(
codigoProducto int(11) primary key,
nombreProducto varchar (15),
marca varchar (15),
precio float,
cedulaClienteFK int (11)
);
create table Mascota(
idMascota int (11) primary key,
nombreMascota varchar (15),
generoMascota varchar (15),
razaMascota varchar(15),
cantidad int (10)
);
create table Vacuna(
codigoVacuna int (11) primary key,
nombreVacuna varchar(15),
dosisVacuna int(10),
enfermedad Varchar(15)
);
create table Macota_Vacuna(
codigoVacunaFK int (11),
idMadcotaFk int (11),
enfermedad varchar (10)
);

/*Punto 3*/
alter table Producto 
add constraint ProductoClienteFK
foreign key (cedulaClienteFK)
references Cliente(cedulaCliente);

alter table Macota_Vacuna
add constraint VacunaMascota_VacunaFK
foreign key (codigoVacunaFK)
references Vacuna(codigoVacuna);

alter table Macota_Vacuna
add constraint MascotaMascota_VacunaFK
foreign key (idMadcotaFK)
references Mascota(idMadcota);

/*Punto 4*/

/*Punto 5*/
modify 
/*Punto 6*/
Macota_Vacuna rename detalle_vacuna