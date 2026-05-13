CREATE OR REPLACE TABLE Common.Staging_Client_Users
(
    ClientUserID         INT        
    ,ClientReference     NVARCHAR(4)
    ,ClientId              INT
    ,UserId             INT
    ,Email               NVARCHAR(255)
    ,ClientUserEmail     NVARCHAR(259)
    ,_InsertedById          INT
    ,_InsertedDate          DATETIME
    ,_UpdatedById           INT
    ,_UpdatedDate           DATETIME
    ,_IsDeleted             BOOLEAN
)