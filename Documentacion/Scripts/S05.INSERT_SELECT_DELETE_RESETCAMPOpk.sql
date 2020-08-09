INSERT INTO tabla1 values(1)

SELECT * FROM tabla1

DELETE FROM tabla1

dbcc CHECKIDENT ('tabla1',RESEED,0) --reiniciar el campo col1 (autoincremental y clave principal)