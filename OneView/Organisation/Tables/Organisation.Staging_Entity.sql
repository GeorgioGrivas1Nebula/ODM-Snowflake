
CREATE OR REPLACE TABLE Organisation.Staging_Entity
(
    EntityID         INT     
    ,ClientReference             NVARCHAR (4)
    ,ClientId          INT            
    ,EntityGUID       NCHAR (32)    
    ,ParentEntityID   INT           
    ,OwnerID          INT           
    ,Entity           NVARCHAR (150)
    ,Description      NVARCHAR (200)
    ,UserLabel        NVARCHAR (200)
    ,KnownExceptions  NVARCHAR (200)
    ,TypeID           INT           
    ,StatusID         INT           
    ,AccountID        INT           
    ,ClientVendorID   INT           
    ,CapacityGroupID  INT           
    ,CacheGUID        NCHAR (32)    
    ,CacheGUIDUpdated DATETIME      
    ,_InsertedById      INT
    ,_InsertedDate        DATETIME
    ,_UpdatedById    INT
    ,_UpdatedDate      DATETIME
    ,_IsDeleted       BOOLEAN
)