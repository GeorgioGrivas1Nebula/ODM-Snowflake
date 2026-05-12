CREATE OR ALTER TABLE Common.Staging_Country
(
	CountryId       	INT,
	Link               	INT,
	Country            	NVARCHAR(200),
	ContinentRegionID  	INT,
	CurrencyId	 		INT,
	ISO31661alpha2     	CHAR(2),
	ISO31661alpha3     	CHAR(3),
	UNNumericalCode    	CHAR(3),
	Flag               	NVARCHAR(500),
	_InsertedById      	INT,
	_InsertedDate       DATETIME,
	_UpdatedById       	INT,
	_UpdatedDate       	DATETIME,
	_IsDeleted       	BOOLEAN
)

