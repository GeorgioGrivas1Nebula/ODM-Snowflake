
CREATE OR ALTER TABLE Organisation.User_Cost_Centre
(
    _ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER
	,OneViewID INT COMMENT 'Source-system identifier from OneView' 
    ,ClientId               INT         
    ,UserId                 INT             
    ,CostCentreId           INT
    ,_InsertedById          INT
    ,_InsertedDate          DATETIME
    ,_UpdatedById           INT
    ,_UpdatedDate           DATETIME
    ,_IsDeleted             BOOLEAN
    ,primary key (_ID)
)