create database elColibri;
use elColibri;

create table cliente(
    idCliente int primary key auto_increment, 
    cedulaCliente varchar(10) not null unique,
    nombreCliente varchar(30),
    apellidoCliente varchar(30),
    telefonoCliente varchar(10),
    fechaNacimientoCliente date
);

create table producto(
    idProducto int primary key auto_increment,
    codigoProducto varchar(15) not null unique,
    nombreProducto varchar(25),
    descripcionProducto varchar(100),
    stockProducto int,
    precioUnidadProducto float
);

create table usuario(
    idUsuario int primary key auto_increment, 
    cedulaUsuario varchar(20) not null unique,
    cargoUsuario varchar(15),
    nombreUsuario varchar (30)
);

create table proveedor(
    idProveedor int primary key auto_increment,
    nombreProveedor varchar(50),
    direccionProveedor varchar(100),
    ciudadProveedor varchar(50)
);


create table telefonoProveedor(
    idTelefono int primary key auto_increment,
    idProveedorFK int,
    telefono varchar(15),
	constraint fkTelefonoProveedor foreign key (idProveedorFK) references proveedor(idProveedor)
);

create table venta(
    idVenta int primary key auto_increment,
    numeroVenta varchar(20) not null unique, 
    idUsuarioFK int,
    idClienteFK int,
    idProductoFK int,
    cantidadVenta int,
    precioUnitario float, 
    totalVenta float,    
    fechaVenta date,
    constraint fkVentaCliente foreign key (idClienteFK) references cliente(idCliente),
	constraint fkVentaUsuario foreign key (idUsuarioFK) references usuario(idUsuario),
	constraint fkVentaProducto FOREIGN key (idProductoFK) references producto(idProducto)
  );
  

select * from usuario;
insert into usuario (idUsuario, cedulaUsuario, cargoUsuario, nombreUsuario) values 
(1, '79485725', 'Dueño', 'Mauricio Bermúdez'),
(2, '52883378', 'Administradora', 'Diana Tabares'),
(3, '1016954734', 'Vendedor', 'Sarah Díaz'),
(4, '1001316474', 'Vendedor', 'Prince Bermúdez');

select * from producto;
insert into producto (idProducto, codigoProducto, nombreProducto, descripcionProducto, stockProducto, precioUnidadProducto) values
(1, "J40f01", "La cucaracha 1", "Juego familia y estrategia", 40, 50.000),
(2, "J41f02", "La cucaracha 2", "Juego familia y estrategia", 35, 65.000),
(3, "J42f03", "La cucaracha 3", "Juego familia y estrategia", 20, 80.000),
(4, "J43f04", "La cucaracha 4", "Juego familia y estrategia", 20, 95.000),
(5, "J01f05", "¿Por qué siempre yo? 1", "Juego familia y estrategia", 50, 20.000),
(6, "J02f06", "¿Por qué siempre yo? 2", "Juego familia y estrategia", 50, 30.000),
(7, "J03f07", "¿Por qué siempre yo? 3", "Juego familia y estrategia", 30, 45.000),
(8, "J04f08", "¿Por qué siempre yo? 4", "Juego familia y estrategia", 30, 55.000),
(9, "J05f09", "¿Por qué siempre yo? 5", "Juego familia y estrategia", 15, 70.000),
(10, "J70f10", "Fantasmas", "familia y estrategia", 50, 70.000),
(11, "J71f11", "Pingüinos", "familia y estrategia", 50, 70.000),
(12, "J72f12", "Hongos saltarines 1", "familia y estrategia", 30, 90.000),
(13, "J73f13", "Hongos saltarines 2", "familia y estrategia", 45, 140.000),
(14, "J20f14", "Avispado", "familia, estrategia y cartas", 50, 45.000),
(15, "J21f15", "Veloz mente", "familia y estrategia y cartas", 70, 30.000),
(16, "J22f16", "Spot it", "familia, estrategia y cartas", 20, 40.000),
(17, "J23f17", "Stop", "familia, estrategia y cartas", 70, 30.000),
(18, "J24f18", "Uno´s", "familia, estrategia y cartas", 70, 20.000),
(19, "J30f19", "Jenga colores/natural pequeño", "familia, estrategia", 70, 35.000),
(20, "J31f20", "Jenga colores/natural grande", "familia, estrategia", 40, 45.000),
(21, "J32f21", "Jenga Jadake", "familia, estrategia", 15, 80.000),
(22, "J10f22", "Cierre la caja pequeño", "familia, estrategia", 10, 90.000),
(23, "J11f23", "Cierre la caja grande", "familia, estrategia", 10, 120.000),
(24, "J50f24", "Parques imantado/escalera", "familia, estrategia", 10, 40.000),
(25, "J51f25", "Parques imantado/estrella", "familia, estrategia", 10, 40.000),
(26, "J52f26", "Parques imantado/ajedrez", "familia, estrategia", 10, 45.000),
(27, "J53f27", "Parques imantado/parques 1", "familia, estrategia", 10, 45.000),
(28, "J54f28", "Parques imantado/parques 2", "familia, estrategia", 10, 50.000),
(29, "J55f29", "Parques imantado/dardos", "familia, estrategia", 10, 60.000),
(30, "J60f30", "Bolirana cajon", "familia, estrategia", 20, 60.000),
(31, "J56f31", "Parques escalera 1", "familia, estrategia", 10, 120.000),
(32, "J57f32", "Parques estadio 1", "familia, estrategia", 10, 90.000),
(33, "J58f33", "Parques escalera 2", "familia, estrategia", 15, 150.000),
(34, "J59f34", "Parques estadio 2", "familia, estrategia", 15, 100.000),
(35, "J61f35", "Parques estadio iokus", "familia, estrategia", 5, 170.000),
(36, "J62f36", "Parques escalera iokus", "familia, estrategia", 5, 170.000),
(37, "J63f37", "Bolirana piso", "familia", 2, 320.000),
(38, "J64f38", "Rana brazos", "familia", 1, 280.000),
(39, "J65f39", "Rana cajon", "familia", 10, 55.000),
(40, "J66f40", "Mesa ping pong", "familia", 1, 560.000),
(41, "J67f41", "Futbolin pequeño", "familia", 5, 90.000),
(42, "J68f42", "Futbolin grande", "familia", 3, 160.000),
(43, "J69f43", "Ajedrez 1", "estrategia", 5, 50.000),
(44, "J90f44", "Ajedrez 2", "estrategia", 5, 55.000),
(45, "J91f45", "Ajedrez 3", "estrategia", 3, 70.000),
(46, "J92f46", "Ajedrez 4", "estrategia", 5, 120.000),
(47, "J93f47", "Ajedrez ovejas", "estrategia", 1, 220.000),
(48, "J94f48", "Siete loco", "estrategia, apostar", 20, 40.000),
(49, "J95f49", "Triqui", "estrategia", 20, 15.000),
(50, "J96f50", "3 en 1", "famiñia", 25, 70.000);

select * from proveedor;
insert into proveedor (idProveedor, nombreProveedor, direccionProveedor, ciudadProveedor) values
(1, "Jadake", "Calle 20", "Santa Rosa de cabal"),
(2, "Iokus", "Avenida 31", "Finlandia Quindio"),
(3, "Martín", "Calle 26", "Bogotá"),
(4, "Maderandia", "Avenida 57", "Pereira"),
(5, "Oscar juguetero", "Avenida 97", "Bogotá(Engativá)"),
(6, "Dlego", "Calle 13", "Bogotá(San victorino)"),
(7, "JO", "Transversa 97", "Bogotá"),
(8, "Mago", "Carrera 5", "Bogotá"),
(9, "La jugueteria", "Carrera 7", "Bogotá"),
(10, "El tronco", "Calle 17", "Armernia");

select * from telefonoProveedor;
insert into telefonoProveedor (idProveedorFK, telefono) values
(1, "123-4567"),
(2, "234-5678"),
(3, "345-6789"),
(4, "456-7890"),
(5, "567-8901"),
(6, "567-8101"),
(7, "567-7401"),
(8, "567-2501"),
(9, "974-8901"),
(10, "224-8901");

select * from cliente;
insert into cliente (idCliente, cedulaCliente, nombreCliente, apellidoCliente, telefonoCliente, fechaNacimientoCliente) values
(1, '123476789', 'Juan', 'Pérez', '3148765432', '1985-03-15'),
(2, '987254321', 'María', 'Gómez', '3129876543', '1990-07-22'),
(3, '456323789', 'Carlos', 'Rodríguez', '3104567891', '1988-11-10'),
(4, '328654987', 'Ana', 'López', '3151234567', '1995-05-25'),
(5, '664321789', 'Jorge', 'Martínez', '3176543210', '1980-09-30'),
(6, '789458123', 'Laura', 'Hernández', '3189876543', '1992-02-14'),
(7, '159753786', 'Luis', 'García', '3191239876', '1987-06-05'),
(8, '753159843', 'Sofía', 'Sánchez', '3143216789', '1993-08-20'),
(9, '246813279', 'Diego', 'Ramírez', '3107891234', '1989-12-01'),
(10, '369258347', 'Valentina', 'Castillo', '3159871234', '1994-10-18'),
(11,'135782468', 'Andrés', 'Mendoza', '3198765432', '1983-04-27'),
(12, '246997531', 'Isabella', 'Rojas', '3126549870', '1991-01-12'),
(13, '363147258', 'Samuel', 'Jiménez', '3141592653', '1986-11-23'),
(14, '1457258369', 'Camila', 'Salazar', '3177531598', '1992-03-09'),
(15, '258963147', 'Felipe', 'Vargas', '3182468135', '1984-07-15'),
(16, '963752741', 'Natalia', 'Quintero', '3193214789', '1990-05-30'),
(17, '159986753', 'Sebastián', 'Cárdenas', '3157896541', '1981-09-19'),
(18, '753551852', 'Lucía', 'Morales', '3172589643', '1993-12-08'),
(19, '951653468', 'Daniel', 'González', '3148765430', '1985-02-27'),
(20, '159753258', 'Gabriela', 'Torres', '3186543219', '1989-10-03'),
(21, '358159486', 'Manuel', 'Márquez', '3101597538', '1980-06-21'),
(22, '753236159', 'Diana', 'Mejía', '3197531864', '1995-01-15'),
(23, '159258253', 'Hugo', 'Patiño', '3154567890', '1987-04-11'),
(24, '258147361', 'Mariana', 'Salcedo', '3148529631', '1991-11-25'),
(25, '951468733', 'Rafael', 'Rincón', '3171472580', '1983-08-13'),
(26, '789456159', 'Pablo', 'Bermúdez', '3106543212', '1992-02-02'),
(27, '321987454', 'Juliana', 'Cifuentes', '3191234560', '1988-10-30'),
(28, '654789361', 'Nicolás', 'Tovar', '3157891230', '1984-05-19'),
(29, '456123680', 'Esteban', 'Ceballos', '3109876543', '1986-12-12'),
(30, '154753456', 'Martha', 'Córdoba', '3146549876', '1990-03-05'),
(31, '112233445', 'Victoria', 'Serrano', '3216549870', '1988-04-15'),
(32, '223344556', 'Pablo', 'Torres', '3159876543', '1990-05-20'),
(33, '334455667', 'Lina', 'Castillo', '3108765432', '1992-06-30'),
(34, '445566778', 'Cristian', 'Salcedo', '3171234567', '1985-07-25'),
(35, '556677889', 'Sofía', 'Rincón', '3189876540', '1991-08-10'),
(36, '667788990', 'Valeria', 'Zamora', '3143216780', '1983-09-01'),
(37, '778899001', 'Nicolás', 'Ortega', '3196543210', '1994-10-12'),
(38, '889900112', 'Ángela', 'García', '3178529630', '1980-11-22'),
(39, '990011223', 'Andrés', 'López', '3149632587', '1987-12-05'),
(40, '101112223', 'Martha', 'Martínez', '3154569870', '1993-01-18'),
(41, '111213224', 'Raúl', 'González', '3196547890', '1989-02-24'),
(42, '121314225', 'Gabriel', 'Quintero', '3121472589', '1982-03-30'),
(43, '131415226', 'Carmen', 'Pérez', '3187896540', '1995-04-11'),
(44, '141516227', 'Diego', 'Núñez', '3172589630', '1986-05-14'),
(45, '151617228', 'Lucía', 'Figueroa', '3198765432', '1990-06-15'),
(46, '161718229', 'Felipe', 'Hernández', '3106541234', '1983-07-20'),
(47, '171819230', 'Sara', 'Díaz', '3143217890', '1992-08-25'),
(48, '181920231', 'Oscar', 'Vargas', '3151472589', '1991-09-10'),
(49, '192021232', 'Patricia', 'Jiménez', '3189632547', '1988-10-04'),
(50, '202122233', 'Mariana', 'Mendoza', '3197896541', '1994-11-15');

select * from venta;
insert into venta (numeroVenta, idUsuarioFK, idClienteFK, idProductoFK, cantidadVenta, precioUnitario, totalVenta, fechaVenta) values
('V001', 1, 1, 1, 2, 50.000, 100.000, '2024-10-01'),
('V002', 1, 2, 2, 1, 65.000, 65.000, '2024-10-02'),
('V003', 2, 3, 3, 3, 80.000, 240.000, '2024-10-03'),
('V004', 3, 4, 4, 1, 95.000, 95.000, '2024-10-04'),
('V005', 3, 5, 5, 5, 20.000, 100.000, '2024-10-05'),
('V006', 2, 6, 6, 4, 30.000, 120.000, '2024-10-06'),
('V007', 1, 7, 7, 2, 45.000, 90.000, '2024-10-07'),
('V008', 2, 8, 8, 3, 55.000, 165.000, '2024-10-08'),
('V009', 1, 9, 9, 1, 70.000, 70.000, '2024-10-09'),
('V010', 3, 10, 10, 4, 70.000, 280.000, '2024-10-10'),
('V011', 1, 11, 11, 2, 70.000, 140.000, '2024-10-11'),
('V012', 2, 12, 12, 1, 90.000, 90.000, '2024-10-12'),
('V013', 3, 13, 13, 3, 140.000, 420.000, '2024-10-13'),
('V014', 1, 14, 14, 2, 45.000, 90.000, '2024-10-14'),
('V015', 1, 15, 15, 1, 30.000, 30.000, '2024-10-15'),
('V016', 2, 16, 16, 2, 40.000, 80.000, '2024-10-16'),
('V017', 2, 17, 17, 3, 30.000, 90.000, '2024-10-17'),
('V018', 3, 18, 18, 5, 20.000, 100.000, '2024-10-18'),
('V019', 1, 19, 19, 2, 35.000, 70.000, '2024-10-19'),
('V020', 1, 20, 20, 1, 45.000, 45.000, '2024-10-20'),
('V021', 3, 21, 21, 3, 80.000, 240.000, '2024-10-21'),
('V022', 2, 22, 22, 2, 90.000, 180.000, '2024-10-22'),
('V023', 1, 23, 23, 1, 120.000, 120.000, '2024-10-23'),
('V024', 2, 24, 24, 4, 40.000, 160.000, '2024-10-24'),
('V025', 3, 25, 25, 2, 40.000, 80.000, '2024-10-25'),
('V026', 1, 26, 26, 3, 45.000, 135.000, '2024-10-26'),
('V027', 2, 27, 27, 2, 45.000, 90.000, '2024-10-27'),
('V028', 3, 28, 28, 1, 50.000, 50.000, '2024-10-28'),
('V029', 1, 29, 29, 2, 60.000, 120.000, '2024-10-29'),
('V030', 2, 30, 30, 1, 60.000, 60.000, '2024-10-30'),
('V031', 1, 1, 1, 3, 50.000, 150.000, '2024-10-01'),
('V032', 2, 2, 2, 2, 65.000, 130.000, '2024-10-02'),
('V033', 1, 3, 3, 1, 80.000, 80.000, '2024-10-03'),
('V034', 3, 4, 4, 5, 95.000, 475.000, '2024-10-04'),
('V035', 2, 5, 5, 2, 20.000, 40.000, '2024-10-05'),
('V036', 1, 6, 6, 4, 30.000, 120.000, '2024-10-06'),
('V037', 3, 7, 7, 3, 45.000, 135.000, '2024-10-07'),
('V038', 2, 8, 8, 2, 55.000, 110.000, '2024-10-08'),
('V039', 1, 9, 9, 1, 70.000, 70.000, '2024-10-09'),
('V040', 3, 10, 10, 5, 70.000, 350.000, '2024-10-10'),
('V041', 1, 11, 11, 2, 70.000, 140.000, '2024-10-11'),
('V042', 2, 12, 12, 4, 90.000, 360.000, '2024-10-12'),
('V043', 1, 13, 13, 3, 140.000, 420.000, '2024-10-13'),
('V044', 3, 14, 14, 1, 45.000, 45.000, '2024-10-14'),
('V045', 1, 15, 15, 4, 30.000, 120.000, '2024-10-15'),
('V046', 2, 16, 16, 2, 40.000, 80.000, '2024-10-16'),
('V047', 3, 17, 17, 3, 30.000, 90.000, '2024-10-17'),
('V048', 1, 18, 18, 5, 20.000, 100.000, '2024-10-18'),
('V049', 2, 19, 19, 2, 35.000, 70.000, '2024-10-19'),
('V050', 3, 20, 20, 3, 45.000, 135.000, '2024-10-20');

/*Consultas cliente*/
select * from cliente;
select nombreCliente, fechaNacimientoCliente from cliente where fechaNacimientoCliente > '1990-01-01';
select * from cliente where apellidoCliente = 'García';
select nombreCliente, telefonoCliente from cliente;
select count(*) as cantidad from cliente where apellidoCliente = 'Pérez';
select apellidoCliente, idCliente from cliente where cedulaCliente like '1%';
select telefonoCliente from cliente where telefonoCliente like '3%';
select fechaNacimientoCliente from cliente order by fechaNacimientoCliente asc;
/*Modificaciones cliente*/
update cliente set telefonoCliente = '3156543210' where idCliente = 27;
update cliente set apellidoCliente = 'Martínez' where idCliente = '47';
update cliente set fechaNacimientoCliente = '1980-01-01' where idCliente = 32;
update cliente set nombreCliente = 'Luis', apellidoCliente = 'Pérez' where idCliente = 4;
update cliente set telefonoCliente = '3186478546' where idCliente = 13;
/*Eliminación cliente*/
delete from cliente where idCliente = 50;

/* Consultas básicas y específicas de producto*/
select * from producto;
select * from producto where stockProducto > 50;
select * from producto where nombreProducto like '%cucaracha%';
select nombreProducto, precioUnidadProducto from producto where precioUnidadProducto > 100.000;
select stockProducto, nombreProducto from producto where stockProducto between 10 and 30;
select precioUnidadProducto from producto order by precioUnidadProducto desc;
select * from producto order by precioUnidadProducto asc limit 5;
select count(*) as cantidad from producto where stockProducto < 50;
/*Modificaciones producto*/
update producto set precioUnidadProducto = 55000 where idProducto = 7;
update producto set stockProducto = stockProducto + 15 where idProducto = 30;
update producto set descripcionProducto = 'Cubo Rubik' where idProducto = 27;
update producto set nombreProducto = 'Cucaracha 1' where idProducto = 49;
update producto set precioUnidadProducto = precioUnidadProducto * 0.9;
/*Eliminación producto*/
delete from producto where idProducto = 50;

/*Consultas usuario*/
select * from usuario;
select nombreUsuario from usuario where cargoUsuario = 'Vendedor';
select cedulaUsuario from usuario where cedulaUsuario like '1%';
select CargoUsuario from usuario where nombreUsuario like 'M%';
select nombreUsuario, idUsuario from usuario where cargoUsuario = 'Administradora';
select count(*) as cantidad from usuario where cargoUsuario = 'Vendedor';
select * from usuario order by idUsuario desc;
/*Modificaciones usuario*/
update usuario set cedulaUsuario = 1001316478 where idUsuario = 4;
update usuario set cargoUsuario = 'Administradora' where idUsuario = 3;
update usuario set nombreUsuario = 'Nicolás Bermudez' where idUsuario = 4;
update usuario set nombreUsuario = 'Ernesto Rabadilla' where idUsuario = 3;
/*Eliminación usuario*/
delete from usuario where idUsuario = 4;

/*Consultas proveedor*/
select * from proveedor;
select * from proveedor where nombreProveedor = 'JO';
select * from proveedor where direccionProveedor like '%Calle%';
select nombreProveedor, ciudadProveedor from proveedor where ciudadProveedor = 'Bogotá';
select idProveedor from proveedor where ciudadProveedor = 'Santa Rosa de Cabal';
select nombreProveedor from proveedor order by nombreProveedor asc;
/*Modificaciones en proveedor*/
update proveedor set direccionProveedor = 'Transversal 6' where idProveedor = 5;
update proveedor set ciudadProveedor = 'Cali' where idProveedor = 2;
update proveedor set nombreProveedor = 'KidOToy' where idProveedor = 3;
/*Eliminación proveedor*/
delete from proveedor where idProveedor = 9;

/*Consultas telefonoproveedor*/
select * from telefonoproveedor;
select * from telefonoproveedor where idProveedorFK = 2;
select * from telefonoproveedor where telefono like '123%';
select telefono from telefonoproveedor order by telefono asc;
/*Modificaciones telefonoproveedor*/
update telefonoproveedor set telefono = '3201234567' where idProveedorFK = 1;
update telefonoproveedor set telefono = '3159876543' where idProveedorFK= 3;
/*Eliminación telefonoproveedor*/
delete from telefonoproveedor where idProveedor = 4;

/*Consultas venta*/
select * from venta;
select idUsuarioFK from venta where totalVenta > 200.000;
select numeroVenta from venta where fechaVenta between '2024-01-01' and '2024-10-05';
select * from venta where idClienteFK = 27;
select numeroVenta from venta where idUsuarioFK = 1;
select sum(totalVenta) as total_vendido from venta where fechaVenta > '2024-10-24';
select count(*) as cantidad_ventas from venta where idUsuarioFK = 3;
/*Modificaciones venta*/
update venta set totalVenta = totalVenta * 0.9 where idVenta = 1;
update venta set idUsuarioFK = 2 where idVenta = 3;
update venta set idClienteFK = 4 where idVenta = 5;
/*Eliminación venta*/
delete from venta where idVenta = 40;



/*Vistas*/
delimiter //
create view vistaClientesp as
select c.nombreCliente, p.nombreProducto
from cliente c
join venta v on c.idCliente = v.idClienteFK
join producto p on v.idProductoFK = p.idProducto; 
//
delimiter ;
select * from vistaClientesp;

/*Sentencia Join*/
select c.nombreCliente, sum(v.totalVenta) as totalGastado
from cliente c
join venta v on c.idCliente = v.idClienteFK
group by c.idCliente;

select c.nombreCliente, p.nombreProducto, v.fechaVenta
from venta v
join cliente c on v.idClienteFK = c.idCliente
join producto p on v.idProductoFK = p.idProducto;

select c.nombreCliente, count(v.idVenta) as totalVentas
from cliente c
left join venta v on c.idCliente = v.idClienteFK
group by c.idCliente;

select pr.nombreProveedor, p.nombreProducto
from proveedor pr
join telefonoProveedor tp on pr.idProveedor = tp.idProveedorFK
join producto p on p.idProducto = pr.idProveedor; 

select c.nombreCliente, 
       sum(v.totalVenta) as totalGastado, 
       count(v.idVenta) as cantidadCompras
from cliente c
join venta v on c.idCliente = v.idClienteFK
group by c.idCliente
having totalGastado > 100;

/*Subconsultas*/
select nombreCliente 
from cliente 
where idCliente in (select idClienteFK from venta where fechaVenta > '2024-10-20');

select nombreProducto 
from producto 
where stockProducto < (
    select avg(stockProducto) 
    from producto
);

select nombreCliente
from cliente
where idCliente in (
    select idClienteFK 
    from venta 
    where totalVenta > 200
);

select nombreProducto
from producto
where idProducto not in (
    select idProductoFK
    from venta
);

/*Procedimeinto almacenado*/
delimiter //

create procedure agregarCliente(
    in nombre varchar(100),
    in apellido varchar(100),
    in telefono varchar(15)
)
begin
    insert into cliente (nombreCliente, apellidoCliente, telefonoCliente) 
    values (nombre, apellido, telefono);
end //

delimiter ;

call agregarCliente('Luna', 'Marquez', '3115518114');

select * from cliente


delimiter //
create trigger actualizarStock after insert on venta
for each row
begin
    update producto
    set stockProducto = stockProducto - new.cantidadVenta
    where idProducto = new.idProductoFK;
end //
delimiter ;

delimiter //
create trigger calcularTotal before insert on venta
for each row
begin
    set new.totalVenta = new.cantidadVenta * new.precioUnitario;
end //
delimiter ;
