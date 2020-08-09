USE CentroMedico
GO
INSERT INTO Turno values('20200302 13:00',0,'')
INSERT INTO Turno values('20200303 14:00',0,'')
INSERT INTO Turno values('20200303 15:30',1,'El paciente ha sido atendido')
INSERT INTO Turno values('20200305 18:00',2,'El paciente llamó para cancelar el turno')

SELECT * FROM Turno
