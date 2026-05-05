CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_CAPACITY_GROUP()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO ORGANISATION.CAPACITY_GROUP as T
USING (
    SELECT
        CapacityGroupID
        ,ClientId
        ,CapacityGroup
        ,Multiplier
        ,CapacityAmount
        ,_InsertedById
        ,_InsertedDate
        ,_UpdatedById
        ,_UpdatedDate
        ,_IsDeleted
    FROM ORGANISATION.STAGING_CAPACITY_GROUP
) S
ON T.OneViewID = S.CapacityGroupID
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
    T.CapacityGroup = S.CapacityGroup,
    T.Multiplier = S.Multiplier,
    T.CapacityAmount = S.CapacityAmount,
    T._UpdatedById = S._UpdatedById,
    T._UpdatedDate = S._UpdatedDate,
    T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
    OneViewID
    ,ClientId
    ,CapacityGroup
    ,Multiplier
    ,CapacityAmount
    ,_InsertedById
    ,_InsertedDate
    ,_UpdatedById
    ,_UpdatedDate
    ,_IsDeleted
) VALUES (
    S.CapacityGroupID
    ,S.ClientId
    ,S.CapacityGroup
    ,S.Multiplier
    ,S.CapacityAmount
    ,S._InsertedById
    ,S._InsertedDate
    ,S._UpdatedById
    ,S._UpdatedDate
    ,S._IsDeleted
);

DELETE FROM ORGANISATION.STAGING_CAPACITY_GROUP;

RETURN 1;

END';