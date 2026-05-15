CREATE OR ALTER TABLE Common.Staging_Lookup_Group
(
	GroupId                 INT,
	ClientReference         NVARCHAR (4),
	ClientId                INT,
	ParentGroupId           INT,
	Reference               NVARCHAR (20),
	GroupName               NVARCHAR (100),
	Description             NVARCHAR (200),
	_InsertedById           INT,
	_InsertedDate           DATETIME,
	_UpdatedById            INT,
	_UpdatedDate            DATETIME,
	_IsDeleted              BOOLEAN
)
