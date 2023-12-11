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
/*TABLA 1RA A AND 2DA B
  LEFT JOIN  = A-B
  RIGTH JOIN = B-A*/

--Insertar datos
  INSERT INTO (tabla)
  values (datos)

--Añadir datos
  ALTER TABLE (tabla)
  ADD (ubicacion varchar(20) not null)

--Modifica tabla
  Alter Table (tabla)
  Alter column (ubicacion varchar(20) not null)

 --Elimina tabla
  Drop table (tabla)
--------------------------
--   UPDATE AND DELETE  --
--------------------------
  /*
--Modifica datos
  Update (tabla)
  set (lo que se modifica) ubicacion = 'Ares', costo_referencial = 20000;
  where (la ubicacion donde se hara la modificacion) cod_maqui = 'X001';

--Elimina datos
  Delete (tabla)
    where (las condicciones para que elimine) COD_MAQ = 'X001'and ubicacion ='Ares';

--BETWEEN-ENTRE
  Select * from MAQUINARIA
    WHERE costo_referencial between 1000 and 3000;
*/
------------------
--   ORDER BY   --
------------------
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

--1. Haga una consulta que muestre el total del costo referencial de los proyectos de Cerro Azul y Arcata
	--group by
	SELECT ubicacion, sum(costo_referencial) FROM MAQUINARIA
	WHERE ubicacion in('Cerro Azul','Arcata')
	group by ubicacion

	--HAVING
	SELECT ubicacion, sum(costo_referencial) FROM MAQUINARIA
	GROUP BY ubicacion
	having ubicacion in('Arcata','Cerro Azul')

--2. Haga una consulta que muestre el monto total de maquinaria por proyecto, excluya de esa relacion aquellos montos totales que no superen los 100000 soles
	SELECT ubicacion,sum(costo_referencial) from MAQUINARIA
	group by ubicacion	
	having sum(costo_referencial)>90000
	
--2.1 Haga una consulta que muestre el monto total de maquinaria por proyecto, excluya a la escavadora m2 y de esa relacion aquellos montos totales que no superen los 90000 soles
	SELECT ubicacion,sum(costo_referencial) from MAQUINARIA
	where descripcion != 'Escavadora M2'
	group by ubicacion	
	having sum(costo_referencial)>90000
	--order by

--3. Haga una consulta que muestre en que puestos se asignaron a mas de 3 personas.
	SELECT puesto,count(puesto) from Personal
	group by puesto
	having count(puesto)>2

-- 4. Haga la consulta 3. Pero excluya al puesto Operador de esta relación
	SELECT puesto,count(puesto) from Personal
	where puesto != 'Operador'
	group by puesto
	having count(puesto)>2

--5. Haga una consulta que muestre que maquinas tienen mas de 2 personas asignadas
	SELECT MAQUINARIA.descripcion, COUNT(Asignacion.cod_personal)from MAQUINARIA INNER JOIN Asignacion
	ON MAQUINARIA.cod_maq=Asignacion.cod_maq
	GROUP BY MAQUINARIA.descripcion

--6. Muestre cuanto es el total por Escavadoras y Perforadoras. Excluya de la relacion a la Escavadora 700
	SELECT descripcion, sum(costo_referencial)
	FROM MAQUINARIA
	WHERE descripcion != 'Escavadora 700' and (descripcion like 'Escavadora%' or descripcion like 'Perforadora%')
	group by descripcion

	Select * from MAQUINARIA
----------------------------------
--     FUNCIONES AGREGADAS      --  
----------------------------------
/*
SUM (suma)
COUNT (conteo)
  con * puede contar registros
  no cuenta el null en el registro especificado previamente(corroborar)
AVG (promedio)
MIN (minimo)
MAX (maximo)
*/
    
----------------------------------
--		TOP Y SUBCONSULTAS		--
----------------------------------
--SUBCONSULTA con un where, tener en cuenta que le resultado debe compararse con un unico dato o tabla
--  con IN AND NOT IN se puede consultar una lista
--Top 1
  select top 1 * from MAQUINARIA
  
--exists
  select cliente,numero
  from facturas as f
  where exists
  (select * from Detalles as d
  where f.numero=d.numerofactura
  and d.articulo='lapiz')



--maquinarias por encima del promedio total
	Select *from MAQUINARIA
	where costo_referencial >(SELECT AVG(costo_referencial) FROM MAQUINARIA )
	SELECT AVG(costo_referencial) FROM MAQUINARIA

--Mostrar maquinarias cuyo costo_referencial este entre el menor de los costos y el promedio
	Select *from MAQUINARIA
	where costo_referencial between (SELECT min(costo_referencial) FROM MAQUINARIA	) and (SELECT AVG(costo_referencial) FROM MAQUINARIA )

	SELECT min(costo_referencial) FROM MAQUINARIA
	SELECT AVG(costo_referencial) FROM MAQUINARIA

--Mostrar el segundo costo mas bajo
	SELECT TOP 1 * from MAQUINARIA 
	where cod_maq IN 
        (SELECT TOP 2 cod_maq FROM MAQUINARIA 
        order by costo_referencial asc) 
	order by costo_referencial desc

	SELECT * FROM MAQUINARIA
	WHERE exists (Select * from MAQUINARIA
			        	where  costo_referencial > 50000)

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
	
	SELECT cod_personal, nombres, apellidopat FROM Personal
	WHERE cod_personal = 
	(SELECT TOP 1 Asignacion.cod_personal from Asignacion
	GROUP BY ASIGNACION.COD_PERSONAL
	ORDER BY COUNT(ASIGNACION.COD_PERSONAL) DESC)

	SELECT PERSONAL.COD_PERSONAL, PERSONAL.NOMBRES,	PERSONAL.APELLIDOPAT
	FROM PERSONAL
	WHERE COD_PERSONAL IN (SELECT ASIGNACION.COD_PERSONAL
	FROM ASIGNACION
	GROUP BY ASIGNACION.COD_PERSONAL
	HAVING COUNT(ASIGNACION.COD_PERSONAL) > 1)

--3. Muestre las maquinarias asignadas al proyecto Arcata cuyo costo_referencial este por debajo del promedio

	SELECT AVG(costo_referencial) FROM MAQUINARIA --PROMEDIO
	SELECT * FROM MAQUINARIA
	WHERE MAQUINARIA.ubicacion = 'Arcata' AND MAQUINARIA.costo_referencial < 
	(SELECT AVG(costo_referencial) FROM MAQUINARIA)
		
--4. Muestre el nombre del personal que esta asignado a la penultima maquinaría con costo mas bajo
	--maquinaria
	SELECT TOP 2 * FROM MAQUINARIA
	order by costo_referencial asc
	--asignados
	select * from Asignacion inner join Personal on Asignacion.cod_personal=Personal.cod_personal
	where cod_maq = 'X010'

	SELECT Asignacion.cod_maq,Asignacion.cod_personal,concat(Personal.nombres,' ', Personal.apellidopat) from Asignacion inner join Personal
	on Asignacion.cod_personal = Personal.cod_personal
	where Asignacion.cod_maq = 
	(
	SELECT TOP 1 cod_maq from MAQUINARIA 
	where cod_maq IN (SELECT TOP  2 cod_maq from MAQUINARIA order by costo_referencial asc) 
	order by costo_referencial desc
	)
	
--5. Muestre los 2 primeros nombres del personal que no seas perforistas asignados a las maquinarias de Ares con mayor costo
	SELECT * from Personal
	where Personal.puesto != 'Perforista'
	--  1 por uno

------------------------------------
--          FUNCIONES            --
------------------------------------
/*
-----------------------------------
       FUNCIONES DE CADENA
    
CONCATENA TODO
    select concat(feche,cod,etc)
    
EXTRAER PARTES DE UNA CADENA
Tener en cuenta que la posicion 1 es 1 y no como en java en donde posicion 1 es 0
    select SUBSTRING(subTabla,Posicion_Ini,Posicion_Fin) from (Tabla)

CUENTA LOS CARACTERES DE UNA CADENA
    select LENT(MAQUINARIA.descripcion) from MAQUINARIA

LOWER(c): Devuelve la cadena “c” con todas las letras convertidas a minúsculas.
UPPER(c): Devuelve la cadena “c” con todas las letras convertidas a mayúsculas.
LTRIM(c): Elimina los espacios por la izquierda de la cadena “c”.
RTRIM(c): Elimina los espacios por la derecha de la cadena “c”.
LEFT(c, n): Devuelve “n” caracteres por la izquierda de la cadena “c”.
RIGHT(c, n): Devuelve “n” caracteres por la derecha de la cadena “c”.


-----------------------------------
       FUNCIONES DE FECHA

    
INTERVALO = DAY, WEEK, YEARS, MINUTE, SECOND, ETC
    
MUESTRA la fecha actual
		select GETDATE()

MODIFICA LA FECHA A CORDE AL TIEMPO (suma)
		select DATEADD(intervalo, modificacion, fecha)

MODIFICA LA FECHA A CORDE AL TIMEPO (resta)
		select DATEDIFF(intervalo,modificacion,fecha)

-----------------------------------
       FUNCIONES NUMERICA

REDONDEA CANTIDADES EN DECIMALES
		select ROUND(tabla, decimales)

-----------------------------------
       FUNCIONES DE CONVERSION
    
TIPO DE DATO= VARCHAR, INT, DATE, DATE TIME, etc
    
CONVIERTE DATOS
    select CAST((variable o dato), (tipo de dato)
    select COVERT(lo mismo de arriba)

	FUNCION SI 
	IIF (prueba logica o condicion, cadena si es verdadero , falso)
		
*/
--año actural
	select YEAR(GETDATE())

--sumar fechas, (no se puede sumar fechas directamente con int)
	select GETDATE() + 13		--parchado
	select '11/09/2023' + 13	--no funciona

--dada una fecha la produccion demora 15 dias, cual sera su fecha de termino
	select '08/01/2023'
	--MM/DD/YY
	select DATEADD(DAY, 15, '08/01/2023')

--SUMAR 26 HRS A LA HORA ACTUAL
	select GETDATE()
	select DATEADD(hour, 26, getdate())

--sumar 1500 min a la hora actual
	select DATEADD(MINUTE,1500,GETDATE())

--cuantos DIAS han transcurrido desde el 1er de enero del 2023 a la fecha
	select '01/01/2023', GETDATE()
	select DATEDIFF(DAY,'01/01/2023', GETDATE())

--cuantas horas han transcurrido desde el ultimo cumpleaños
	select DATEADD(hour, 7711, '12/23/2023')
	select DATEDIFF(hour,'12/23/2022',getdate())

--cuantos seg falta para que finalice el año
	select DATEDIFF(second,getdate(),'12/01/2024')

--fecha de caducidad
	SELECT * FROM PRODUCTO
	SELECT PRODUCTO.nompro, DATEDIFF(DAY, GETDATE(), PRODUCTO.fechcadu) FROM PRODUCTO
	where DATEDIFF(DAY, GETDATE(), PRODUCTO.fechcadu)>0 and PRODUCTO.fechcadu is not null

--mostrar los precios redondeados a enteros
	select PRODUCTO.nompro, PRODUCTO.precio, ROUND(precio, 0) from PRODUCTO

--mostar precios adicionados en un 10% de aquellos precios que sean mayores a 15
	 select nompro, precio, iif(precio>15, precio* 0.1 + precio , precio) from PRODUCTO

-- si la fecha de caducidad es de este año, mostrar el mensaje observable, sino mostrar ningun mensaje
	SELECT PRODUCTO.fechcadu, iif(YEAR(PRODUCTO.fechcadu)=YEAR(getdate()), 'observar','no') FROM PRODUCTO

-- cast convierte cast(precio AS INT)	

---------------------------------------------
--     FUNCIONES DEFINIDAS POR USUARIO     --
---------------------------------------------
--para editar funcion creada
ALTER FUNCTION [dbo].[días_cumpleaños] (@dia int, @mes int)
  
use EMPRESA_MAQUINARIA
--crear una función que calcule la edad de una persona
CREATE FUNCTION calcula_edad (@fecnac date) --se define el parámetro con tipo de datos a
enviar a la funcion
returns int --indica que tipo de datos retorna
Begin
Declare @temp as int --declaramos variable con su tipo de datos
Set @temp = datediff(year, @fecnac, getdate()) --se asigna a la variable, el calculo
Return @temp
End
  
select dbo.calcula_edad('11/15/2000')

--haga una funcion que dado un personal, indique si esta asignado o no
--a una maquina perforadora
CREATE FUNCTION asig_perso (@PERS CHAR(4))]
RETURNS VARCHAR(20)|
  AS
BEGIN
DECLARE @TEMP AS VARCHAR(20)|
      IF EXISTS (
              SELECT MAQUINARIA.DESCRIPCION
              FROM ASIGNACION INNER JOIN MAQUINARIA
              ON MAQUINARIA.COD_MAQ = ASIGNACION.COD_MAQ
              WHERE ASIGNACION.COD_PERSONAL - @PERS
              AND MAQUINARIA.DESCRIPCION LIKE 'PERFORADORA%' )
      BEGIN
          SET @TEMP » 'Si esta asignado'
      END
          ELSE
      BEGIN
          SET @TEMP « 'No está asignado'
      END

--crear una función que calcule la edad de una persona
	CREATE FUNCTION calcula_edad (@fecnac date) --se define el parámetro con tipo de datos a enviar a la funcion
	returns int --indica que tipo de datos retorna
	Begin
	Declare @temp as int --declaramos variable con su tipo de datos
	Set @temp = datediff(year, @fecnac, getdate()) --se asigna a la variable, el calculo
	Return @temp
	End

	--SELECT(mm/dd/yy)
	select dbo.calcula_edad('12/23/2003')

--crear una función que indique cuantos días faltan para su siguiente cumpleaños
	CREATE FUNCTION días_cumpleaños (@fecumple date)
	--retorna el tipo de dato
	returns int
	begin
	declare @temp as int
	set @temp = datediff(day, getdate(), @fecumple)
	--retorna un valor contenido en la variable
	return @temp
	end

	--SELECT
	select dbo.días_cumpleaños('01/01/2024')

--crear una función que indique cuantos días han transcurrido desde su ultimo cumpleaños a la fecha actual
	CREATE FUNCTION dias (@dia int, @mes int)
	returns int
	begin
	declare @temp as int
	set @temp = datediff(day, cast(CONCAT(@dia,'/',@mes,'/',year(getdate()))as date) , getdate())
	return @temp
	end

	--modificando con alter
	alter function [dbo].[dias](@dia int, @mes int)
	returns int
	begin
	declare @temp as int
	set @temp = datediff(day, cast(CONCAT(@mes,'/',@dia,'/',year(getdate()))as date) , getdate())
	return @temp
	end

	
	select dbo.dias(15,11)

	--modificando con alter
	alter function [dbo].[dias](@dia int, @mes int)
	returns int
	begin
	declare @temp as int

	if(@mes>=MONTH(getdate()) and (@dia>=day(getdate()) or @dia<=day(getdate()))

		begin		
			set @temp = datediff(day, cast(CONCAT(@mes,'/',@dia,'/',year(getdate()))as date) , getdate())
		end
	else if(@mes<=month(getdate()) and (@dia>=day(getdate()) or @dia<=day(getdate()))

		begin
			set @temp = datediff(day, getdate(), cast(CONCAT(@mes,'/',@dia,'/',year(getdate()))as date))
		end
	return @temp
	end
		
	select dbo.dias(12,12)
	select dbo.dias(16,11)
	select dbo.dias(15,10)

	select CONVERT(date, PEDIDO_COMPR.fechped,3) from PEDIDO_COMPR
	select CAST('01/01/2003' as date)
	
	select cast(CONCAT('12','/','12','/',year(getdate()))as date)

	select year(GETDATE())


--Haga una subconsulta que muestre las 2 razones sociales que menos multa han obtenido, solo si existen multas en el año 2020

Su respuesta:
SELECT top 2 usuario.razon, vehiculos.placa from faltas inner JOIN vehiculos on faltas.placa = vehiculos.placa inner join usuario on vehiculos.ruc = usuario.ruc
where exists (
    select  faltas.placa from faltas inner JOIN vehiculos on faltas.placa = vehiculos.placa inner join usuario on vehiculos.ruc = usuario.ruc
	year(faltas.fecfalta)='2020')
    Group by faltas.placa
    order by sum(faltas.multa) asc

	
---------------------------------------------
--     Procedimiento Almacenado            --
---------------------------------------------
--Realice un procedimineto almacenado el registre un nuevo pasajero 
CREATE PROCEDURE registrar_pasajero
    @cod_pasa char(5),
    @DNI1 CHAR(8),
    @nombre_pasa varchar(30),
    @apepa_pasa varchar(30),
    @apema_pasa varchar(30),
    @sexo varchar(9),
    @correo_pasa varchar(30) ,
    @FCH_NACI date 
AS
BEGIN
	IF EXISTS (SELECT cod_pasajero FROM PASAJERO WHERE cod_pasajero = @cod_pasa)
			PRINT 'El código se repite'
    ELSE
			INSERT INTO PASAJERO VALUES (@cod_pasa, @DNI1, @nombre_pasa, @apepa_pasa,@apema_pasa , @sexo, @correo_pasa, @FCH_NACI)
END

EXECUTE registrar_pasajero
'P0050', '75615304', 'CRISTHIAN DIEGO', 'HUARACHA', 'VENTURA', 'MASCULINO'
,'U22237038@utp.edu.pe', '12/23/2003' 
