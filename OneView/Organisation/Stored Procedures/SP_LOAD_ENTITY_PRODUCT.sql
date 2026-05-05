CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_ENTITY_PRODUCT()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO ORGANISATION.ENTITY_PRODUCT as T
USING (
    SELECT
        EntityProductID
        ,EntityProductGUID
        ,Description
        ,Manufacturer
        ,ProductCode
        ,Gateway
        ,GatewaySwitch
        ,EntityTypeDetailID
        ,ImportID
        ,_InsertedById
        ,_InsertedDate
        ,_UpdatedById
        ,_UpdatedDate
        ,_IsDeleted
    FROM ORGANISATION.STAGING_ENTITY_PRODUCT
) S
ON T.OneViewID = S.EntityProductID
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
    T.EntityProductGUID = S.EntityProductGUID,
    T.Description = S.Description,
    T.Manufacturer = S.Manufacturer,
    T.ProductCode = S.ProductCode,
    T.Gateway = S.Gateway,
    T.GatewaySwitch = S.GatewaySwitch,
    T.EntityTypeDetailID = S.EntityTypeDetailID,
    T.ImportID = S.ImportID,
    T._UpdatedById = S._UpdatedById,
    T._UpdatedDate = S._UpdatedDate,
    T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
    OneViewID
    ,EntityProductGUID
    ,Description
    ,Manufacturer
    ,ProductCode
    ,Gateway
    ,GatewaySwitch
    ,EntityTypeDetailID
    ,ImportID
    ,_InsertedById
    ,_InsertedDate
    ,_UpdatedById
    ,_UpdatedDate
    ,_IsDeleted
) VALUES (
    S.EntityProductID
    ,S.EntityProductGUID
    ,S.Description
    ,S.Manufacturer
    ,S.ProductCode
    ,S.Gateway
    ,S.GatewaySwitch
    ,S.EntityTypeDetailID
    ,S.ImportID
    ,S._InsertedById
    ,S._InsertedDate
    ,S._UpdatedById
    ,S._UpdatedDate
    ,S._IsDeleted
);

DELETE FROM ORGANISATION.STAGING_ENTITY_PRODUCT;

RETURN 1;

END';