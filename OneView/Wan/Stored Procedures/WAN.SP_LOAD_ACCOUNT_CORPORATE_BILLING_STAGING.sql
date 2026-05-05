CREATE OR ALTER PROCEDURE WAN.SP_LOAD_ACCOUNT_CORPORATE_BILLING_STAGING()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS 'BEGIN
    COPY INTO WAN.STAGING_ACCOUNT_CORPORATE_BILLING
    FROM @COMMON.ONEVIEW_STAGE/accountcorporatewanbl
    MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE
    FILE_FORMAT = (TYPE = ''PARQUET'')
    ON_ERROR=CONTINUE
    
    PURGE = TRUE;

    UPDATE WAN.STAGING_ACCOUNT_CORPORATE_BILLING as Target
    SET 
        Target.ClientID = src._ID
    FROM NEBCOREODMSFDEV.ONEVIEW.DIMCLIENT src
    WHERE target.CLIENTREFERENCE = src.CLIENTREFERENCE;

    UPDATE WAN.STAGING_ACCOUNT_CORPORATE_BILLING as Target
    SET
        Target.EntityID = src._ID
    FROM Organisation.Entity src
    WHERE src.OneViewID = Target.EntityID
    AND src.ClientID = Target.ClientId;

    UPDATE WAN.STAGING_ACCOUNT_CORPORATE_BILLING as Target
    SET
        Target.AccessServiceTypeDetailID = src._ID
    FROM Organisation.Lookup_Detail src
    WHERE src.OneViewID = Target.AccessServiceTypeDetailID
    AND src.ClientID = Target.ClientId;
    
    UPDATE WAN.STAGING_ACCOUNT_CORPORATE_BILLING as Target
    SET
        Target.SlaTypeDetailID = src._ID
    FROM Organisation.Lookup_Detail src
    WHERE src.OneViewID = Target.SlaTypeDetailID
    AND src.ClientID = Target.ClientId;
    
    RETURN 1;

END';