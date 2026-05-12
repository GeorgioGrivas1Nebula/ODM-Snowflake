CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_ACCOUNT_STAGING()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS 'BEGIN
    COPY INTO ORGANISATION.STAGING_ACCOUNT
    FROM @COMMON.ONEVIEW_STAGE/account
    MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE
    FILE_FORMAT = (TYPE = ''PARQUET'')
    ON_ERROR=CONTINUE
    PURGE = TRUE;

    UPDATE ORGANISATION.STAGING_ACCOUNT as Target
    SET 
        Target.ClientID = src._ID
    FROM NEBCOREODMSFDEV.ONEVIEW.DIMCLIENT src
    WHERE target.CLIENTREFERENCE = src.CLIENTREFERENCE;

    UPDATE ORGANISATION.STAGING_ACCOUNT as Target
    SET
        Target.StatusDetailID = src._ID
    FROM COMMON.LOOKUP_DETAIL src
    WHERE src.OneViewID = Target.StatusDetailID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_ACCOUNT as Target
    SET
        Target.TypeDetailID = src._ID
    FROM COMMON.LOOKUP_DETAIL src
    WHERE src.OneViewID = Target.TypeDetailID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_ACCOUNT as Target
    SET
        Target.ClientVendorID = src._ID
    FROM COMMON.Client_Vendor src
    WHERE src.OneViewID = Target.ClientVendorID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_ACCOUNT as Target
    SET
        Target.OwnerID = src._ID
    FROM Organisation.Owner src
    WHERE src.OneViewID = Target.OwnerID
    AND src.ClientID = Target.ClientId;

    RETURN 1;

END';