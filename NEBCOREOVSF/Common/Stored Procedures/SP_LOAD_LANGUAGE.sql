CREATE OR ALTER PROCEDURE  COMMON.SP_LOAD_LANGUAGE()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS 
'BEGIN

MERGE INTO COMMON.LANGUAGE as T 
USING (
    SELECT
        LanguageID
        ,LanguageCode
        ,Name
		,_InsertedById     
		,_InsertedDate     
		,_UpdatedById      
		,_UpdatedDate      
		,_IsDeleted  
    FROM COMMON.STAGING_LANGUAGE 
) S 
ON T.OneViewId = S.LanguageID
WHEN MATCHED 
AND S.Name != T.Name 
THEN UPDATE SET 
    T.Name = S.Name,
    T._UpdatedDate = S._UpdatedDate,
    T._UpdatedById = S._UpdatedById
WHEN MATCHED 
AND S._IsDeleted != T._IsDeleted
THEN UPDATE SET 
    T._IsDeleted = S._IsDeleted,
    T._UpdatedDate = S._UpdatedDate,
    T._UpdatedById = S._UpdatedById
WHEN NOT MATCHED THEN
INSERT (
    OneViewId,
    LanguageCode,
    Name,
    _InsertedDate,
    _InsertedById,
    _UpdatedDate,
    _UpdatedById,
    _IsDeleted
) VALUES (
    S.LanguageID,
    S.LanguageCode,
    S.Name,
    S._InsertedDate,
    S._InsertedById,
    S._UpdatedDate,
    S._UpdatedById,
    S._IsDeleted
);

DELETE FROM COMMON.STAGING_LANGUAGE;

RETURN 1;

END';
