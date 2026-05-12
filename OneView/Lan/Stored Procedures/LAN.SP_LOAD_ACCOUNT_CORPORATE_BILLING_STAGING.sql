CREATE OR ALTER PROCEDURE LAN.SP_LOAD_ACCOUNT_CORPORATE_BILLING_STAGING()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS 'BEGIN
    COPY INTO LAN.STAGING_ACCOUNT_CORPORATE_BILLING
    FROM @COMMON.ONEVIEW_STAGE/accountcorporatelanbl
    MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE
    FILE_FORMAT = (TYPE = ''PARQUET'')
    ON_ERROR=CONTINUE
    
    PURGE = TRUE;

    UPDATE LAN.STAGING_ACCOUNT_CORPORATE_BILLING as Target
    SET 
        Target.ClientID = src._ID
    FROM NEBCOREODMSFDEV.ONEVIEW.DIMCLIENT src
    WHERE target.CLIENTREFERENCE = src.CLIENTREFERENCE;

    UPDATE LAN.STAGING_ACCOUNT_CORPORATE_BILLING as Target
    SET
        Target.EntityID = src._ID
    FROM Organisation.Entity src
    WHERE src.OneViewID = Target.EntityID
    AND src.ClientID = Target.ClientId;

    UPDATE LAN.STAGING_ACCOUNT_CORPORATE_BILLING as Target
    SET
        Target.AccessServiceTypeDetailID = src._ID
    FROM COMMON.LOOKUP_DETAIL src
    WHERE src.OneViewID = Target.AccessServiceTypeDetailID
    AND src.ClientID = Target.ClientId;
    
    UPDATE LAN.STAGING_ACCOUNT_CORPORATE_BILLING as Target
    SET
        Target.SlaTypeDetailID = src._ID
    FROM COMMON.LOOKUP_DETAIL src
    WHERE src.OneViewID = Target.SlaTypeDetailID
    AND src.ClientID = Target.ClientId;
    
    RETURN 1;

END';