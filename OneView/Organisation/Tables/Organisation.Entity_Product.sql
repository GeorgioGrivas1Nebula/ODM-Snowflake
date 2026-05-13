CREATE OR ALTER TABLE Organisation.Entity_Product
(
    _ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER
    ,OneViewID INT COMMENT 'Source-system identifier from OneView' 
    ,ClientId   INT
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
    ,primary key (_ID)
)