
CREATE OR ALTER TABLE Organisation.Staging_Brand
(
    BrandId                 INT        
    ,ClientReference        NVARCHAR(4)
    ,ClientId               INT
    ,Brand                  NVARCHAR(250)       
    ,_InsertedById          INT
    ,_InsertedDate          DATETIME
    ,_UpdatedById           INT
    ,_UpdatedDate           DATETIME
    ,_IsDeleted             BOOLEAN
)