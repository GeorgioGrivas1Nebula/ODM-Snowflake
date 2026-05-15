
CREATE OR ALTER TABLE Organisation.Capacity_Group
(
    _ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER
    ,OneViewID           INT   COMMENT 'Source-system identifier from OneView'  
    ,ClientId               INT         
    ,CapacityGroup          NVARCHAR(50)  
    ,Multiplier             DECIMAL(18, 2)
    ,CapacityAmount         INT            
    ,_InsertedById          INT
    ,_InsertedDate          DATETIME
    ,_UpdatedById           INT
    ,_UpdatedDate           DATETIME
    ,_IsDeleted             BOOLEAN
    ,primary key (_ID)
)