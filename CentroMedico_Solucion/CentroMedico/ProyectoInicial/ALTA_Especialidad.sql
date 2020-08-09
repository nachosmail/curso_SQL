--SELECT * FROM Especialidad

--EXEC ALTA_Especialidad 'OFTALMOLOGO'

ALTER PROC ALTA_Especialidad(@especialidad varchar(30))
AS
IF NOT EXISTS(SELECT TOP 1 idEspecialidad FROM Especialidad WHERE especialidad=@especialidad)
BEGIN
	INSERT INTO Especialidad (especialidad)
	VALUES (@especialidad)
	print 'Especialidad registrada con éxito!'
	RETURN
END
ELSE
BEGIN
	print 'No se pudo registrar la especialidad'
	RETURN
END

