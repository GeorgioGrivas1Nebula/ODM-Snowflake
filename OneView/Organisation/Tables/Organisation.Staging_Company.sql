
CREATE OR ALTER TABLE Organisation.Staging_Company
(
    CompanyID               INT        
    ,ClientReference        NVARCHAR(4)
    ,ClientId               INT           
    ,CompanyCode             NVARCHAR (6)   
    ,Name                    NVARCHAR 
    ,CurrencyID              INT            
    ,LanguageID              INT            
    ,_InsertedById          INT
    ,_InsertedDate          DATETIME
    ,_UpdatedById           INT
    ,_UpdatedDate           DATETIME
    ,_IsDeleted             BOOLEAN
)