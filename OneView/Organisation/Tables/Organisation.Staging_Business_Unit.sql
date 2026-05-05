
CREATE OR ALTER TABLE Organisation.Staging_Business_Unit
(
	BusinessUnitID     INT
    ,ClientId          INT              
	,BusinessUnitGUID   UUID 
    ,BusinessUnit       NVARCHAR(150)
    ,_InsertedById     INT
    ,_InsertedDate     DATETIME
    ,_UpdatedById      INT
    ,_UpdatedDate      DATETIME
    ,_IsDeleted        BOOLEAN
)