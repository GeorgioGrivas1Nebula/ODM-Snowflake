CREATE OR REPLACE TABLE Organisation.Division
(
	_ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER
    ,OneViewID INT
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
    ,primary key (_ID)
)
