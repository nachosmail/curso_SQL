/*
SELECT * FROM Turno
SELECT * FROM TurnoEstado
*/

UPDATE Turno SET estado=2 
WHERE CONVERT(CHAR(8),fechaTurno,112) < CONVERT(CHAR(8),GETDATE(),112)
AND estado=0