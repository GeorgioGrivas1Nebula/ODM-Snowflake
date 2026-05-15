CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_EMPLOYEE_STAGING()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS 'BEGIN
    COPY INTO ORGANISATION.STAGING_EMPLOYEE
    FROM @COMMON.ONEVIEW_STAGE/employees/
    MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE
    FILE_FORMAT = (TYPE = ''PARQUET'')
    ON_ERROR=CONTINUE
    FORCE = TRUE;

    UPDATE ORGANISATION.STAGING_EMPLOYEE as Target
    SET 
        Target.ClientID = src._ID
    FROM NEBCOREODMSFDEV.ONEVIEW.DIMCLIENT src
    WHERE target.CLIENTREFERENCE = src.CLIENTREFERENCE;

    UPDATE ORGANISATION.STAGING_EMPLOYEE as Target
    SET
        Target.CostCentreId = src._ID
    FROM Organisation.Cost_Centre src
    WHERE src.OneViewID = Target.CostCentreId
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_EMPLOYEE as Target
    SET
        Target.BusinessUnitId = src._ID
    FROM Organisation.Business_Unit src
    WHERE src.OneViewID = Target.BusinessUnitId
    AND src.ClientID = Target.ClientId;

    UPDATE ORGANISATION.STAGING_EMPLOYEE as Target
    SET
    Target.ManagerEmployeeId = src._ID
    FROM Organisation.EMPLOYEE src
    WHERE src.OneViewID = Target.ManagerEmployeeId
    AND src.ClientID = Target.ClientId;

    RETURN 1;

END';