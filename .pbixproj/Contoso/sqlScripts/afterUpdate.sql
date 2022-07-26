DECLARE @name VARCHAR(128)
DECLARE @SQL VARCHAR(254)
DECLARE @schema VARCHAR(128) = TRIM( '[]' FROM  '$schema$')

PRINT 'Dropping all views in schema: [' + @schema + ']'

SELECT @name = ( SELECT TOP 1 v.[name]
    FROM sys.views v
    INNER JOIN sys.schemas sch ON sch.schema_id = v.schema_id AND sch.name = @schema
    WHERE v.type = 'V'
)

WHILE @name IS NOT NULL
BEGIN
    SELECT @SQL = 'DROP VIEW [' + @schema + '].[' + RTRIM(@name) +']'
    EXEC (@SQL)
    PRINT 'Dropped View: ' + @name
    SELECT @name = ( SELECT TOP 1 v.[name]
        FROM sys.views v
        INNER JOIN sys.schemas sch ON sch.schema_id = v.schema_id AND sch.name = @schema
        WHERE v.type = 'V'
    )
END
GO