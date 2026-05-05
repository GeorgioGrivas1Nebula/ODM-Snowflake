CREATE TABLE IF NOT EXISTS Common.Staging_Lookup_Detail
(
	DetailId            INT,
	GroupId             INT,
    Reference           NVARCHAR (20),
    ClientReference     NVARCHAR (4),
    ClientId            INT,
    ShortDescription    NVARCHAR (200),
    LongDescription     NVARCHAR (500),
    SystemBit           BOOLEAN,
    ActiveBit           BOOLEAN,
    ParentDetailID      INT,
    ClientVisibleBit    BOOLEAN,
    _InsertedById       INT,
    _InsertedDate       DATETIME,
    _UpdatedById        INT,
    _UpdatedDate        DATETIME,
    _IsDeleted          BOOLEAN
)
