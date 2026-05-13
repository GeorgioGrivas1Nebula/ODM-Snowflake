CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_OWNER()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO ORGANISATION.OWNER as T
USING (
    SELECT
        OwnerID
        ,ClientId
        ,OwnerGUID
        ,Owner
        ,OwnerNo
        ,Description
        ,Notes
        ,OwnerTypeID
        ,OwnerStatusDetailID
        ,RegionID
        ,AdminCountryLink
        ,Email
        ,BrandID
        ,CostCentreID
        ,DivisionID
        ,LineGroupReference
        ,OwnerClassDetailID
        ,_InsertedById
        ,_InsertedDate
        ,_UpdatedById
        ,_UpdatedDate
        ,_IsDeleted
    FROM ORGANISATION.STAGING_OWNER
) S
ON T.OneViewID = S.OwnerID
AND T.ClientID = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
    T.OwnerGUID = S.OwnerGUID,
    T.Owner = S.Owner,
    T.OwnerNo = S.OwnerNo,
    T.Description = S.Description,
    T.Notes = S.Notes,
    T.OwnerTypeID = S.OwnerTypeID,
    T.OwnerStatusDetailID = S.OwnerStatusDetailID,
    T.RegionID = S.RegionID,
    T.AdminCountryLink = S.AdminCountryLink,
    T.Email = S.Email,
    T.BrandID = S.BrandID,
    T.CostCentreID = S.CostCentreID,
    T.DivisionID = S.DivisionID,
    T.LineGroupReference = S.LineGroupReference,
    T.OwnerClassDetailID = S.OwnerClassDetailID,
    T._UpdatedById = S._UpdatedById,
    T._UpdatedDate = S._UpdatedDate,
    T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
    OneViewID
    ,ClientID
    ,OwnerGUID
    ,Owner
    ,OwnerNo
    ,Description
    ,Notes
    ,OwnerTypeID
    ,OwnerStatusDetailID
    ,RegionID
    ,AdminCountryLink
    ,Email
    ,BrandID
    ,CostCentreID
    ,DivisionID
    ,LineGroupReference
    ,OwnerClassDetailID
    ,_InsertedById
    ,_InsertedDate
    ,_UpdatedById
    ,_UpdatedDate
    ,_IsDeleted
) VALUES (
    S.OwnerID
    ,S.ClientId
    ,S.OwnerGUID
    ,S.Owner
    ,S.OwnerNo
    ,S.Description
    ,S.Notes
    ,S.OwnerTypeID
    ,S.OwnerStatusDetailID
    ,S.RegionID
    ,S.AdminCountryLink
    ,S.Email
    ,S.BrandID
    ,S.CostCentreID
    ,S.DivisionID
    ,S.LineGroupReference
    ,S.OwnerClassDetailID
    ,S._InsertedById
    ,S._InsertedDate
    ,S._UpdatedById
    ,S._UpdatedDate
    ,S._IsDeleted
);

DELETE FROM ORGANISATION.STAGING_OWNER;

RETURN 1;

END';