--SELECT * FROM Turno
--SELECT * FROM TurnoPaciente
--SELECT * FROM MEDICO
--SELECT * FROM Paciente
--INSERT INTO Medico VALUES('Pablo','Ramirez')

EXEC ALTA_Turno '20180304 10:15',4,1,'EL paciente tiene que estar en ayunas'

ALTER PROC ALTA_Turno(
			@fecha char(14), --20190215 12:00
			--@hora char(5), --12:00
			@idPaciente paciente,
			@idMedico medico,
			@observacion observacion=''
			)

AS

/*
	ESTADO=0 --> PENDIENTE
	ESTADO=1 --> REALIZADO
	ESTADO=2 --> CANCELADO
*/
SET NOCOUNT ON

IF NOT EXISTS(SELECT TOP 1 idTurno FROM Turno WHERE fechaTurno=@fecha)
BEGIN
	INSERT INTO Turno (fechaTurno,estado,observacion)
	VALUES (@fecha,0,@observacion)

	DECLARE @auxIdTurno turno
	SET @auxIdTurno = @@IDENTITY --@@IDENTITY OBTIENE EL ULTIMO VALOR INSERTADO CON EL CAMPO IDENTITY ON

	INSERT INTO TurnoPaciente (idTurno,idPaciente,idMedico)
	VALUES (@auxIdTurno,@idPaciente,@idMedico)
	print 'El turno se agrego con exito!'
	RETURN
END
ELSE
BEGIN
	print 'El turno ya existe.'
	RETURN
END