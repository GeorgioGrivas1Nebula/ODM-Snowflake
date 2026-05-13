
CREATE OR ALTER TABLE Organisation.Entity_Enrichment
(
    _ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER
    ,OneViewID INT COMMENT 'Source-system identifier from OneView' 
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
    ,primary key (_ID)
)