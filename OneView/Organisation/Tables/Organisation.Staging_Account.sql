
CREATE OR ALTER TABLE Organisation.Staging_Account
(
    AccountID           INT
    ,ClientReference    NVARCHAR(4)
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
)