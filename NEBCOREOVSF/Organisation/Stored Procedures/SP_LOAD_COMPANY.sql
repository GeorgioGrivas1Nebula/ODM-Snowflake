CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_COMPANY()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO ORGANISATION.COMPANY as T
USING (
    SELECT
        CompanyID
        ,ClientId
        ,CompanyCode
        ,Name
        ,LanguageID
        ,_InsertedById
        ,_InsertedDate
        ,_UpdatedById
        ,_UpdatedDate
        ,_IsDeleted
    FROM ORGANISATION.STAGING_COMPANY
) S
ON T.OneViewID = S.CompanyID
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
    T.CompanyCode = S.CompanyCode,
    T.Name = S.Name,
    T.LanguageID = S.LanguageID,
    T._UpdatedById = S._UpdatedById,
    T._UpdatedDate = S._UpdatedDate,
    T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
    OneViewID
    ,ClientId
    ,CompanyCode
    ,Name
    ,LanguageID
    ,_InsertedById
    ,_InsertedDate
    ,_UpdatedById
    ,_UpdatedDate
    ,_IsDeleted
) VALUES (
    S.CompanyID
    ,S.ClientId
    ,S.CompanyCode
    ,S.Name
    ,S.LanguageID
    ,S._InsertedById
    ,S._InsertedDate
    ,S._UpdatedById
    ,S._UpdatedDate
    ,S._IsDeleted
);

DELETE FROM ORGANISATION.STAGING_COMPANY;

RETURN 1;

END';