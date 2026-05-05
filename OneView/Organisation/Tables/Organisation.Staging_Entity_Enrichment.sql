
CREATE OR ALTER TABLE Organisation.Staging_Entity_Enrichment
(
    EntityEnrichmentID   INT   
    ,ClientReference             NVARCHAR (4)
    ,ClientId          INT              
    ,EntityID             INT           
    ,EntityProductID      INT           
    ,UsedForComment       NVARCHAR(100)
    ,UsedForDetailID      INT           
    ,Bandwidth            BIGINT        
    ,AccessMediumDetailID INT           
    ,Cost                 DECIMAL(18,2)         
    ,NetworkCost          DECIMAL(18,2)         
    ,CostTerm             INT           
    ,PurchasedDate        DATETIME      
    ,InstalledDate        DATETIME      
    ,RemovedDate          DATETIME      
    ,Supplier             NVARCHAR(100)
    ,FirmwareVersion      NVARCHAR(100)
    ,SerialNumber         NVARCHAR(50) 
    ,Notes                NVARCHAR
    ,IP                   NVARCHAR(50) 
    ,Priority             TINYINT       
    ,Gateway             BOOLEAN            
    ,GatewaySwitch        BOOLEAN           
    ,PurchaseAmortised    BOOLEAN           
    ,Manufacturer         NVARCHAR(100)
    ,Model                NVARCHAR(50)  
    ,_InsertedById      INT
    ,_InsertedDate        DATETIME
    ,_UpdatedById    INT
    ,_UpdatedDate      DATETIME
    ,_IsDeleted       BOOLEAN
)