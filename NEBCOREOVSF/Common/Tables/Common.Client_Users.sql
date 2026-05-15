CREATE OR REPLACE TABLE Common.Client_Users
(
    _ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER
    ,OneViewID INT COMMENT 'Source-system identifier from OneView'        
    ,ClientId              INT
    ,ClientReference     NVARCHAR(4)
    ,UserId             INT
    ,Email               NVARCHAR(255)
    ,ClientUserEmail     NVARCHAR(259)
    ,_InsertedById          INT
    ,_InsertedDate          DATETIME
    ,_UpdatedById           INT
    ,_UpdatedDate           DATETIME
    ,_IsDeleted             BOOLEAN
)