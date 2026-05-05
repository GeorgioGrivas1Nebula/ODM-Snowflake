CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_COST_CENTRE()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO ORGANISATION.COST_CENTRE as T
USING (
    SELECT
        CostCentreID
        ,ClientId
        ,CostCentreGUID
        ,Link
        ,CostCentre
        ,Description
        ,CompanyID
        ,ERPCostCentre
        ,ERPCustomer
        ,PostingIdentifier
        ,Email
        ,OpsBoardMember
        ,CloudProportionedBit
        ,LinkType
        ,_InsertedById
        ,_InsertedDate
        ,_UpdatedById
        ,_UpdatedDate
        ,_IsDeleted
    FROM ORGANISATION.STAGING_COST_CENTRE
) S
ON T.OneViewID = S.CostCentreID
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
    T.CostCentreGUID = S.CostCentreGUID,
    T.Link = S.Link,
    T.CostCentre = S.CostCentre,
    T.Description = S.Description,
    T.CompanyID = S.CompanyID,
    T.ERPCostCentre = S.ERPCostCentre,
    T.ERPCustomer = S.ERPCustomer,
    T.PostingIdentifier = S.PostingIdentifier,
    T.Email = S.Email,
    T.OpsBoardMember = S.OpsBoardMember,
    T.CloudProportionedBit = S.CloudProportionedBit,
    T.LinkType = S.LinkType,
    T._UpdatedById = S._UpdatedById,
    T._UpdatedDate = S._UpdatedDate,
    T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
    OneViewID
    ,ClientId
    ,CostCentreGUID
    ,Link
    ,CostCentre
    ,Description
    ,CompanyID
    ,ERPCostCentre
    ,ERPCustomer
    ,PostingIdentifier
    ,Email
    ,OpsBoardMember
    ,CloudProportionedBit
    ,LinkType
    ,_InsertedById
    ,_InsertedDate
    ,_UpdatedById
    ,_UpdatedDate
    ,_IsDeleted
) VALUES (
    S.CostCentreID
    ,S.ClientId
    ,S.CostCentreGUID
    ,S.Link
    ,S.CostCentre
    ,S.Description
    ,S.CompanyID
    ,S.ERPCostCentre
    ,S.ERPCustomer
    ,S.PostingIdentifier
    ,S.Email
    ,S.OpsBoardMember
    ,S.CloudProportionedBit
    ,S.LinkType
    ,S._InsertedById
    ,S._InsertedDate
    ,S._UpdatedById
    ,S._UpdatedDate
    ,S._IsDeleted
);

DELETE FROM ORGANISATION.STAGING_COST_CENTRE;

RETURN 1;

END';