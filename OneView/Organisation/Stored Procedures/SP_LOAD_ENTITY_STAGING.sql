CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_ENTITY_STAGING()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS 'BEGIN
    COPY INTO ORGANISATION.STAGING_ENTITY
    FROM @COMMON.ONEVIEW_STAGE/entity
    MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE
    FILE_FORMAT = (TYPE = ''PARQUET'')
    ON_ERROR=CONTINUE
    PURGE = TRUE;

    UPDATE ORGANISATION.STAGING_ENTITY as Target
    SET 
        Target.ClientID = src._ID
    FROM NEBCOREODMSFDEV.ONEVIEW.DIMCLIENT src
    WHERE target.CLIENTREFERENCE = src.CLIENTREFERENCE;

    UPDATE ORGANISATION.STAGING_ENTITY as Target
    SET
        Target.ParentEntityID = src._ID
    FROM Organisation.Entity src
    WHERE src.OneViewID = Target.ParentEntityID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_ENTITY as Target
    SET
        Target.TypeID = src._ID
    FROM Organisation.Lookup_Detail src
    WHERE src.OneViewID = Target.TypeID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_ENTITY as Target
    SET
        Target.OwnerID = src._ID
    FROM Oorganisation.Owner src
    WHERE src.OneViewID = Target.OwnerID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_ENTITY as Target
    SET
        Target.StatusID = src._ID
    FROM Organisation.Lookup_Detail src
    WHERE src.OneViewID = Target.StatusID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_ENTITY as Target
    SET
        Target.AccountID = src._ID
    FROM Organisation.Account src
    WHERE src.OneViewID = Target.AccountID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_ENTITY as Target
    SET
        Target.ClientVendorID = src._ID
    FROM Organisation.Client_Vendor src
    WHERE src.OneViewID = Target.ClientVendorID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_ENTITY as Target
    SET
        Target.CapacityGroupID = src._ID
    FROM Organisation.Capacity_Group src
    WHERE src.OneViewID = Target.CapacityGroupID
    AND src.ClientID = Target.ClientId;

    

    RETURN 1;

END';