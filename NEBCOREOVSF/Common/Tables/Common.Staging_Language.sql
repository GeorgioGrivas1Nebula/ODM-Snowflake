
CREATE OR ALTER TABLE Common.Staging_Language
(
	LanguageID	        INT,
    LanguageCode		CHAR(5)	,
	Name			    NVARCHAR(255),	
    _InsertedById      INT,
    _InsertedDate        DATETIME,
    _UpdatedById    INT,
    _UpdatedDate      DATETIME,
    _IsDeleted       BOOLEAN
)