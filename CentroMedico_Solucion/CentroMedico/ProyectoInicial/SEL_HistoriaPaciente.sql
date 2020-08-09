--EXEC SEL_HistoriaPaciente 4

ALTER PROC SEL_HistoriaPaciente(
				@idPaciente paciente
				)
AS
SET NOCOUNT ON

/*
SELECT * FROM HISTORIA
SELECT * FROM HISTORIAPACIENTE
*/

IF EXISTS(SELECT * FROM Paciente P
				INNER JOIN HistoriaPaciente HP
				ON HP.idPaciente=P.idPaciente
				INNER JOIN Historia H
				ON H.idHistoria=HP.idHistoria
				INNER JOIN MedicoEspecialidad ME
				ON ME.idMedico=HP.idMedico
				INNER JOIN Medico M
				ON M.idMedico=ME.idMedico
				WHERE P.idPaciente=@idPaciente)
	SELECT * FROM Paciente P
	INNER JOIN HistoriaPaciente HP
	ON HP.idPaciente=P.idPaciente
	INNER JOIN Historia H
	ON H.idHistoria=HP.idHistoria
	INNER JOIN MedicoEspecialidad ME
	ON ME.idMedico=HP.idMedico
	INNER JOIN Medico M
	ON M.idMedico=ME.idMedico
	WHERE P.idPaciente=@idPaciente
ELSE
	--PRINT 'NO EXISTEN HISTORIAS CLINICAS PARA EL PACIENTE'
	SELECT 0 AS RESULTADO
