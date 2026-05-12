CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_ENTITY_OWNER_STAGING()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS 'BEGIN
    COPY INTO ORGANISATION.STAGING_ENTITY_OWNER
    FROM @COMMON.ONEVIEW_STAGE/entityOwner
    MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE
    FILE_FORMAT = (TYPE = ''PARQUET'')
    ON_ERROR=CONTINUE
    PURGE = TRUE;

    UPDATE ORGANISATION.STAGING_ENTITY_OWNER as Target
    SET 
        Target.ClientID = src._ID
    FROM NEBCOREODMSFDEV.ONEVIEW.DIMCLIENT src
    WHERE target.CLIENTREFERENCE = src.CLIENTREFERENCE;

    UPDATE ORGANISATION.STAGING_ENTITY_OWNER as Target
    SET
        Target.EntityID = src._ID
    FROM Organisation.Entity src
    WHERE src.OneViewID = Target.EntityID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_ENTITY_OWNER as Target
    SET
        Target.OwnerID = src._ID
    FROM Organisation.Owner src
    WHERE src.OneViewID = Target.OwnerID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_ENTITY_OWNER as Target
    SET
        Target.CostCentreID = src._ID
    FROM Organisation.Cost_Centre src
    WHERE src.OneViewID = Target.CostCentreID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_ENTITY_OWNER as Target
    SET
        Target.DivisionID = src._ID
    FROM Organisation.Division src
    WHERE src.OneViewID = Target.DivisionID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_ENTITY_OWNER as Target
    SET
        Target.TMSDetailProductID = src._ID
    FROM VOICE.TMS_Detail_Product src
    WHERE src.OneViewID = Target.TMSDetailProductID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_ENTITY_OWNER as Target
    SET
        Target.AllocationGroupID = src._ID
    FROM Organisation.Allocation_Group src
    WHERE src.OneViewID = Target.AllocationGroupID
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_ENTITY_OWNER as Target
    SET
        Target.EmployeeID = src._ID
    FROM Organisation.Employee src
    WHERE src.OneViewID = Target.EmployeeID
    AND src.ClientID = Target.ClientId;

    RETURN 1;

END';