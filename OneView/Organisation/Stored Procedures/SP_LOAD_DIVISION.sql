CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_DIVISION()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO ORGANISATION.DIVISION as T
USING (
    SELECT
        DivisionId
        ,ClientId
        ,Division
        ,DivisionReference
        ,Email
        ,SRBit
        ,_InsertedById
        ,_InsertedDate
        ,_UpdatedById
        ,_UpdatedDate
        ,_IsDeleted
    FROM ORGANISATION.STAGING_DIVISION
) S
ON T.OneViewID = S.DivisionId
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
    T.Division = S.Division,
    T.DivisionReference = S.DivisionReference,
    T.Email = S.Email,
    T.SRBit = S.SRBit,
    T._UpdatedById = S._UpdatedById,
    T._UpdatedDate = S._UpdatedDate,
    T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
    OneViewID
    ,ClientId
    ,Division
    ,DivisionReference
    ,Email
    ,SRBit
    ,_InsertedById
    ,_InsertedDate
    ,_UpdatedById
    ,_UpdatedDate
    ,_IsDeleted
) VALUES (
    S.DivisionId
    ,S.ClientId
    ,S.Division
    ,S.DivisionReference
    ,S.Email
    ,S.SRBit
    ,S._InsertedById
    ,S._InsertedDate
    ,S._UpdatedById
    ,S._UpdatedDate
    ,S._IsDeleted
);

DELETE FROM ORGANISATION.STAGING_DIVISION;

RETURN 1;

END';