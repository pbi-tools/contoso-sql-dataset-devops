let
    Source = Sql.Database(#"[SQL Server]", #"[SQL Database]"),
    dbo_Product = Source{[Schema=#"[SQL Schema]",Item="Product"]}[Data]
in
    dbo_Product