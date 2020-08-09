/*
SELECT * FROM Turno
SELECT * FROM TurnoEstado
*/

USE CentroMedico
GO
UPDATE Turno SET estado=2 
WHERE CONVERT(CHAR(8),fechaTurno,112) < CONVERT(CHAR(8),GETDATE(),112)
AND estado=0

SELECT * FROM TURNO WHERE estado=2
AND
fechaTurno<GETDATE()