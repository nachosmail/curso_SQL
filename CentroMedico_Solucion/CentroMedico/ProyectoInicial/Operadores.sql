--DECLARE @num1 decimal(9,2)=20.453
--DECLARE @num2 decimal(9,2)=30.555
--DECLARE @result decimal(9,2)

----SET @result = @num1 + @num2
----SET @result = @num1 - @num2
----SET @result = @num1 / @num2
----SET @result = @num1 * @num2
----SET @result = @num1 % @num2 --resto de la division
--SELECT @result

--DECLARE @num1 varchar(10)='Hola!'
--DECLARE @num2 varchar (20)='Mi nombre es pedrito'
--DECLARE @result varchar(30)
--SET @result = @num1 + @num2

--SELECT @result

--DECLARE @num1 decimal (9,2)=20
--DECLARE @num2 decimal (9,2)=30
--DECLARE @result decimal (9,2)

--IF @num2<=@num1
--	print 'Es mayor'
--ELSE 
--	print 'Es menor'

--DECLARE @texto1 varchar(20) = 'Hola me llamo'
DECLARE @texto1 varchar(50)='Hola me llamo Robertita'
DECLARE @texto2 varchar(50) = 'Hola me llamo Robertito'
DECLARE @result decimal (9,2)

IF @texto1>@texto2
	print 'Es mayor'
ELSE 
	print 'Es menor'


/*
OPERADORES:
+ - / * % < <= > >= <>
*/