--EXEC DEL_Turno 12

ALTER PROC DEL_Turno(@idTurno turno)

AS
SET NOCOUNT ON

IF EXISTS (SELECT * FROM Turno WHERE idTurno=@idTurno)
BEGIN
		DELETE FROM Turno WHERE idTurno=@idTurno
		DELETE FROM TurnoPaciente WHERE idTurno=@idTurno
END
ELSE
	SELECT 0 AS RESULTADO
	

/*
SELECT * FROM TURNO
SELECT * FROM TURNOPACIENTE

ERROR:
Msg 547, Level 16, State 0, Procedure DEL_Turno, Line 10 [Batch Start Line 0]
The DELETE statement conflicted with the REFERENCE constraint "FK_TurnoPaciente_Turno". The conflict occurred in database "CentroMedico", table "dbo.TurnoPaciente", column 'idTurno'.
The statement has been terminated.

Completion time: 2020-08-07T16:01:48.5045896-03:00

*/
