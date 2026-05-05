
CREATE TABLE IF NOT EXISTS Common.Language
(
	_ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER,
    OneViewId       INT,
	ClientID           	INT,
    LanguageCode		CHAR(5)	,
	Name			    NVARCHAR(255),	
    DateAdded			DATETIME,  
	UserAddedID		    INT,	
	DateUpdated		    DATETIME,	
	UserUpdatedID		INT,
	_DeletedBit		    BOOLEAN,	
    primary key (_ID)
)