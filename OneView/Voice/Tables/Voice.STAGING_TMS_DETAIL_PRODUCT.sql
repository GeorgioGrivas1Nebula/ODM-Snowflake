
CREATE OR ALTER TABLE Voice.STAGING_TMS_DETAIL_PRODUCT
(
	TMSDetailProductID      INT
    ,ClientReference        NVARCHAR(4)
    ,ClientId               INT
    ,ProductDescription     NVARCHAR(500)
    ,DisplayDescription     NVARCHAR(500)
    ,Notes                  NVARCHAR(200)
    ,ShowBudget             BOOLEAN
    ,ShowUsage              BOOLEAN
    ,_InsertedById          INT
    ,_InsertedDate          DATETIME
    ,_UpdatedById           INT
    ,_UpdatedDate           DATETIME
    ,_IsDeleted             BOOLEAN
)