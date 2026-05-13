CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_ACCOUNT()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO ORGANISATION.ACCOUNT as T
USING (
    SELECT
        AccountID
        ,ClientId
        ,AccountGUID
        ,AccountNo
        ,AccountName
        ,AccountTradeName
        ,StatusDetailID
        ,TypeDetailID
        ,ClientVendorID
        ,OwnerID
        ,Excluded
        ,ExcludedComment
        ,_InsertedById
        ,_InsertedDate
        ,_UpdatedById
        ,_UpdatedDate
        ,_IsDeleted
    FROM ORGANISATION.STAGING_ACCOUNT
) S
ON T.OneViewID = S.AccountID
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
    T.AccountGUID = S.AccountGUID,
    T.AccountNo = S.AccountNo,
    T.AccountName = S.AccountName,
    T.AccountTradeName = S.AccountTradeName,
    T.StatusDetailID = S.StatusDetailID,
    T.TypeDetailID = S.TypeDetailID,
    T.ClientVendorID = S.ClientVendorID,
    T.OwnerID = S.OwnerID,
    T.Excluded = S.Excluded,
    T.ExcludedComment = S.ExcludedComment,
    T._UpdatedById = S._UpdatedById,
    T._UpdatedDate = S._UpdatedDate,
    T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
    OneViewID
    ,ClientId
    ,AccountGUID
    ,AccountNo
    ,AccountName
    ,AccountTradeName
    ,StatusDetailID
    ,TypeDetailID
    ,ClientVendorID
    ,OwnerID
    ,Excluded
    ,ExcludedComment
    ,_InsertedById
    ,_InsertedDate
    ,_UpdatedById
    ,_UpdatedDate
    ,_IsDeleted
) VALUES (
    S.AccountID
    ,S.ClientId
    ,S.AccountGUID
    ,S.AccountNo
    ,S.AccountName
    ,S.AccountTradeName
    ,S.StatusDetailID
    ,S.TypeDetailID
    ,S.ClientVendorID
    ,S.OwnerID
    ,S.Excluded
    ,S.ExcludedComment
    ,S._InsertedById
    ,S._InsertedDate
    ,S._UpdatedById
    ,S._UpdatedDate
    ,S._IsDeleted
);

DELETE FROM ORGANISATION.STAGING_ACCOUNT;

RETURN 1;

END';