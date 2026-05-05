CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_ALLOCATION_GROUP()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO ORGANISATION.ALLOCATION_GROUP as T
USING (
    SELECT
        AllocationGroupID
        ,ClientReference
        ,ClientId
        ,AllocationGroup
        ,_InsertedById
        ,_InsertedDate
        ,_UpdatedById
        ,_UpdatedDate
        ,_IsDeleted
    FROM ORGANISATION.STAGING_ALLOCATION_GROUP
) S
ON T.OneViewID = S.AllocationGroupID
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
    T.ClientReference = S.ClientReference,
    T.AllocationGroup = S.AllocationGroup,
    T._UpdatedById = S._UpdatedById,
    T._UpdatedDate = S._UpdatedDate,
    T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
    OneViewID
    ,ClientReference
    ,ClientId
    ,AllocationGroup
    ,_InsertedById
    ,_InsertedDate
    ,_UpdatedById
    ,_UpdatedDate
    ,_IsDeleted
) VALUES (
    S.AllocationGroupID
    ,S.ClientReference
    ,S.ClientId
    ,S.AllocationGroup
    ,S._InsertedById
    ,S._InsertedDate
    ,S._UpdatedById
    ,S._UpdatedDate
    ,S._IsDeleted
);

DELETE FROM ORGANISATION.STAGING_ALLOCATION_GROUP;

RETURN 1;

END';