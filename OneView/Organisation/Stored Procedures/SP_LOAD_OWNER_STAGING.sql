CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_OWNER_STAGING()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS 'BEGIN
    COPY INTO ORGANISATION.STAGING_OWNER
    FROM @COMMON.ONEVIEW_STAGE/owners
    MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE
    FILE_FORMAT = (TYPE = ''PARQUET'')
    ON_ERROR=CONTINUE
    PURGE = TRUE;

    UPDATE ORGANISATION.STAGING_OWNER as Target
    SET 
        Target.ClientID = src._ID
    FROM NEBCOREODMSFDEV.ONEVIEW.DIMCLIENT src
    WHERE target.CLIENTREFERENCE = src.CLIENTREFERENCE;

    UPDATE ORGANISATION.STAGING_OWNER as Target
    SET
        Target.OwnerTypeID = src._ID
    FROM Organisation.Owner_Type src
    WHERE src.OneViewID = Target.OwnerTypeID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_OWNER as Target
    SET
        Target.StatusDetailID = src._ID
    FROM Organisation.Lookup_Detail src
    WHERE src.OneViewID = Target.OwnerStatusDetailID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_OWNER as Target
    SET
        Target.RegionID = src._ID
    FROM Common.Region src
    WHERE src.OneViewID = Target.RegionID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_OWNER as Target
    SET        Target.AdminCountryLink = src.OneViewCountryId
    FROM Common.Country src
    WHERE src.OneViewCountryId = Target.AdminCountryLink
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_OWNER as Target
    SET
        Target.BrandID = src._ID
    FROM Organisation.Brand src
    WHERE src.OneViewID = Target.BrandID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_OWNER as Target
    SET
        Target.CostCentreID = src._ID
    FROM Organisation.Cost_Centre src
    WHERE src.OneViewID = Target.CostCentreID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_OWNER as Target
    SET
        Target.DivisionID = src._ID
    FROM Organisation.Division src
    WHERE src.OneViewID = Target.DivisionID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_OWNER as Target
    SET        Target.OwnerClassDetailID = src._ID
    FROM Organisation.Lookup_Detail src
    WHERE src.OneViewID = Target.OwnerClassDetailID
    AND src.ClientID = Target.ClientId;

    RETURN 1;

END';
