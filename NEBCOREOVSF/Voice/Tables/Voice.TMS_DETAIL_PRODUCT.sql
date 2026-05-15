
CREATE OR ALTER TABLE Voice.TMS_DETAIL_PRODUCT
(
	_ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER
    ,OneViewID INT
    ,ClientId               INT         
    ,ProductDescription     NVARCHAR(500)
    ,DisplayDescription   NVARCHAR(500)
    ,Notes                  NVARCHAR(200)
    ,ShowBudget             BOOLEAN
    ,ShowUsage                  BOOLEAN
    ,_InsertedById          INT
    ,_InsertedDate          DATETIME
    ,_UpdatedById           INT
    ,_UpdatedDate           DATETIME
    ,_IsDeleted             BOOLEAN
    ,primary key (_ID)
)