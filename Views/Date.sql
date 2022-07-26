    SELECT 
      [Date], 
      -- [DateKey],  -- We do not import DateKey in the view
      [Year], 
      [Year Quarter], 
      [Year Quarter Number], 
      [Quarter], 
      [Year Month], 
      [Year Month Short], 
      [Year Month Number], 
      [Month], 
      [Month Short], 
      [Month Number], 
      [Day of Week], 
      [Day of Week Short], 
      [Day of Week Number], 
      [Working Day], 
      [Working Day Number] 
    FROM 
      [Data].[Date]