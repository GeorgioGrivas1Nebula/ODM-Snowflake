
CREATE OR REPLACE TABLE Organisation.Staging_User_Cost_Centre
(
	UserCostCentreID            INT  
    ,ClientReference          NVARCHAR(4)
    ,ClientId               INT         
    ,CostCentreId           INT
    ,Email                  NVARCHAR
    ,UserId                 INT             
    ,_InsertedById          INT
    ,_InsertedDate          DATETIME
    ,_UpdatedById           INT
    ,_UpdatedDate           DATETIME
    ,_IsDeleted             BOOLEAN
)