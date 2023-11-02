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
('X006','Perforadora 210','Cerro Azul',23600),
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

--Haga una consulta que muestre cuantas Escavadoras hay por proyecto
	SELECT ubicacion, COUNT(*)FROM MAQUINARIA 
	WHERE DESCRIPCION LIKE 'Escavadora%'
	GROUP BY ubicacion

--Haga una consulta que muestre el monto total de maquinaria por proyecto
	SELECT ubicacion,SUM(costo_referencial)from maquinaria 
	GROUP BY ubicacion

--Haga una consulta que muestre cuantas personas estan asignadas por maquina
	SELECT MAQUINARIA.DESCRIPCION, COUNT(*)FROM MAQUINARIA INNER JOIN ASIGNACION
	ON MAQUINARIA.COD_MAQ = ASIGNACION.COD_MAQ
	GROUP BY MAQUINARIA.DESCRIPCION

--Haga una consulta que muestre cuantas maquinas hay por proyecto, y cuanto es su total de costo
	SELECT COUNT(descripcion),ubicacion,SUM(costo_referencial)from maquinaria 
	GROUP BY ubicacion
	SELECT SUM(costo_referencial)from maquinaria 

--Cuantas personas hay por puesto ordenelas por puesto
	SELECT puesto,count(*) from personal
	group by puesto


------------------
--   HAVING     --
------------------

--Haga una consulta que muestre el total del costo referencial de los proyectos de Cerro Azul y Arcata
	--group by
	SELECT ubicacion, sum(costo_referencial) FROM MAQUINARIA
	WHERE ubicacion in('Cerro Azul','Arcata')
	group by ubicacion

	--HAVING
	SELECT ubicacion, sum(costo_referencial) FROM MAQUINARIA
	GROUP BY ubicacion
	having ubicacion in('Arcata','Cerro Azul')

--Haga una consulta que muestre el monto total de maquinaria por proyecto, excluya de esa relacion aquellos montos totales que no superen los 90000 soles
	SELECT ubicacion,sum(costo_referencial) from MAQUINARIA
	group by ubicacion	
	having sum(costo_referencial)>90000
	
--Haga una consulta que muestre el monto total de maquinaria por proyecto, excluya a la escavadora m2 y de esa relacion aquellos montos totales que no superen los 90000 soles
	SELECT ubicacion,sum(costo_referencial) from MAQUINARIA
	where descripcion != 'Escavadora M2'
	group by ubicacion	
	having sum(costo_referencial)>90000
	--order by


--Haga una consulta que muestre en que puestos se asignaron a mas de 3 personas.
	SELECT puesto,count(puesto) from Personal
	group by puesto
	having count(puesto)>2

--Haga la consulta 3. Pero excluya al puesto Operador de esta relación	
	SELECT puesto,count(puesto) from Personal
	where puesto != 'Operador'
	group by puesto
	having count(puesto)>2

--Haga una consulta que muestre que maquinas tienen mas de 2 personas asignadas
	SELECT MAQUINARIA.descripcion, COUNT(Asignacion.cod_personal)from MAQUINARIA INNER JOIN Asignacion
	ON MAQUINARIA.cod_maq=Asignacion.cod_maq
	GROUP BY MAQUINARIA.descripcion

----------------------------------
--		TOP SUBCONSULTAS		--
----------------------------------

--1. Diga cual es el proyecto con costo referencial mas bajo y que no tenga personal asignado a sus maquinarias
--primero por partes
	SELECT TOP 1 ubicacion, SUM(COSTO_REFERENCIAL)FROM MAQUINARIA INNER JOIN ASIGNACION
	ON MAQUINARIA.COD_MAQ = ASIGNACION.COD_MAQ
	GROUP BY ubicacion
	ORDER BY SUM(COSTO_REFERENCIAL) ASC

	SELECT TOP 1 UBICACION, SUM(COSTO_REFERENCIAL)FROM MAQUINARIA LEFT JOIN ASIGNACION
	ON MAQUINARIA.COD_MAQ = ASIGNACION.COD_MAQ
	WHERE ASIGNACION.COD_PERSONAL IS NULL
	GROUP BY ubicacion
	ORDER BY SUM(COSTO_REFERENCIAL) ASC

--2. Diga el nombre completo del personal, que este asignado en mas de una maquinaria
	
--3. Muestre las maquinarias asignadas al proyecto Arcata cuyo costo_referencial este por debajo del promedio

--4. Muestre el nombre del personal que esta asignado a la penultima maquinaría con costo mas bajo

--5. Muestre los 2 primeros nombres del personal que no seas perforistas asignados a las maquinarias de Ares con mayor costo
	SELECT Personal.nombres, Personal.apellidopat,Personal.puesto,MAQUINARIA.descripcion,MAQUINARIA.costo_referencial 
	FROM MAQUINARIA inner join Asignacion 
	on MAQUINARIA.cod_maq=Asignacion.cod_maq inner join Personal 
	on Asignacion.cod_personal=Personal.cod_personal
	where (Personal.puesto !='Perforista' and MAQUINARIA.ubicacion!='Ares')
	order by costo_referencial desc


