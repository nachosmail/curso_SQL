

--exec SELECT_turnospaciente 6 

CREATE PROC SELECT_TurnosPaciente(
				@idpaciente paciente
				)

AS
set nocount on

/*
select * from turno
select * from turnopaciente
select * from paciente
select * from MedicoEspecialidad
insert into medicoespecialidad values(1,2,'Medico Clinico')
*/

IF exists(SELECT * from Paciente P
				INNER JOIN TurnoPaciente TP
				ON TP.idPaciente = P.idPaciente
				INNER JOIN Turno T
				ON T.idTurno = TP.idTurno
				INNER JOIN MedicoEspecialidad M
				ON M.idMedico = TP.idMedico
				WHERE P.idpaciente = @idpaciente
				)
	SELECT * from Paciente P
	INNER JOIN TurnoPaciente TP
	ON TP.idPaciente = P.idPaciente
	INNER JOIN Turno T
	ON T.idTurno = TP.idTurno
	INNER JOIN MedicoEspecialidad M
	ON M.idMedico = TP.idMedico
	WHERE P.idpaciente = @idpaciente
else
	select 0 as resultado






