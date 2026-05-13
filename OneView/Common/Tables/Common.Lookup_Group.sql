CREATE OR ALTER TABLE Common.Lookup_Group (
    _ID             NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER,
    OneViewId INT COMMENT 'Source-system identifier from OneView',
    ClientId        INT,
    ParentGroupId   INT,
    Reference       NVARCHAR (25),
    GroupName       NVARCHAR (100),
    Description     NVARCHAR (200),
    _InsertedById   INT,
    _InsertedDate   DATETIME,
    _UpdatedById    INT,
    _UpdatedDate    DATETIME,
    _IsDeleted      BOOLEAN,
    primary key (_ID)
    )