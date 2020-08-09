--DECLARE @idPaciente int
--SET @idPaciente = 7
--IF @idPaciente = 8
--	SELECT * FROM Paciente WHERE idPaciente=@idPaciente
--ELSE
--	SELECT * FROM Paciente WHERE idPaciente NOT LIKE @idPaciente

/*
DECLARE @idPaciente int
DECLARE @idTurno int
SET @idPaciente = 8
IF @idPaciente = 8
BEGIN --PARA ESCRIBIR MAS DE UNA LINEA
	SET @idTurno=20
	SELECT * FROM Paciente WHERE idPaciente=@idPaciente
	print @idTurno

	IF EXISTS(SELECT * FROM Paciente WHERE idPaciente=8)
		print 'Existe'
END
ELSE
BEGIN
	print 'No se cumplio la condicion del IF'
END
*/

--DECLARE @contador int=0
--WHILE @contador <=10
--BEGIN
--	print @contador
--	SET @contador = @contador + 1
--	IF @contador=3
--		RETURN
--	print 'HOLA'
--END

--DECLARE @valor int
--DECLARE @resultado CHAR(50)=''
--SET @valor = 100
--SET @resultado=(CASE WHEN @valor=10 THEN 'ROJO'
--						WHEN @valor=20 THEN 'VERDE'
--						WHEN @valor=30 THEN 'AZUL'
--					ELSE 'FALOPA PORQUE NO ENCONTRO EL VALOR DE @VALOR'
--				END)
--print @resultado


--SELECT *,(CASE WHEN estado=1 THEN 'VERDE'
--				WHEN estado=2 THEN 'ROJO'
--				--WHEN estado=0 THEN 'AZUL' 
--			ELSE 'NEGRO'
--		END) AS 'Color Turno'
--FROM Turno

/*
DECLARE @contador int=0
WHILE @contador <=10
BEGIN
	print @contador
	SET @contador = @contador + 1
	IF @contador=3
		BREAK
END
print 'Sigue ejecutando'
*/

DECLARE @contador int
--SET @contador = 'texto'
BEGIN TRY
	SET @contador='texto'
END TRY
BEGIN CATCH
	print 'No es posible asignar un texto a la variable @contador por ser de tipo numero'
END CATCH