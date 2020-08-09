--SELECT * FROM Paciente

--DECLARE @fecha smalldatetime
--SET @fecha = '20180315 14:30:20'
--print @fecha

--EXEC ALTA_Paciente '23589658','Roberto Patricio','Aranguren','20160302','Calle 05','MEX','1188741234','RobertoPatricio@google.com','Un tipo loco'

ALTER PROC ALTA_Paciente(
			@dni varchar(20),
			@nombre varchar(50),
			@apellido varchar(50),
			@fNacimiento varchar(8), --si no contiene horas, sino varchar mas grande
			@domicilio varchar(50),
			@idPais char(3),
			@telefono varchar(20)='',
			@email varchar(30),
			@observacion observacion=''
			)

AS
SET NOCOUNT ON

--PARA ANALIZAR EL PROCESO -PRUEBA-
DECLARE @a bigint=0
WHILE @a <=1500000
	SET @a=@a + 1

IF NOT EXISTS(SELECT * FROM Paciente WHERE dni=@dni)
BEGIN
	INSERT INTO Paciente (dni,nombre,apellido,fNacimiento,domicilio,idPais,telefono,email,observacion)
	VALUES (@dni,@nombre,@apellido,@fNacimiento,@domicilio,@idPais,@telefono,@email,@observacion)
	print 'El paciente se agrego con exito!'
	RETURN
END
ELSE
BEGIN
	print 'El paciente ya existe.'
	RETURN
END
