DECLARE @schema VARCHAR(128) = TRIM( '[]' FROM  '$schema$')
DECLARE @search VARCHAR(128) = '$SCHEMA_BASE_NAME$%'

DECLARE @schemaName VARCHAR(128)
DECLARE @viewName VARCHAR(128)
DECLARE @SQL VARCHAR(254)

SELECT @schemaName = (SELECT TOP 1 [name] FROM sys.schemas WHERE [name] LIKE @search AND [name] <> @schema)

WHILE @schemaName IS NOT NULL
BEGIN

	SELECT @viewName = ( SELECT TOP 1 v.[name]
		FROM sys.views v
		INNER JOIN sys.schemas sch ON sch.schema_id = v.schema_id AND sch.name = @schemaName
		WHERE v.type = 'V'
	)

	WHILE @viewName IS NOT NULL
	BEGIN
	    SELECT @SQL = 'DROP VIEW [' + @schemaName + '].[' + RTRIM(@viewName) +']'
		EXEC (@SQL)
		PRINT 'Dropped View: [' + @schemaName + '].[' + RTRIM(@viewName) +']'
		SELECT @viewName = ( SELECT TOP 1 v.[name]
			FROM sys.views v
			INNER JOIN sys.schemas sch ON sch.schema_id = v.schema_id AND sch.name = @schemaName
			WHERE v.type = 'V'
		)
	END

	SELECT @SQL = 'DROP SCHEMA [' + @schemaName + ']'
	EXEC (@SQL)
	PRINT 'Dropped Schema: ' + @schemaName

	SELECT @schemaName = (SELECT TOP 1 [name] FROM sys.schemas WHERE [name] LIKE @search AND [name] <> @schema)
END
GO