
CREATE OR ALTER TABLE Organisation.Entity
(
    _ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER
    ,OneViewID INT COMMENT 'Source-system identifier from OneView' 
    ,ClientID          INT            
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
    ,_InsertedByID      INT
    ,_InsertedDate        DATETIME
    ,_UpdatedByID    INT
    ,_UpdatedDate      DATETIME
    ,_IsDeleted       BOOLEAN
    ,primary key (_ID)
)