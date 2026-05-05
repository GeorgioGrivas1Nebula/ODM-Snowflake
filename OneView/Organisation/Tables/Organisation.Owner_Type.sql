
CREATE OR ALTER TABLE Organisation.Owner_Type
(
	_ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER,
    OneViewID INT,
    ClientId          INT,
    OwnerType     NVARCHAR (50),
    DivisionID    INT,
    SRBit         BOOLEAN,
    _InsertedById      INT,
    _InsertedDate        DATETIME,
    _UpdatedById    INT,
    _UpdatedDate      DATETIME,
    _IsDeleted       BOOLEAN,
    primary key (_ID)
)
