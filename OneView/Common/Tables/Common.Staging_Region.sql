CREATE OR ALTER TABLE Common.Staging_Region
(
	RegionId INT,
    ClientReference             NVARCHAR (4),
    ClientId          INT,
    Region           NVARCHAR (50),
    Email            NVARCHAR (250),
    Business_Manager NVARCHAR (500),
    Regional_Manager NVARCHAR (500),
    _InsertedById      INT,
    _InsertedDate        DATETIME,
    _UpdatedById    INT,
    _UpdatedDate      DATETIME,
    _IsDeleted       BOOLEAN
)