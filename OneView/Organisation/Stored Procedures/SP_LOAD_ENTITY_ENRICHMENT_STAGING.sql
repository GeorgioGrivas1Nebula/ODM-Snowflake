CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_ENTITY_ENRICHMENT_STAGING()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS 'BEGIN
    COPY INTO ORGANISATION.STAGING_ENTITY_ENRICHMENT
    FROM @COMMON.ONEVIEW_STAGE/entityEnrichment
    MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE
    FILE_FORMAT = (TYPE = ''PARQUET'')
    ON_ERROR=CONTINUE
    PURGE = TRUE;

    UPDATE ORGANISATION.STAGING_ENTITY_ENRICHMENT as Target
    SET 
        Target.ClientID = src._ID
    FROM NEBCOREODMSFDEV.ONEVIEW.DIMCLIENT src
    WHERE target.CLIENTREFERENCE = src.CLIENTREFERENCE;

    UPDATE ORGANISATION.STAGING_ENTITY_ENRICHMENT as Target
    SET
        Target.EntityID = src._ID
    FROM Organisation.Entity src
    WHERE src.OneViewID = Target.EntityID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_ENTITY_ENRICHMENT as Target
    SET
        Target.UsedForDetailID = src._ID
    FROM Organisation.Lookup_Detail src
    WHERE src.OneViewID = Target.UsedForDetailID
    AND src.ClientID = Target.ClientId;
    
    UPDATE ORGANISATION.STAGING_ENTITY_ENRICHMENT as Target
    SET
        Target.AccessMediumDetailID = src._ID
    FROM Organisation.Lookup_Detail src
    WHERE src.OneViewID = Target.AccessMediumDetailID
    AND src.ClientID = Target.ClientId;

    RETURN 1;

END';