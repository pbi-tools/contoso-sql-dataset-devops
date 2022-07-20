let
    Source = Sql.Database(#"[SQL Server]", #"[SQL Database]"),
    dbo_Date = Source{[Schema=#"[SQL Schema]",Item="Date"]}[Data]
in
    dbo_Date