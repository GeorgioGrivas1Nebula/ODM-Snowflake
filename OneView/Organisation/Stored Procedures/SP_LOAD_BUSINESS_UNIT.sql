CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_BUSINESS_UNIT()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO ORGANISATION.BUSINESS_UNIT as T
USING (
    SELECT
        BusinessUnitID   
        ,BusinessUnitGUID 
        ,BusinessUnit     
        ,_InsertedById
        ,_InsertedDate
        ,_UpdatedById
        ,_UpdatedDate
        ,_IsDeleted
    FROM ORGANISATION.STAGING_BUSINESS_UNIT
) S
ON T.OneViewID = S.BusinessUnitID
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
    T.BusinessUnit = S.BusinessUnit,
    T._UpdatedById = S._UpdatedById,
    T._UpdatedDate = S._UpdatedDate,
    T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
    OneViewID
    ,ClientId   
    ,BusinessUnitGUID  
    ,BusinessUnit      
    ,_InsertedById
    ,_InsertedDate
    ,_UpdatedById
    ,_UpdatedDate
    ,_IsDeleted
) VALUES (
    S.BusinessUnitID
    ,S.ClientId
    ,S.BusinessUnitGUID
    ,S.BusinessUnit
    ,S._InsertedById
    ,S._InsertedDate
    ,S._UpdatedById
    ,S._UpdatedDate
    ,S._IsDeleted
);

DELETE FROM ORGANISATION.STAGING_BUSINESS_UNIT;

RETURN 1;

END';