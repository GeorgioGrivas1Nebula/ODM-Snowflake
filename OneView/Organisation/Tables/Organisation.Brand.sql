
CREATE OR ALTER TABLE Organisation.Brand
(
    _ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER
    ,OneViewID           INT   COMMENT 'Source-system identifier from OneView'  
    ,ClientId               INT
    ,Brand                  NVARCHAR(250)       
    ,_InsertedById          INT
    ,_InsertedDate          DATETIME
    ,_UpdatedById           INT
    ,_UpdatedDate           DATETIME
    ,_IsDeleted             BOOLEAN
    ,primary key (_ID)
)