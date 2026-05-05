CREATE OR ALTER PROCEDURE VOICE.SP_LOAD_TMS_DETAIL_PRODUCT()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO VOICE.TMS_DETAIL_PRODUCT as T
USING (
    SELECT
        TMSDetailProductID
        ,ProductDescription
        ,DisplayDescription
        ,Notes
        ,ShowBudget
        ,ShowUsage
        ,_InsertedById
        ,_InsertedDate
        ,_UpdatedById
        ,_UpdatedDate
        ,_IsDeleted
    FROM VOICE.STAGING_TMS_DETAIL_PRODUCT
) S
ON T.OneViewID = S.TMSDetailProductID
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
    T.ProductDescription = S.ProductDescription,
    T.DisplayDescription = S.DisplayDescription,
    T.Notes = S.Notes,
    T.ShowBudget = S.ShowBudget,
    T.ShowUsage = S.ShowUsage,
    T._UpdatedById = S._UpdatedById,
    T._UpdatedDate = S._UpdatedDate,
    T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
    OneViewID
    ,ProductDescription
    ,DisplayDescription
    ,Notes
    ,ShowBudget
    ,ShowUsage
    ,_InsertedById
    ,_InsertedDate
    ,_UpdatedById
    ,_UpdatedDate
    ,_IsDeleted
) VALUES (
    S.TMSDetailProductID
    ,S.ProductDescription
    ,S.DisplayDescription
    ,S.Notes
    ,S.ShowBudget
    ,S.ShowUsage
    ,S._InsertedById
    ,S._InsertedDate
    ,S._UpdatedById
    ,S._UpdatedDate
    ,S._IsDeleted
);

DELETE FROM VOICE.STAGING_TMS_DETAIL_PRODUCT;

RETURN 1;

END';