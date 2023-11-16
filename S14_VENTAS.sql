CREATE DATABASE VENTAS

USE VENTAS

CREATE TABLE CIUDAD
(
codciu char(5) not null,
nomciu varchar(30) not null,
constraint pk_ciudad primary key (codciu)
)
CREATE TABLE VENDEDOR
(
codvende char(4) not null,
nomvende varchar(30) not null,
apepvende varchar(30) not null,
apemvende varchar(30) null,
constraint pk_vendedor primary key (codvende)
)
CREATE TABLE MARCA
(
codmar char(4) not null,
nommar varchar(20) not null,
constraint pk_marca primary key (codmar)
)
CREATE TABLE FORMAPAGO
(
codforma char(3) not null,
nomforma varchar(20) not null,
constraint pk_forma primary key (codforma)
)
CREATE TABLE DISTRITO
(
coddist char(5) not null,
nomdist varchar(30) not null,
codciu char(5) not null,
constraint pk_distrito primary key (coddist),
constraint fk_ciudad foreign key (codciu) references CIUDAD (codciu)
)
CREATE TABLE CLIENTE
(
nomcli varchar(30) not null,
apepcli varchar(30) not null,
apemcli varchar(30) not null,
fecnac date not null,
dni char(8) not null,
codcli char(6) not null,
direccion varchar(50) not null,
coddist char(5) not null,
constraint pk_cliente primary key (codcli),
constraint fk_distrito foreign key (coddist) references DISTRITO (coddist)
)
CREATE TABLE PRODUCTO
(
codpro char(6) not null,
nompro varchar(30) not null,
precio decimal(6,2),
codmar char(4) not null,
constraint pk_producto primary key (codpro),
constraint fk_marca foreign key (codmar) references MARCA (codmar)
)
CREATE TABLE PEDIDO_COMPR
(
codped char(8) not null,
fechped datetime not null,
codcli char(6) not null,
codvende char(4) not null,
nrocomp char(10) not null,
tipopago char(2) not null,
codforma char(3) not null,
subtotalg decimal(6,2) not null,
igv decimal(6,2) not null,
total decimal(6,2) not null,
constraint pk_pedido primary key (codped),
constraint fk_cliente foreign key (codcli) references CLIENTE (codcli),
constraint fk_vendedor foreign key (codvende) references VENDEDOR
(codvende),
constraint fk_forma foreign key (codforma) references FORMAPAGO (codforma)
)
CREATE TABLE PED_PRO
(
codped char(8) not null,
codpro char(6) not null,
cantidad smallint not null,
subtotal decimal(6,2) not null,
constraint fk_pedido foreign key (codped) references PEDIDO_COMPR (codped),
constraint fk_producto foreign key (codpro) references PRODUCTO (codpro),
constraint pk_compuesta primary key (codped, codpro)
)

--adicionar el campo genero/sexo
ALTER TABLE CLIENTE
ADD sexo char(1) not null
--adicionar el campo fecha de caducidad en la tabla producto
ALTER TABLE PRODUCTO
ADD fechcadu date null
--
INSERT INTO CIUDAD
VALUES
('01212','Lima')
select * from CIUDAD --mostrar los registros de la tabla
INSERT INTO CIUDAD
VALUES
('01213','Arequipa')
--distrito
INSERT INTO DISTRITO
VALUES
('D0101','Cerro Colorado','01213'),
('D0102','Surco','01212')
select * from distrito
--cliente
INSERT INTO CLIENTE
VALUES
('Juan','Perez','Tejada','01/05/1990','40404040','C0001','Av.Pumacahua
111','D0101','M'),
('Rosa','Zevallos','Mamani','12/06/1986','20202020','C0002','Calle los
Topacios 1236','D0102','F')
--marca
INSERT INTO MARCA
VALUES
('M01','PORTUGAL'),
('M02','ROCHE')
--vendedor
INSERT INTO VENDEDOR
VALUES
('V001','Rogelio','Vera','Gonzales'),
('V002','Maria','Torres','Quispe')
--formapago
INSERT INTO FORMAPAGO
VALUES
('F01','Visa'),
('F02','Efectivo')
--producto (mm/dd/aaaa)
INSERT INTO PRODUCTO
VALUES
('P001','Jarabe Abrilar 80g', 22.80, 'M01', '11/12/2024'),
('P002','Capsulas Omeprazol', 5.6, 'M02', '06/15/2025')
select * from producto
--pedido_compr
INSERT INTO PEDIDO_COMPR
VALUES
('Pe001','07/26/2023 15:01:12.000','C0001','V001','001-004','EF','F02',
100, 18, 118),
('Pe002','07/27/2023 08:06:11.000','C0002','V001','001-005','TA','F01',
125, 14.6, 149.11)
--PED_PRO
INSERT INTO PED_PRO
VALUES
('Pe001','P001', 2, 56.3),
('Pe001','P002', 1, 12.5)



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

