let
    Source = Sql.Database(#"[SQL Server]", #"[SQL Database]"),
    #"dbo_Currency Exchange" = Source{[Schema=#"[SQL Schema]",Item="Currency Exchange"]}[Data]
in
    #"dbo_Currency Exchange"