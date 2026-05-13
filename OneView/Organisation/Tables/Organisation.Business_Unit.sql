
CREATE OR ALTER TABLE Organisation.BUSINESS_UNIT
(
	_ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER
    ,OneViewID           INT   COMMENT 'Source-system identifier from OneView'  
    ,ClientId          INT              
	,BusinessUnitGUID   UUID 
    ,BusinessUnit       NVARCHAR(150)
    ,_InsertedById     INT
    ,_InsertedDate     DATETIME
    ,_UpdatedById      INT
    ,_UpdatedDate      DATETIME
    ,_IsDeleted        BOOLEAN
    ,primary key (_ID)
)