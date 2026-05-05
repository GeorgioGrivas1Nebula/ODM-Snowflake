CREATE TABLE IF NOT EXISTS Common.Staging_Client_Vendor
(
    ClientVendorID          INT        
    ,ClientReference        NVARCHAR(4)
    ,ClientId               INT           
    ,VendorReference        NVARCHAR(4)
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
)