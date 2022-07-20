let
    Source = Sql.Database(#"[SQL Server]", #"[SQL Database]"),
    dbo_Store = Source{[Schema=#"[SQL Schema]",Item="Store"]}[Data]
in
    dbo_Store