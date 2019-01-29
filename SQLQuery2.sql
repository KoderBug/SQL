

PRINT 'Hello World'

DECLARE @myVariable INT 
SET @myVariable = 6
PRINT @myVariable

DECLARE @var1 INT, @var2 INT
SET @var1 = 3
SET @var2 = 5

PRINT char(9) + 'I have ' + CONVERT(VARCHAR(50),@var1) + CHAR(13) + ' dollars...'


DECLARE @var1 INT, @var2 INT
SET @var1 = 7
SET @var2 = 5

PRINT 'Variable 1 = ' + CONVERT(VARCHAR(5),@var1) + CHAR(13) + ' Variable 2 = ' + CONVERT(varchar(5),@var2) + CHAR(13) + 'Total: '
PRINT @var1 + @var2 

 IF @var1 != 3
	BEGIN
		PRINT 'Variable 1 is NOT ' + CONVERT(VARCHAR(5),@var1) + CHAR(13)
	END
ELSE
	BEGIN
		PRINT 'Variable 1 is not < ' + CONVERT(VARCHAR(5),@var1) + CHAR(13)

	END
