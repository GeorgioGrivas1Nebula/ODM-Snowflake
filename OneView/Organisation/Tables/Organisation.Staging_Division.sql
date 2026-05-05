
CREATE OR ALTER TABLE Organisation.Staging_Division
(
	DivisionId         INT  
    ,ClientReference   NVARCHAR(4)
    ,ClientId          INT              
	,Division          NVARCHAR(200)
    ,DivisionReference NVARCHAR(50)
    ,Email             NVARCHAR
    ,SRBit             BOOLEAN
    ,_InsertedById     INT
    ,_InsertedDate     DATETIME
    ,_UpdatedById      INT
    ,_UpdatedDate      DATETIME
    ,_IsDeleted        BOOLEAN
)