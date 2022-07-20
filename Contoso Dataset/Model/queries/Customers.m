let
    Source = Sql.Database(#"[SQL Server]", #"[SQL Database]"),
    dbo_Customer = Source{[Schema=#"[SQL Schema]",Item="Customer"]}[Data]
in
    dbo_Customer