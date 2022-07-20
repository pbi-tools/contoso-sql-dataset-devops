let
    Source = Sql.Database(#"[SQL Server]", #"[SQL Database]"),
    dbo_Sales = Source{[Schema=#"[SQL Schema]",Item="Sales"]}[Data]
in
    dbo_Sales