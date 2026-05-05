
CREATE OR REPLACE TABLE Organisation.Staging_Owner_Type
(
	OwnerTypeId INT,
    ClientReference NVARCHAR (4),
    ClientId          INT,
    OwnerType     NVARCHAR (50),
    DivisionID    INT,
    SRBit         BOOLEAN,
    _InsertedById      INT,
    _InsertedDate        DATETIME,
    _UpdatedById    INT,
    _UpdatedDate      DATETIME,
    _IsDeleted       BOOLEAN
)
