SELECT 
        Orders.OrderKey AS [Order Number],
        OrderRows.[Line Number] AS [Line Number],
        Orders.[Order Date],
        Orders.[Delivery Date],
        Orders.CustomerKey,
        Orders.StoreKey,
        OrderRows.ProductKey,
        OrderRows.Quantity,
        OrderRows.[Unit Price],
        OrderRows.[Net Price],
        OrderRows.[Unit Cost],
        Orders.[Currency Code],
        [CurrencyExchange].Exchange AS [Exchange Rate]
    FROM
        [Data].Orders  
            LEFT OUTER JOIN [Data].OrderRows
                ON Orders.OrderKey = OrderRows.OrderKey
            LEFT OUTER JOIN [Data].[CurrencyExchange]
                ON 
                    [CurrencyExchange].Date = Orders.[Order Date] AND
                    [CurrencyExchange].[ToCurrency] = Orders.[Currency Code] AND
                    [CurrencyExchange].[FromCurrency] = 'USD'