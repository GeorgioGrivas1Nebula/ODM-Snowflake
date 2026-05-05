
CREATE OR ALTER TABLE Organisation.Staging_Entity_Owner
(
    EntityOwnerID       INT 
    ,ClientReference             NVARCHAR (4)
    ,ClientId          INT     
    ,PeriodDate         DATE    
    ,EntityID           INT     
    ,OwnerID            INT     
    ,CostCentreID       INT     
    ,DivisionID         INT     
    ,TMSVendorID        INT     
    ,TMSDetailProductID INT     
    ,TMSAllowance       DECIMAL(18,2)   
    ,AllocationGroupID  INT     
    ,EmployeeID         INT     
    ,DefaultBit         BOOLEAN     
    ,VoiceDefault       BOOLEAN         
    ,_InsertedById      INT
    ,_InsertedDate      DATETIME
    ,_UpdatedById       INT
    ,_UpdatedDate       DATETIME
    ,_IsDeleted         BOOLEAN
)