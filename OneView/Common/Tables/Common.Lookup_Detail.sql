CREATE OR ALTER TABLE Common.Lookup_Detail
(
	_ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER,
    OneViewID INT,
	GroupId INT,
    Reference NVARCHAR (25),
    ClientId          INT,
    ShortDescription  NVARCHAR (200),
    LongDescription   NVARCHAR (500),
    SystemBit            BOOLEAN,
    ActiveBit         BOOLEAN,
    ParentDetailID    INT,
    ClientVisibleBit  BOOLEAN,
    _InsertedById      INT,
    _InsertedDate        DATETIME,
    _UpdatedById    INT,
    _UpdatedDate      DATETIME,
    _IsDeleted       BOOLEAN,
    primary key (_ID)
)
