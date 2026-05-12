
CREATE OR REPLACE TABLE Organisation.Staging_Entity_Product
(
    EntityProductID         INT             
    ,ClientId           INT 
    ,ClientReference    NVARCHAR(4)
    ,EntityProductGUID      UUID
    ,Description            NVARCHAR(255)  
    ,Manufacturer           NVARCHAR(255)  
    ,ProductCode            NVARCHAR(255)  
    ,Gateway                BOOLEAN             
    ,GatewaySwitch          BOOLEAN             
    ,EntityTypeDetailID     INT             
    ,ImportID               INT             
    ,_InsertedById          INT
    ,_InsertedDate          DATETIME
    ,_UpdatedById           INT
    ,_UpdatedDate           DATETIME
    ,_IsDeleted             BOOLEAN
)