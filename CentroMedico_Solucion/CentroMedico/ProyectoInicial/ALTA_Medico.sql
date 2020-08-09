--SELECT * FROM Medico
--SELECT * FROM MedicoEspecialidad

EXEC ALTA_Medico 'Rosa','Martinez',2,'Medico residente'

ALTER PROC ALTA_Medico(
			@nombre varchar(50),
			@apellido varchar(50),
			@idEspecialidad int,
			@descripcion varchar(50)
			)

AS

SET NOCOUNT ON

IF NOT EXISTS(SELECT TOP 1 idMedico FROM Medico WHERE nombre=@nombre AND apellido=@apellido)
BEGIN
	INSERT INTO Medico (nombre,apellido)
	VALUES (@nombre,@apellido)

	DECLARE @auxIdMedico int
	SET @auxIdMedico = @@IDENTITY --@@IDENTITY OBTIENE EL ULTIMO VALOR INSERTADO CON EL CAMPO IDENTITY ON

	INSERT INTO MedicoEspecialidad (idMedico,idEspecialidad,descripcion)
	VALUES (@auxIdMedico,@idEspecialidad,@descripcion)

	print 'El médico se registró con exito!'
	RETURN
END
ELSE
BEGIN
	print 'El medico ya existe.'
	RETURN
END