CREATE DATABASE AVION_VUELO

use avion_vuelo

CREATE TABLE AVION
(
cod_avion  char(5) not null,
modelo varchar(30) not null,
constraint pk_avion primary key (cod_avion)
)

CREATE TABLE DESTINO
(
cod_destino  char(5) not null,
ciudad_destino varchar(30) not null,
constraint pk_destino primary key (cod_destino)
)

CREATE TABLE ORIGEN
(
cod_origen  char(5) not null,
ciudad_origen varchar(30) not null,
constraint pk_origen primary key (cod_origen)
)

CREATE TABLE RUTA
(
cod_ruta char(4) not null,
cod_origen  char(5) not null,
cod_destino  char(5) not null,
constraint pk_ruta primary key (cod_ruta),
constraint fk_origen foreign key (cod_origen) references ORIGEN (cod_origen),
constraint fk_destino foreign key (cod_destino) references DESTINO (cod_destino)
)

CREATE TABLE PUESTO
(
cod_puesto char(4) not null,
nombre_puesto varchar(30) not null,
constraint pk_puesto primary key (cod_puesto)
)

CREATE TABLE TRIPULACION
(
cod_tripulacion char(5) not null,
nom_tripulacion varchar(30) not null,
APP_tripu varchar(30) not null,
APM_tripu varchar(30) null,
cod_puesto char(4) not null,
constraint pk_tripulacion primary key (cod_tripulacion),
constraint fk_puesto foreign key (cod_puesto) references PUESTO (cod_puesto)
)

CREATE TABLE PASAJERO
(
cod_pasajero char(5) not null,
nombre_pasajero char(30) not null,
DNI char(8) not null,
APP_pasajero char(30) not null,
APM_pasajero char(30) null,
genero_PSJ char(9) not null,
correo_PSJ char(9) not null,
FECHNC_PSJ date not null,
constraint pk_pasajero primary key (cod_pasajero),
)

CREATE TABLE ASIENTO
(
AST_FILA  char(2) not null,
AST_COLUMNA varchar(1) not null,
constraint pk_asiento primary key (AST_COLUMNA, AST_FILA)
)
--claves foraneas
CREATE TABLE VUELO
(
cod_vuelo char(5) not null,
cod_avion char(5) not null,
FECH_SALIDA datetime not null,
FECH_LLEGADA datetime not null,
cod_ruta char(4) not null,
constraint pk_vuelo primary key (cod_vuelo),
constraint fk_avion foreign key (cod_avion) references AVION (cod_avion),
constraint fk_ruta foreign key (cod_ruta) references RUTA (cod_ruta),
)

CREATE TABLE VUELO_TRIPULACION
(
cod_vuelo char(5) not null,
cod_tripulacion char(5) not null,
constraint fk_vueloTripu foreign key (cod_vuelo) references VUELO (cod_vuelo),
constraint fk_tripulacion foreign key (cod_tripulacion) references TRIPULACION (cod_tripulacion)
)

CREATE TABLE RESERVA
(
cod_reserva char(5) not null,
AST_FILA  char(2) not null,
AST_COLUMNA varchar(1) not null,
FECH_RESERVA datetime not null,
precio decimal (10,2) not null,
CHECK_IN varchar(20) not null,
cod_pasajero char(5) not null,
cod_vuelo char(5) not null,
constraint pk_reserva primary key (cod_reserva),
constraint fk_asiento foreign key (AST_COLUMNA, AST_FILA) references ASIENTO (AST_COLUMNA, AST_FILA),
constraint fk_vuelo foreign key (cod_vuelo) references VUELO (cod_vuelo),
constraint fk_pasajero foreign key (cod_pasajero) references PASAJERO (cod_pasajero)
)

select * from AVION
select * from VUELO
select * from DESTINO
select * from ORIGEN
select * from RUTA
select * from VUELO_TRIPULACION
select * from TRIPULACION
select * from PUESTO
select * from RESERVA
select * from ASIENTO
select * from PASAJERO


