--EXEC SELECT_TurnoPaciente 2

ALTER PROC SELECT_TurnoPaciente(
				@idPaciente paciente
				)
AS
SET NOCOUNT ON

/*
SELECT * FROM Turno
SELECT * FROM TurnoPaciente
SELECT * FROM Paciente
SELECT * FROM MedicoEspecialidad
INSERT INTO MedicoEspecialidad VALUES(1,2,'Medico clinico')
*/


IF EXISTS(SELECT * FROM Paciente P
				INNER JOIN TurnoPaciente TP
				ON TP.idPaciente=P.idPaciente
				INNER JOIN Turno T
				ON T.idTurno=TP.idTurno
				--AND TP.idPaciente=P.idPaciente SE REPITE MAS ARRIBA
				INNER JOIN MedicoEspecialidad M
				ON M.idMedico=TP.idMedico
				WHERE P.idPaciente=@idPaciente)
	SELECT * FROM Paciente P
	INNER JOIN TurnoPaciente TP
	ON TP.idPaciente=P.idPaciente
	INNER JOIN Turno T
	ON T.idTurno=TP.idTurno
	--AND TP.idPaciente=P.idPaciente SE REPITE MAS ARRIBA
	INNER JOIN MedicoEspecialidad M
	ON M.idMedico=TP.idMedico
	WHERE P.idPaciente=@idPaciente
ELSE
	SELECT 0 AS RESULTADO
