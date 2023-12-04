CREATE DATABASE AVION_VUELO

USE AVION_VUELO

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
DNI char(8) not null,
nombre_pasajero char(30) not null,
APP_pasajero char(30) not null,
APM_pasajero char(30) null,
genero_PSJ char(9) not null,
correo_PSJ char(9) not null,
fecnanpasaj date not null,
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


INSERT INTO AVION
VALUES
('M0001','Airbus 319'),('M0002','Airbus 320'),
('M0003','Boeing 737'),('M0004','Boeing 777'),
('M0005','ATR 72'),('M0006','ATR 42'),
('M0007','ANTONOV AN-22'),('M0008','ANTONOV AN-225'),
('M0009','Tupolev Tu-204'),('M0010','Bombardier CRJ')

INSERT INTO ASIENTO
VALUES
('01','A'),('01','B'),('01','C'),('01','D'),('01','E'),('01','F'),
('02','A'),('02','B'),('02','C'),('02','D'),('02','E'),('02','F'),
('03','A'),('03','B'),('03','C'),('03','D'),('03','E'),('03','F'),
('04','A'),('04','B'),('04','C'),('04','D'),('04','E'),('04','F'),
('05','A'),('05','B'),('05','C'),('05','D'),('05','E'),('05','F'),
('06','A'),('06','B'),('06','C'),('06','D'),('06','E'),('06','F'),
('07','A'),('07','B'),('07','C'),('07','D'),('07','E'),('07','F'),
('08','A'),('08','B'),('08','C'),('08','D'),('08','E'),('08','F'),
('09','A'),('09','B'),('09','C'),('09','D'),('09','E'),('09','F'),
('10','A'),('10','B'),('10','C'),('10','D'),('10','E'),('10','F'),
('11','A'),('11','B'),('11','C'),('11','D'),('11','E'),('11','F'),
('12','A'),('12','B'),('12','C'),('12','D'),('12','E'),('12','F'),
('13','A'),('13','B'),('13','C'),('13','D'),('13','E'),('13','F'),
('14','A'),('14','B'),('14','C'),('14','D'),('14','E'),('14','F'),
('15','A'),('15','B'),('15','C'),('15','D'),('15','E'),('15','F'),
('16','A'),('16','B'),('16','C'),('16','D'),('16','E'),('16','F'),
('17','A'),('17','B'),('17','C'),('17','D'),('17','E'),('17','F'),
('18','A'),('18','B'),('18','C'),('18','D'),('18','E'),('18','F'),
('19','A'),('19','B'),('19','C'),('19','D'),('19','E'),('19','F'),
('20','A'),('20','B'),('20','C'),('20','D'),('20','E'),('20','F'),
('21','A'),('21','B'),('21','C'),('21','D'),('21','E'),('21','F'),
('22','A'),('22','B'),('22','C'),('22','D'),('22','E'),('22','F'),
('23','A'),('23','B'),('23','C'),('23','D'),('23','E'),('23','F'),
('24','A'),('24','B'),('24','C'),('24','D'),('24','E'),('24','F'),
('25','A'),('25','B'),('25','C'),('25','D'),('25','E'),('25','F'),
('26','A'),('26','B'),('26','C'),('26','D'),('26','E'),('26','F'),
('27','A'),('27','B'),('27','C'),('27','D'),('27','E'),('27','F'),
('28','A'),('28','B'),('28','C'),('28','D'),('28','E'),('28','F'),
('29','A'),('29','B'),('29','C'),('29','D'),('29','E'),('29','F'),
('30','A'),('30','B'),('30','C'),('30','D'),('30','E'),('30','F'),
('31','A'),('31','B'),('31','C'),('31','D'),('31','E'),('31','F'),
('32','A'),('32','B'),('32','C'),('32','D'),('32','E'),('32','F'),
('33','A'),('33','B'),('33','C'),('33','D'),('33','E'),('33','F'),
('34','A'),('34','B'),('34','C'),('34','D'),('34','E'),('34','F'),
('35','A'),('35','B'),('35','C'),('35','D'),('35','E'),('35','F'),
('36','A'),('36','B'),('36','C'),('36','D'),('36','E'),('36','F'),
('37','A'),('37','B'),('37','C'),('37','D'),('37','E'),('37','F'),
('38','A'),('38','B'),('38','C'),('38','D'),('38','E'),('38','F'),
('39','A'),('39','B'),('39','C'),('39','D'),('39','E'),('39','F'),
('40','A'),('40','B'),('40','C'),('40','D'),('40','E'),('40','F'),
('41','A'),('41','B'),('41','C'),('41','D'),('41','E'),('41','F'),
('42','A'),('42','B'),('42','C'),('42','D'),('42','E'),('42','F'),
('43','A'),('43','B'),('43','C'),('43','D'),('43','E'),('43','F'),
('44','A'),('44','B'),('44','C'),('44','D'),('44','E'),('44','F'),
('45','A'),('45','B'),('45','C'),('45','D'),('45','E'),('45','F'),
('46','A'),('46','B'),('46','C'),('46','D'),('46','E'),('46','F'),
('47','A'),('47','B'),('47','C'),('47','D'),('47','E'),('47','F'),
('48','A'),('48','B'),('48','C'),('48','D'),('48','E'),('48','F'),
('49','A'),('49','B'),('49','C'),('49','D'),('49','E'),('49','F'),
('50','A'),('50','B'),('50','C'),('50','D'),('50','E'),('50','F'),
('51','A'),('51','B'),('51','C'),('51','D'),('51','E'),('51','F'),
('52','A'),('52','B'),('52','C'),('52','D'),('52','E'),('52','F'),
('53','A'),('53','B'),('53','C'),('53','D'),('53','E'),('53','F'),
('54','A'),('54','B'),('54','C'),('54','D'),('54','E'),('54','F'),
('55','A'),('55','B'),('55','C'),('55','D'),('55','E'),('55','F'),
('56','A'),('56','B'),('56','C'),('56','D'),('56','E'),('56','F'),
('57','A'),('57','B'),('57','C'),('57','D'),('57','E'),('57','F'),
('58','A'),('58','B'),('58','C'),('58','D'),('58','E'),('58','F'),
('59','A'),('59','B'),('59','C'),('59','D'),('59','E'),('59','F'),
('60','A'),('60','B'),('60','C'),('60','D'),('60','E'),('60','F'),
('61','A'),('61','B'),('61','C'),('61','D'),('61','E'),('61','F'),
('62','A'),('62','B'),('62','C'),('62','D'),('62','E'),('62','F'),
('63','A'),('63','B'),('63','C'),('63','D'),('63','E'),('63','F'),
('64','A'),('64','B'),('64','C'),('64','D'),('64','E'),('64','F'),
('65','A'),('65','B'),('65','C'),('65','D'),('65','E'),('65','F'),
('66','A'),('66','B'),('66','C'),('66','D'),('66','E'),('66','F'),
('67','A'),('67','B'),('67','C'),('67','D')
INSERT INTO DESTINO
VALUES
('PER604','LIMA-PERU'),('PER603','AREQUIPA-PERU'),('PER602','CUSCO-PERU'),
('MEX484','CIUDAD DE MEXICO-MEXICO'),('CHL152','SANTIAGO DE CHILE-CHILE'),
('BOL068','LA PAZ-BOLIVIA'),('PRI630','SAN JUAN-PUERTO RICO'),
('USA840','SAN FRANCISCO-ESTADOS UNIDOS')

INSERT INTO ORIGEN
VALUES
('PER604','LIMA-PERU'),('PER603','AREQUIPA-PERU'),('PER602','CUSCO-PERU'),
('MEX484','CIUDAD DE MEXICO-MEXICO'),('CHL152','SANTIAGO DE CHILE-CHILE'),
('BOL068','LA PAZ-BOLIVIA'),('PRI630','SAN JUAN-PUERTO RICO'),
('USA840','SAN FRANCISCO-ESTADOS UNIDOS')

INSERT INTO PUESTO
VALUES
('PT01','PILOTO'),('PT02','COPILOTO'),('PT03','ASISTENTE DE ALIMENTO'),
('PT04','MANEJO DE MALETAS'),('PT05','SEGURIDAD'),('PT06','ASAFATA'),
('PT07','ASISTENTE DE VUELO')

INSERT INTO TRIPULACION
VALUES
--PILOTOS
('T037','JUAN','PEREZ','LOPEZ','PT01'),
('T078','LUIS','LÓPEZ','JIMÉNEZ','PT01'),
('T089','ALBERTO','TORRES','HERNÁNDEZ','PT01'),
--COPILOTOS
('T149','PEPE','MARTÍNEZ','GARCIA','PT02'),
('T020','EDUARDO','VÁSQUEZ','DÍAZ','PT02'),
('T133','JORGE','MOLINA','RIVERA','PT02'),
--ASISTENTE DE ALIMENTO
('T022','MIGUEL','DIAZ','PEREZ','PT03'),
('T130','SERGIO','ORTÍZ','GARRIDO','PT03'),
('T048','DANIEL','MORALES','ALVARADO','PT03'),
--SEGURIDAD
('T021','DARWIN','PEREZ','MARTINEZ','PT05'),
('T046','ROBERTO','LOPEZ','GARCIA','PT05'),
('T107','JESUS','GARCIA','SANCHEZ','PT05'),
--MANEJO DE MALETAS
('T023','JUAN','GUTIERREZ','MARTINEZ','PT04'),
('T084','PEDRO','GARCÍA','QUISPE','PT04'),
('T094','RAÚL','GÓMEZ','CASTILLO','PT04'),
--ASAFATA
('T065','SELENA','SANCHEZ','PEREZ','PT06'),
('T098','ELENA','MARTINEZ','MARTINEZ','PT06'),
('T052','ANA','RODRIGUEZ','GONZALEZ','PT06'),
('T043','LAURA','LOPEZ','FERNANDEZ','PT06'),
--ASISTENTE VUELO
('T073','MARIA','GONZALEZ','RODRIGUEZ','PT07'),
('T150','JORGE','RUIZ','HERNÁNDEZ','PT07'),
('T064','FERNANDO','NAVARRO','DELGADO','PT07')

INSERT INTO RUTA
VALUES
('R001','PER604','PRI630'),
('R002','PER603','PER604'),
('R003','CHL152','BOL068'),
('R004','BOL068','CHL152'),
('R005','PER604','BOL068'),
('R006','PRI630','PER604'),
('R007','CHL152','MEX484'),
('R008','MEX484','BOL068'),
('R009','PER602','PER603'),
('R010','PER604','USA840')
INSERT INTO VUELO
VALUES
('V0001','A0001','12/12/2021 18:30:00','13/12/2021 02:30:00','R001'),
('V0002','A0002','05/05/2021 13:00:00','05/05/2021 16:00:00','R005'),
('V0003','A0003','05/11/2023 09:30:00','05/11/2023 12:30:00','R003'),
('V0004','A0004','04/05/2023 20:45:00','05/05/2023 04:45:00','R006'),
('V0005','A0005','09/01/2022 16:15:00','10/01/2022 02:15:00','R008'),
('V0006','A0006','06/06/2021 21:00:00','07/06/2021 03:00:00','R010'),
('V0007','A0007','31/10/2023 14:30:00','31/10/2023 15:30:00','R009'),
('V0008','A0008','10/10/2022 17:45:00','11/10/2022 04:45:00','R007'),
('V0009','A0009','10/05/2023 08:00:00','10/05/2023 11:00:00','R004'),
('V0010','A0010','01/04/2022 17:15:00','01/04/2022 19:15:00','R002')

select DAY(FECH_SALIDA) FROM VUELO

--vuelo tripu
INSERT INTO VUELO_TRIPULACION
VALUES
('V0001','T037'),('V0002','T150'),('V0003','T089'),('V0004','T107'),('V0005','T037'),
('V0001','T149'),('V0002','T078'),('V0003','T133'),('V0004','T020'),('V0005','T133'),
('V0001','T022'),('V0002','T020'),('V0003','T048'),('V0004','T037'),('V0005','T022'),
('V0001','T021'),('V0002','T130'),('V0003','T107'),('V0004','T023'),('V0005','T046'),
('V0001','T023'),('V0002','T046'),('V0003','T094'),('V0004','T065'),('V0005','T084'),
('V0001','T065'),('V0002','T084'),('V0003','T052'),('V0004','T052'),('V0005','T098'),
('V0001','T073'),('V0002','T098'),('V0003','T043'),('V0004','T150'),('V0005','T064'),

('V0006','T037'),('V0007','T078'),('V0008','T089'),('V0009','T078'),('V0010','T089'),
('V0006','T149'),('V0007','T133'),('V0008','T020'),('V0009','T149'),('V0010','T020'),
('V0006','T048'),('V0007','T022'),('V0008','T130'),('V0009','T048'),('V0010','T130'),
('V0006','T107'),('V0007','T046'),('V0008','T021'),('V0009','T107'),('V0010','T021'),
('V0006','T023'),('V0007','T084'),('V0008','T094'),('V0009','T023'),('V0010','T094'),
('V0006','T065'),('V0007','T098'),('V0008','T052'),('V0009','T065'),('V0010','T052'),
('V0006','T150'),('V0007','T064'),('V0008','T073'),('V0009','T150'),('V0010','T073')


INSERT INTO PASAJERO
VALUES
('P0001','70599840','BOB','PEREZ','PEREZ','MASCULINO','BOBPP40@gmail.com','12/12/1990'),
('P0002','70707070','JUAN','QUISPE','QUISPE','MASCULINO','PAPU@gmail.com','12/12/1950'),
('P0003','26546588','MARIA','DOMINGUEZ','SANCHEZ','FEMENINO','DRASRES@gmail.com','05/01/1979'),
('P0004','60606060','BEÑAT','CALVO','SANTOS','MASCULINO','BEÑAT@gmail.com','31/12/1960'),
('P0005','16496416','TANIA','SANCHEZ','LOPEZ','FEMENINO','SDFGSE@gmail.com','03/10/2001'),
('P0006','40404040','CRISTOFER','PEREZ','SANCHEZ','MASCULINO','CRT@gmail.com','09/10/1970'),
('P0007','43546874','LUCIA','LOPEZ','FERNANDEZ','FEMENINO','PDF@gmail.com','17/05/2003'),
('P0008','20202020','SEBASTIAN','GALLEGO','MARTINEZ','MASCULINO','SBT@gmail.com','04/05/1950'),
('P0009','54743746','LUCY','CUSI','PEREZ','FEMENINO','WORD@gmail.com','12/06/1970'),
('P0010','90909090','MARVIN','LOPEZ','CAMPO','MASCULINO','MRN@gmail.com','01/01/1990'),
('P0011','12345678', 'ALICE','GARCIA','MARTINEZ','FEMENINO','alice_garcia@gmail.com','05/04/1995'),
('P0012','87654321', 'CHARLIE', 'LOPEZ', 'FERNANDEZ', 'MASCULINO', 'charlie.lopez@gmail.com', '18/09/1989'),
('P0013','98765432', 'EMMA', 'RODRIGUEZ', 'SANTOS', 'FEMENINO', 'emma.rodriguez@gmail.com', '22/07/1992'),
('P0014','23456789', 'DAVID', 'MARTINEZ', 'LOPEZ', 'MASCULINO', 'david_martinez@gmail.com', '15/03/1984'),
('P0015','34567890', 'SOFIA', 'HERNANDEZ', 'GOMEZ', 'FEMENINO', 'sofia_hernandez@gmail.com', '10/11/1987'),
('P0016','45678901', 'LUIS', 'GOMEZ', 'RODRIGUEZ', 'MASCULINO', 'luis_gomez@gmail.com', '28/06/1998'),
('P0017','56789012', 'OLIVIA', 'PEREZ', 'SERRANO', 'FEMENINO', 'olivia.perez@gmail.com', '03/09/1990'),
('P0018','67890123', 'MIGUEL', 'SERRANO', 'FLORES', 'MASCULINO', 'miguel_serrano@gmail.com', '14/02/1986'),
('P0019','78901234', 'AVA', 'FLORES', 'RAMIREZ', 'FEMENINO', 'ava.flores@gmail.com', '07/12/1994'),
('P0020','89012345', 'JUAN', 'RAMIREZ', 'HERNANDEZ', 'MASCULINO', 'juan.ramirez@gmail.com', '25/08/1983'),
('P0021','98765432', 'ISABEL', 'LOPEZ', 'HERNANDEZ', 'FEMENINO', 'isabel.lopez@gmail.com', '14/07/1986'),
('P0022','34567890', 'ALEJANDRO', 'GOMEZ', 'PEREZ', 'MASCULINO', 'alejandro.gomez@gmail.com', '02/05/1993'),
('P0023','56789012', 'MIA', 'PEREZ', 'FERNANDEZ', 'FEMENINO', 'mia.perez@gmail.com', '20/10/1980'),
('P0024','23456789', 'CARLOS', 'HERNANDEZ', 'RODRIGUEZ', 'MASCULINO', 'carlos_hernandez@gmail.com', '11/03/1997'),
('P0025','45678901', 'SARA', 'RODRIGUEZ', 'MARTINEZ', 'FEMENINO', 'sara_rodriguez@gmail.com', '26/08/1989'),
('P0026','78901234', 'JAVIER', 'MARTINEZ', 'SANCHEZ', 'MASCULINO', 'javier.martinez@gmail.com', '09/01/1991'),
('P0027','89012345', 'EMILIA', 'SANCHEZ', 'LOPEZ', 'FEMENINO', 'emilia.sanchez@gmail.com', '17/06/1985'),
('P0028','12345678', 'HUGO', 'LOPEZ', 'GARCIA', 'MASCULINO', 'hugo.lopez@gmail.com', '05/12/1996'),
('P0029','67890123', 'ANA', 'GARCIA', 'FLORES', 'FEMENINO', 'ana.garcia@gmail.com', '30/03/1982'),
('P0030','98765421', 'VALERIA', 'MARTINEZ', 'GUTIERREZ', 'FEMENINO', 'valeria.martinez@gmail.com', '09/10/1997'),
('P0031','87654321', 'DIEGO', 'FLORES', 'SERRANO', 'MASCULINO', 'diego.flores@gmail.com', '18/09/1999'),
('P0032','34567891', 'ISABEL', 'TORO', 'RAMIREZ', 'FEMENINO', 'isabel.toro@gmail.com', '14/07/1986'),
('P0033','45678902', 'FELIPE', 'MOLINA', 'SANTOS', 'MASCULINO', 'felipe.molina@gmail.com', '19/03/1991'),
('P0034','56789023', 'CAROLINA', 'MARTINEZ', 'GOMEZ', 'FEMENINO', 'carolina_martinez@gmail.com', '26/09/1985'),
('P0035','67890134', 'JAVIER', 'SANTOS', 'LOPEZ', 'MASCULINO', 'javier.santos@gmail.com', '08/05/1997'),
('P0036','78901245', 'DANIELA', 'LOPEZ', 'PEREZ', 'FEMENINO', 'daniela.lopez@gmail.com', '02/11/1989'),
('P0037','89012356', 'ANTONIO', 'GOMEZ', 'FLORES', 'MASCULINO', 'antonio.gomez@gmail.com', '17/12/1982'),
('P0038','90123467', 'MARIANA', 'FLORES', 'HERNANDEZ', 'FEMENINO', 'mariana.flores@gmail.com', '23/06/1993'),
('P0039','01234578', 'ROBERTO', 'HERNANDEZ', 'RAMIREZ', 'MASCULINO', 'roberto.hernandez@gmail.com', '30/01/1988'),
('P0040','12345689', 'PAULA', 'RAMIREZ', 'SERRANO', 'FEMENINO', 'paula.ramirez@gmail.com', '11/08/1996'),
('P0041','23456790', 'JORGE', 'SERRANO', 'MARTINEZ', 'MASCULINO', 'jorge_serrano@gmail.com', '04/04/1984'),
('P0042','87654332', 'RICARDO', 'GUTIERREZ', 'LOPEZ', 'MASCULINO', 'ricardo_gutierrez@gmail.com', '20/06/1983'),
('P0043','76543243', 'ANA', 'LOPEZ', 'HERNANDEZ', 'FEMENINO', 'ana.lopez@gmail.com', '15/03/1990'),
('P0044','65432154', 'SERGIO', 'HERNANDEZ', 'SANTOS', 'MASCULINO', 'sergio.hernandez@gmail.com', '28/11/1987'),
('P0045','54321065', 'MARINA', 'SANTOS', 'RAMIREZ', 'FEMENINO', 'marina.santos@gmail.com', '02/05/1982'),
('P0046','43210976', 'ALEJANDRO', 'RAMIREZ', 'GOMEZ', 'MASCULINO', 'alejandro.ramirez@gmail.com', '12/09/1995'),
('P0047','32109887', 'CLAUDIA', 'GOMEZ', 'FLORES', 'FEMENINO', 'claudia.gomez@gmail.com', '19/07/1984'),
('P0048','21098798', 'FERNANDO', 'FLORES', 'MARTINEZ', 'MASCULINO', 'fernando.flores@gmail.com', '24/01/1992'),
('P0049','10987609', 'NATALIA', 'MARTINEZ', 'LOPEZ', 'FEMENINO', 'natalia.martinez@gmail.com', '07/08/1989'),

INSERT INTO RESERVA
VALUES
('RS0001','10','A','11/12/2021',500.50,'NO VERIFICADO','P0001','V0001'),
('RS0002','40','D','03/05/2021',250.00,'VERIFICADO','P0002','V0002'),
('RS0003','20','B','04/11/2023',250.50,'NO VERIFICADO','P0003','V0003'),
('RS0004','30','C','02/05/2023',500.50,'NO VERIFICADO','P0004','V0004'),
('RS0005','50','A','08/01/2022',600.00,'VERIFICADO','P0005','V0005'),
('RS0006','01','B','02/06/2021',550.50,'NO VERIFICADO','P0006','V0006'),
('RS0007','60','F','15/10/2023',700.00,'NO VERIFICADO','P0007','V0007'),
('RS0008','50','E','09/10/2022',300.50,'VERIFICADO','P0008','V0008'),
('RS0009','02','C','06/05/2023',450.50,'NO VERIFICADO','P0009','V0009'),
('RS0010','30','D','27/03/2022',400.00,'NO VERIFICADO','P0010','V0010'),
('RS0011','42', 'C','11/12/2021',565.00,'VERIFICADO','P0023','V0001'),
('RS0012','18', 'B','29/03/2022',255.00,'NO VERIFICADO','P0027','V0010'),
('RS0013','55', 'E','02/05/2023',565.50,'VERIFICADO','P0020','V0004'),
('RS0014','29', 'A','04/11/2023',320.50,'NO VERIFICADO','P0017','V0003'),
('RS0015','63', 'D','01/05/2021',445.00,'NO VERIFICADO','P0030','V0002'),
('RS0016','25', 'F','08/12/2021',540.00,'VERIFICADO','P0019','V0002'),
('RS0017','52', 'B','09/10/2022',285.50,'VERIFICADO','P0028','V0008'),
('RS0018','36', 'D','10/12/2021',495.50,'NO VERIFICADO','P0025','V0001'),
('RS0019','14', 'C','30/03/2022',575.00,'VERIFICADO','P0034','V0010'),
('RS0020','45', 'A','08/01/2022',590.00,'NO VERIFICADO','P0016','V0005'),
('RS0021','31', 'E','01/05/2023',380.50,'NO VERIFICADO','P0035','V0004'),
('RS0022','50', 'A','30/10/2023',595.00,'VERIFICADO','P0014','V0007'),
('RS0023','22', 'D','09/12/2021',270.50,'NO VERIFICADO','P0013','V0001'),
('RS0024','41', 'F','07/10/2022',420.50,'VERIFICADO','P0041','V0008'),
('RS0025','15', 'B','07/01/2022',395.00,'NO VERIFICADO','P0032','V0005'),
('RS0026','27', 'B','30/04/2021',265.00,'VERIFICADO','P0031','V0002'),
('RS0027','55', 'E','08/12/2021',530.50,'NO VERIFICADO','P0026','V0001'),
('RS0028','14', 'F','29/10/2023',350.00,'NO VERIFICADO','P0047','V0007'),
('RS0029','33', 'A','04/06/2021',575.50,'NO VERIFICADO','P0024','V0006'),
('RS0030','46', 'D','09/05/2023',450.50,'NO VERIFICADO','P0046','V0009'),
('RS0031','25', 'C','02/11/2023',550.00,'VERIFICADO','P0036','V0003'),
('RS0032','61', 'F','05/06/2021',275.50,'NO VERIFICADO','P0039','V0006'),
('RS0033','42', 'A','31/03/2022',585.00,'VERIFICADO','P0043','V0010'),
('RS0034','53', 'E','03/06/2021',265.50,'VERIFICADO','P0023','V0006'),
('RS0035','30', 'B','03/11/2023',580.50,'NO VERIFICADO','P0049','V0003'),
('RS0036','40', 'A','02/05/2023',285.00,'VERIFICADO','P0045','V0004'),
('RS0037','12', 'B','08/05/2023',495.00,'NO VERIFICADO','P0022','V0009'),
('RS0038','51', 'C','06/01/2022',565.00,'VERIFICADO','P0021','V0005'),
('RS0039','24', 'F','07/05/2023',575.50,'NO VERIFICADO','P0028','V0009')

