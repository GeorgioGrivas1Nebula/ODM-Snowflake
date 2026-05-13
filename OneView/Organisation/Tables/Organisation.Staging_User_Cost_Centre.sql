
CREATE OR ALTER TABLE Organisation.Staging_User_Cost_Centre
(
	UserCostCentreID            INT  
    ,ClientReference          NVARCHAR(4)
    ,ClientId               INT         
    ,UserId                 INT             
    ,CostCentreId           INT
    ,_InsertedById          INT
    ,_InsertedDate          DATETIME
    ,_UpdatedById           INT
    ,_UpdatedDate           DATETIME
    ,_IsDeleted             BOOLEAN
)