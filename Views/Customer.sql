	SELECT
		[CustomerKey],
		[Gender],
		[GivenName] + ' ' + [Surname] AS [Name],
		[StreetAddress] AS [Address],
		[City],
		[State] AS [State Code],
		StateFull AS [State],
		ZipCode AS [Zip Code],
		[Country] as [Country Code],
		[CountryFull] as [Country],
		[Continent],
		[Birthday],
		[Age] as [Age]
	FROM
		[Data].Customer