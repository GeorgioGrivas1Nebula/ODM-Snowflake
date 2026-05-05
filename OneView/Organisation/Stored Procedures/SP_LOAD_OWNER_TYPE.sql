CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_OWNER_TYPE()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO ORGANISATION.OWNER_TYPE as T
USING (
    SELECT
        OwnerTypeId
        ,ClientId
        ,OwnerType
        ,DivisionID
        ,SRBit
        ,_InsertedById
        ,_InsertedDate
        ,_UpdatedById
        ,_UpdatedDate
        ,_IsDeleted
    FROM ORGANISATION.STAGING_OWNER_TYPE
) S
ON T.OneViewID = S.OwnerTypeId
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
    T.OwnerType = S.OwnerType,
    T.DivisionID = S.DivisionID,
    T.SRBit = S.SRBit,
    T._UpdatedById = S._UpdatedById,
    T._UpdatedDate = S._UpdatedDate,
    T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
    OneViewID
    ,ClientId
    ,OwnerType
    ,DivisionID
    ,SRBit
    ,_InsertedById
    ,_InsertedDate
    ,_UpdatedById
    ,_UpdatedDate
    ,_IsDeleted
) VALUES (
    S.OwnerTypeId
    ,S.ClientId
    ,S.OwnerType
    ,S.DivisionID
    ,S.SRBit
    ,S._InsertedById
    ,S._InsertedDate
    ,S._UpdatedById
    ,S._UpdatedDate
    ,S._IsDeleted
);

DELETE FROM ORGANISATION.STAGING_OWNER_TYPE;

RETURN 1;

END';