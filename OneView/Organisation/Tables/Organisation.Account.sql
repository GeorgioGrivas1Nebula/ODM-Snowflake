
CREATE TABLE IF NOT EXISTS Organisation.Account
(
    _ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER
    ,OneViewID           INT   
    ,ClientId               INT         
    ,AccountGUID        UUID
    ,AccountNo          NVARCHAR (20) 
    ,AccountName        NVARCHAR (100)
    ,AccountTradeName   NVARCHAR (100)
    ,Link               INT             
    ,StatusDetailID     INT             
    ,TypeDetailID       INT             
    ,ClientVendorID     INT             
    ,OwnerID            INT             
    ,Excluded           BOOLEAN             
    ,ExcludedComment    NVARCHAR (100)  
    ,_InsertedById      INT
    ,_InsertedDate      DATETIME
    ,_UpdatedById       INT
    ,_UpdatedDate       DATETIME
    ,_IsDeleted         BOOLEAN
    ,primary key (_ID)
)