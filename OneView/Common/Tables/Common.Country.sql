
CREATE OR ALTER TABLE Common.Country
(
	_ID 				NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER,
    OneViewId   		INT,
	ClientID           	INT,
	Link               	INT,
	Country            	NVARCHAR(200),
	ContinentRegionID  	INT,
	ISO31661alpha2     	CHAR(2),
	ISO31661alpha3     	CHAR(3),
	UNNumericalCode    	CHAR(3),
	Flag               	NVARCHAR(500),
    _InsertedById      INT,
    _InsertedDate        DATETIME,
    _UpdatedById    INT,
    _UpdatedDate      DATETIME,
    _IsDeleted       BOOLEAN,
    primary key (_ID)
)