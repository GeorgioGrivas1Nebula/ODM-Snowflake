CREATE OR ALTER PROCEDURE  COMMON.SP_LOAD_LANGUAGE()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS 
'BEGIN

MERGE INTO COMMON.LANGUAGE as T 
USING (
    SELECT
        LanguageID,
        LanguageCode,
        Name,
        DateAdded,
        UserAddedID,
        DateUpdated,
        UserUpdatedID,
        _DeletedBit
    FROM COMMON.STAGING_LANGUAGE 
) S 
ON T.OneViewLanguageID = S.LanguageID
WHEN MATCHED 
AND S.Name != T.Name 
THEN UPDATE SET 
    T.Name = S.Name,
    T.DateUpdated = S.DateUpdated,
    T.UserUpdatedID = S.UserUpdatedID
WHEN MATCHED 
AND S._DeletedBit != T._DeletedBit
THEN UPDATE SET 
    T._DeletedBit = S._DeletedBit,
    T.DateUpdated = S.DateUpdated,
    T.UserUpdatedID = S.UserUpdatedID
WHEN NOT MATCHED THEN
INSERT (
    OneViewLanguageID,
    LanguageCode,
    Name,
    DateAdded,
    UserAddedID,
    DateUpdated,
    UserUpdatedID,
    _DeletedBit
) VALUES (
    S.LanguageID,
    S.LanguageCode,
    S.Name,
    S.DateAdded,
    S.UserAddedID,
    S.DateUpdated,
    S.UserUpdatedID,
    S._DeletedBit
);

DELETE FROM COMMON.STAGING_LANGUAGE;

RETURN 1;

END';
