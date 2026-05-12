CREATE OR REPLACE TABLE Common.Client_Vendor
(
    _ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER
    ,OneViewId              INT      
    ,ClientID               INT
    ,VendorId               INT
    ,TypeDetailID           INT       
    ,StatusDetailID         INT          
    ,AdministratorEmail     NVARCHAR (200)
    ,BYOD                   BOOLEAN        
    ,GLAccountNo            NVARCHAR         
    ,_InsertedById          INT
    ,_InsertedDate          DATETIME
    ,_UpdatedById           INT
    ,_UpdatedDate           DATETIME
    ,_IsDeleted             BOOLEAN
    ,primary key (_ID)
)

