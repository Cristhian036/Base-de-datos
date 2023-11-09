use VENTAS

/*
	INTERVALO = DAY, WEEK, YEARS, MINUTE, SECOND, ETC
	MUESTRA la fecha actual
		select GETDATE()

	MODIFICA LA FECHA A CORDE AL TIEMPO (suma)
		select DATEADD(intervalo, modificacion, fecha)

	MODIFICA LA FECHA A CORDE AL TIMEPO (resta)
		select DATEDIFF(intervalo,modificacion,fecha)

	REDONDEA CANTIDADES EN DECIMALES
		select ROUND(tabla, decimales)

	FUNCION SI 
	IIF (prueba logica , verdadero , falso)
		
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
	
