-----------FUNCIONES ESCALARES-------

/*ALTER FUNCTION nombreFun (@var int)
RETURNS int

AS
BEGIN
	SET @var = @var*5
	RETURN @var
END
*/
--SELECT dbo.nombreFun(5)


--PRINT DBO.concatenar('Lopez','Roberto')
ALTER FUNCTION concatenar (
					@apellido VARCHAR(50),
					@nombre VARCHAR(50)
					)
RETURNS VARCHAR(100)

AS
BEGIN
	DECLARE @resultado VARCHAR(100)
	SET @resultado=@apellido + ', ' +@nombre
	RETURN @resultado
END

ALTER FUNCTION obtenerPais(@idPaciente paciente)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @pais VARCHAR(50)
	SET @pais= (SELECT PA.pais FROM Paciente P
				INNER JOIN Pais PA
				ON PA.idPais=P.idPais
				WHERE idPaciente=@idPaciente)
	RETURN @pais
END
--SELECT DBO.obtenerPais (8)
--SELECT * FROM Paciente


 ------ FUNCIONES DE TIPO TABLA

ALTER FUNCTION listaPaises()
RETURNS @paises TABLE (idPais CHAR(3),pais VARCHAR(50)) --SE CREA LA TABLA A RETORNAR
AS
BEGIN
	INSERT INTO @paises VALUES ('ESP','España')
	INSERT INTO @paises VALUES ('MEX','México')
	INSERT INTO @paises VALUES ('CHI','Chile')
	INSERT INTO @paises VALUES ('PER','Perú')
	INSERT INTO @paises VALUES ('ARG','Argentina')
	INSERT INTO @paises VALUES ('ITA','Italia')
	RETURN
END

SELECT * FROM DBO.LISTAPAISES()