
CREATE OR ALTER TABLE Organisation.Allocation_Group
(
    _ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER 
    ,OneViewID INT     
    ,ClientReference        NVARCHAR(4)
    ,ClientId               INT         
    ,AllocationGroup        NVARCHAR(100)       
    ,_InsertedById          INT
    ,_InsertedDate          DATETIME
    ,_UpdatedById           INT
    ,_UpdatedDate           DATETIME
    ,_IsDeleted             BOOLEAN
    ,primary key (_ID)
)