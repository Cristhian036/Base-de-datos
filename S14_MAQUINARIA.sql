-- haga una funcion que dada una ubicacion indique el total de costo referencial
CREATE FUNCTION ubicacion_costo(@ubica varchar(20))
	RETURNS decimal(10,2)
		AS
	BEGIN
	DECLARE @tem as decimal(10,2)
		SELECT @tem = SUM(MAQUINARIA.costo_referencial)
		FROM MAQUINARIA
		WHERE ubicacion=@ubica
	RETURN @tem
	END

	select * from maquinaria
	select dbo.ubicacion_costo('Cerro Azul')
