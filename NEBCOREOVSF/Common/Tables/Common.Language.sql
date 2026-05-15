
CREATE OR REPLACE TABLE Common.Language
(
	_ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER,
    OneViewId INT COMMENT 'Source-system identifier from OneView',
	ClientID           	INT,
    LanguageCode		CHAR(5)	,
	Name			    NVARCHAR(255),	
    _InsertedById      INT,
    _InsertedDate        DATETIME,
    _UpdatedById    INT,
    _UpdatedDate      DATETIME,
    _IsDeleted       BOOLEAN,
    primary key (_ID)
)