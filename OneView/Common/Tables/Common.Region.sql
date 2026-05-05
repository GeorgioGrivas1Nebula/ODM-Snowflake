
CREATE TABLE IF NOT EXISTS Common.Region
(
	_ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER,
	OneViewId  INT,
    ClientId            INT,
    Region           NVARCHAR (50),
    Email            NVARCHAR (250),
    Business_Manager NVARCHAR (500),
    Regional_Manager NVARCHAR (500),
    _InsertedById      INT,
    _InsertedDate        DATETIME,
    _UpdatedById    INT,
    _UpdatedDate      DATETIME,
    _DeletedBit       BOOLEAN,
    primary key (_ID)
)