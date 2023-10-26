CREATE DATABASE EMPRESA_MAQUINARIA

USE EMPRESA_MAQUINARIA

CREATE TABLE MAQUINARIA
(
cod_maq char(4) not null,
descripcion varchar(30) not null,
ubicacion varchar(20) not null,
costo_referencial decimal(20,2),
constraint pk_maquinaria primary key(cod_maq)
)

CREATE TABLE Personal
(
cod_personal char(3),
nombres varchar(20),
apellidopat varchar(20),
puesto varchar(50),
constraint pk_personal primary key(cod_personal)
)

CREATE TABLE Asignacion
(
cod_maq char(4) not null,
cod_personal char(3) not null,
constraint fk_personal foreign key(cod_personal) references Personal(cod_personal),
constraint fk_maquinaria foreign key(cod_maq) references MAQUINARIA(cod_maq)
)

INSERT INTO MAQUINARIA
VALUES
('X001','Escavadora L1','Cerro Azul',25000),
('X002','Perforadora 200','Ares',30000),
('X003','Perforadora 230','Arcata',27000),
('X004','Escavadora M2','Arcata',17800),
('X005','Escavadora 700','Arcata',31500),
('X007','Escavadora P3','Cerro Azul',31000),
('X008','Generador M45','Cerro Azul',35000),
('X009','Perforadora M20','Ares',42000),
('X010','Generador 18','Ares',18900)

INSERT INTO PERSONAL
VALUES
('P01','Juan','Dominguez','Ayudante perforacion'),
('P02','Carlos','Zegarra','Perforista'),
('P03','Mario','Mamani','Operador'),
('P04','Julian','Perez','Perforista'),
('P05','Domingo','Castro','Perforista'),
('P06','Roger','Vargas','Ayudante perforacion'),
('P07','Marco','Sucari','Operador')

INSERT INTO Asignacion
VALUES
('X001','P04'),
('X003','P05'),
('X005','P06'),
('X007','P07'),
('X008','P01'),
('X002','P02'),
('X010','P03'),
('X010','P04')

SELECT*FROM MAQUINARIA
SELECT*FROM Personal
SELECT*FROM Asignacion

