CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_ENTITY_OWNER()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO ORGANISATION.ENTITY_OWNER as T
USING (
    SELECT
        EntityOwnerID
        ,ClientId
        ,PeriodDate
        ,EntityID
        ,OwnerID
        ,CostCentreID
        ,DivisionID
        ,TMSVendorID
        ,TMSDetailProductID
        ,TMSAllowance
        ,AllocationGroupID
        ,EmployeeID
        ,DefaultBit
        ,VoiceDefault
        ,_InsertedById
        ,_InsertedDate
        ,_UpdatedById
        ,_UpdatedDate
        ,_IsDeleted
    FROM ORGANISATION.STAGING_ENTITY_OWNER
    QUALIFY ROW_NUMBER() OVER (
        PARTITION BY EntityOwnerID, ClientId
        ORDER BY COALESCE(_UpdatedDate, _InsertedDate) DESC, _InsertedDate DESC
    ) = 1
) S
ON T.OneViewID = S.EntityOwnerID
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
    T.PeriodDate = S.PeriodDate,
    T.EntityID = S.EntityID,
    T.OwnerID = S.OwnerID,
    T.CostCentreID = S.CostCentreID,
    T.DivisionID = S.DivisionID,
    T.TMSVendorID = S.TMSVendorID,
    T.TMSDetailProductID = S.TMSDetailProductID,
    T.TMSAllowance = S.TMSAllowance,
    T.AllocationGroupID = S.AllocationGroupID,
    T.EmployeeID = S.EmployeeID,
    T.DefaultBit = S.DefaultBit,
    T.VoiceDefault = S.VoiceDefault,
    T._UpdatedById = S._UpdatedById,
    T._UpdatedDate = S._UpdatedDate,
    T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
    OneViewID
    ,ClientId
    ,PeriodDate
    ,EntityID
    ,OwnerID
    ,CostCentreID
    ,DivisionID
    ,TMSVendorID
    ,TMSDetailProductID
    ,TMSAllowance
    ,AllocationGroupID
    ,EmployeeID
    ,DefaultBit
    ,VoiceDefault
    ,_InsertedById
    ,_InsertedDate
    ,_UpdatedById
    ,_UpdatedDate
    ,_IsDeleted
) VALUES (
    S.EntityOwnerID
    ,S.ClientId
    ,S.PeriodDate
    ,S.EntityID
    ,S.OwnerID
    ,S.CostCentreID
    ,S.DivisionID
    ,S.TMSVendorID
    ,S.TMSDetailProductID
    ,S.TMSAllowance
    ,S.AllocationGroupID
    ,S.EmployeeID
    ,S.DefaultBit
    ,S.VoiceDefault
    ,S._InsertedById
    ,S._InsertedDate
    ,S._UpdatedById
    ,S._UpdatedDate
    ,S._IsDeleted
);

DELETE FROM ORGANISATION.STAGING_ENTITY_OWNER;

RETURN 1;

END';