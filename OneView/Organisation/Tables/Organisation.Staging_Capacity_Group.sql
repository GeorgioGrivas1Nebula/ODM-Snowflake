
CREATE OR ALTER TABLE Organisation.Staging_Capacity_Group
(
    CapacityGroupID         INT        
    ,ClientReference        NVARCHAR(4)
    ,ClientId               INT         
    ,CapacityGroup          NVARCHAR(50)  
    ,Multiplier             DECIMAL(18, 2)
    ,CapacityAmount         INT            
    ,_InsertedById          INT
    ,_InsertedDate          DATETIME
    ,_UpdatedById           INT
    ,_UpdatedDate           DATETIME
    ,_IsDeleted             BOOLEAN
)