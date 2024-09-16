create database Mascotas;
use Mascotas;
create table cliente (
    cedulaCliente int primary key,
    nombreCliente varchar(15) not null,
    apellidoCliente varchar(15), 
    direccionCliente varchar(10),
    telefono int,
    idMascotaFK int
);

create table producto (
    codigoProducto int primary key,
    nombreProducto varchar(15),
    marca varchar(15), 
    precio float(15),
	cedulaClienteFK int
);

create table mascota (
    idMascota int primary key,
    nombreMascota varchar(15),
    generoMascota varchar(15), 
    razaMascota varchar(15),
	cantidad int
); 

create table vacuna (
    codigoVacuna int primary key,
    nombreVacuna varchar(15),
    dosisVacuna int, 
    enfermedad varchar(15)
);

create table vacuna_mascota (
    codigoVacunaFK int,
    idMascotaFK int,
	enfermedadFK varchar (15)
);

alter table producto 
add constraint FKCliente
foreign key (cedulaClienteFK)
references cliente(cedulaCliente);

alter table cliente 
add constraint FKMascota
foreign key (idMascotaFK)
references mascota(idMascotaFK);

alter table mascota_vacuna 
add constraint FKMasVacu
foreign key (codigoVacunaFK)
references vacuna(codigoVacuna);

alter table mascota_vacuna 
add constraint FKidMascota
foreign key (idMascotaFK)
references mascota(idMascota);

alter table mascota_vacuna 
add constraint FKenfermedad
foreign key (enfermedadFK)
references vacuna(enfermedad);

rename alter table  rename to ()

