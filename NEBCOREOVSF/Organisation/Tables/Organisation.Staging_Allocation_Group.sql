
CREATE OR ALTER TABLE Organisation.Staging_Allocation_Group
(
    AllocationGroupID       INT        
    ,ClientReference        NVARCHAR(4)
    ,ClientId               INT         
    ,AllocationGroup        NVARCHAR(100)       
    ,_InsertedById          INT
    ,_InsertedDate          DATETIME
    ,_UpdatedById           INT
    ,_UpdatedDate           DATETIME
    ,_IsDeleted             BOOLEAN
)