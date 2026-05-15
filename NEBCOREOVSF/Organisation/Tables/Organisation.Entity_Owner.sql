
CREATE OR ALTER TABLE Organisation.Entity_Owner
(
    _ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER
    ,OneViewID INT COMMENT 'Source-system identifier from OneView' 
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
    ,primary key (_ID)
)