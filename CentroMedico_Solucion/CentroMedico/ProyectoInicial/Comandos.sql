--EJECUTAR STORE PROCEDURE .. SIMILAR A FUNCION
EXEC S_Paciente 8

--DECLARACION DE VARIABLES
DECLARE @ordenamiento CHAR(1)-- = 'A'
DECLARE @valorOrdenamiento CHAR(1)
SET @valorOrdenamiento = ISNULL(@ordenamiento,'A')
SELECT @valorOrdenamiento


--SELECT

--SELECT * FROM Paciente
--SELECT * FROM Paciente WHERE apellido='smail' and nombre='Ignacio'
--SELECT idPaciente,nombre,apellido FROM Paciente
--SELECT TOP 2 * FROM Paciente WHERE apellido='smail' --ordena automaticamente por el PK
--SELECT TOP 1 * FROM Turno ORDER BY fechaTurno ASC
--SELECT TOP 1 * FROM Turno ORDER BY fechaTurno DESC
--SELECT * FROM Paciente ORDER BY fNacimiento DESC
--SELECT DISTINCT domicilio,apellido FROM Paciente --agrupa los registros por campo
--SELECT apellido FROM Paciente GROUP BY apellido --parecido al distinct
--SELECT apellido,MAX (idPaciente) FROM Paciente GROUP BY apellido
--SELECT SUM(idPaciente),apellido FROM Paciente GROUP BY apellido
--SELECT AVG(idPaciente),apellido FROM Paciente GROUP BY apellido
--SELECT COUNT (telefono) FROM Paciente WHERE apellido='Smail'

SELECT estado FROM Turno GROUP BY estado HAVING COUNT(estado)>2 --HAVING permite count, entre otras?

--SELECT * FROM Paciente WHERE apellido='Smail' AND nombre='adrian' AND idPaciente='1'
--SELECT * FROM Paciente WHERE apellido='Smail' OR nombre='adrian' OR idPaciente='1'

--SELECT * FROM Turno WHERE estado IN(2,1)
--SELECT * FROM Paciente WHERE apellido IN('perez','smail')
--SELECT * FROM Paciente WHERE apellido NOT IN('perez','smail')
--SELECT * FROM Paciente WHERE nombre LIKE '%na%o' --el % hace de comodin tanto al principio o al final
--SELECT * FROM Paciente WHERE nombre NOT LIKE '%na%o'
--SELECT * FROM Paciente WHERE idPaciente BETWEEN 1 AND 2
--SELECT * FROM Paciente WHERE idPaciente NOT BETWEEN 1 AND 2

SELECT * FROM Turno WHERE fechaTurno BETWEEN '20190102' AND '20200106'

SELECT * FROM Paciente WHERE apellido='Smail' AND (nombre='adrian' OR idPaciente=7 OR idPais='PER') 
and idPaciente IN(1,7)


--INSERT
--INSERT INTO Paciente values ('Roberto','Perez','2017-01-04','Piedra buena 21','COL','','','')
INSERT INTO Paciente (nombre,apellido,fNacimiento,domicilio,idPais,telefono,email,observacion)
values ('Adrian','Smail','1958-07-08','CalleFalsa 256','COL','1156985265','adrian.pichon@google.com','Comentario actualizado')

--UPDATE
UPDATE Paciente SET idPais='PER' WHERE idPaciente=1

--DELETE
DELETE FROM Paciente WHERE idPaciente=7


SP_HELP Pais
SP_HELP Paciente
SP_HELP ALTA_Medico
SP_HELPTEXT ALTA_Turno

--CREATE TYPE pais FROM CHAR(3)

/*ALTER FUNCTION nombreFun (@var int)
RETURNS int

AS
BEGIN
	SET @var = @var*5
	RETURN @var
END

SELECT dbo.nombreFun(5)
*/

/* ALTER EN TABLAS
SELECT * FROM Paciente
ALTER TABLE Paciente ADD estado smallint --agrega una columna a la tabla
ALTER TABLE Paciente ALTER COLUMN estado bit --cambia el tipo de dato
ALTER TABLE Paciente DROP COLUMN estado --elimina la columna
*/

/*
SELECT * FROM EJEMPLO
CREATE TABLE ejemplo (campo0 int IDENTITY (1,1),campo1 int,campo2 int) --CREA TABLA
DROP TABLE ejemplo --ELIMINA TABLA
INSERT INTO EJEMPLO VALUES(2,3)
TRUNCATE TABLE EJEMPLO
*/

/*
DECLARE @var1 VARCHAR(20)
DECLARE @var2 VARCHAR(20)
DECLARE @var3 INT
SET @var1 ='Ramiro'
SET @var2='Gonzalez'
SET @var3=123
--print LEFT(@var1,3)
--print RIGHT(@var1,4)
--print LEFT(@var1,1) + LEFT(@var2,1)
--print LEN(@var2)
print LEN(@var3)
*/
/*
DECLARE @var3 VARCHAR(20)
DECLARE @var4 VARCHAR(20)
SET @var3 = 'RAMIRO'
SET @var4='gonzalez'
--print LOWER(@var3)
--print UPPER(@var4)
print UPPER(LEFT(@var3,1)) + LOWER(RIGHT(@var3,LEN(@var3)-1)) + ' ' + UPPER(LEFT(@var4,1)) + LOWER(RIGHT(@var4,LEN(@var4)-1))
*/

/*
DECLARE @var1 VARCHAR(20)
DECLARE @var2 VARCHAR(20)
DECLARE @var3 VARCHAR(20)
DECLARE @var4 VARCHAR(20)
SET @var1 ='Ramir"o'
SET @var2='Gonz@alez'
SET @var3= '  Ramiro  '
SET @var4= ' Gonzalez  '

--SELECT REPLACE(@var1,'"','')
--SELECT REPLACE(@var2,'@','')
--SELECT REPLICATE(@var1,3)
--PRINT LTRIM(RTRIM(@var3)) + ' ' + LTRIM(RTRIM(@var4)) + '*'
SELECT CONCAT (@VAR1,' ',@VAR2) --N PARAMETROS!

*/

SELECT GETDATE() --OBTIENE FECHA ACTUAL
SELECT GETUTCDATE() --OBTIENE FECHA ACTUAL EN FORMATO UTC

SELECT DATEADD(DAY,2,GETDATE()) --AÑADE O QUITA UN PARAMETRO DE FECHA( AÑO, MES, DIA, HORA ETC)
SELECT DATEADD(YEAR,-2,GETDATE())
SELECT DATEADD(MM,-2,GETDATE())
SELECT DATEADD(MI,-2,GETDATE())
SELECT DATEDIFF(YEAR,GETDATE(),'20170120') --DIFERENCIA DEL PARAMETRO ENTRE DOS FECHAS DADAS
SELECT DATEDIFF(MM,GETDATE(),'20170120')
SELECT DATEPART(MI,GETDATE()) -- DEVUELVE UN VALOR ESPECIFICO DE LA FECHA (PARAMETRO)
SELECT DATEPART(DW,GETDATE()) --DIA DE LA SEMANA

DECLARE @var1 VARCHAR(30)
DECLARE @var2 VARCHAR(30)
SET @var1 = '201802'
SET @var2='PEDRO'
--SELECT ISDATE (@var1)
--SELECT ISDATE (@var2)

PRINT ISDATE(@var1)

IF ISDATE('202002')=1
	PRINT 'ES UNA FECHA'
ELSE
	PRINT 'NO ES UNA FECHA'

CAST --CONVIERTE UN DATO DENTRO DE LA MISMA CATEGORIA
CONVERT --IMPLEMENTACION DE CAST CON PARAMETROS Y MAS DETALLE

-------------------------------

DECLARE @fecha DATETIME
SET @fecha=GETDATE()
DECLARE @numero MONEY
SET @numero=500.40
PRINT @fecha
--PRINT @numero
--SELECT CAST(@numero AS INT) AS numero

/*
SELECT * FROM PACIENTE
SELECT CAST(IDPACIENTE AS MONEY) FROM PACIENTE
*/

SELECT CONVERT(CHAR(20),@fecha,111)
--https://www.w3schools.com/sql/func_sqlserver_convert.asp
