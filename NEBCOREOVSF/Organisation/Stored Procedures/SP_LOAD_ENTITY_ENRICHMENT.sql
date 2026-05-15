CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_ENTITY_ENRICHMENT()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO ORGANISATION.ENTITY_ENRICHMENT as T
USING (
    SELECT
        EntityEnrichmentID
        ,ClientId
        ,EntityID
        ,EntityProductID
        ,UsedForComment
        ,UsedForDetailID
        ,Bandwidth
        ,AccessMediumDetailID
        ,Cost
        ,NetworkCost
        ,CostTerm
        ,PurchasedDate
        ,InstalledDate
        ,RemovedDate
        ,Supplier
        ,FirmwareVersion
        ,SerialNumber
        ,Notes
        ,IP
        ,Priority
        ,Gateway
        ,GatewaySwitch
        ,PurchaseAmortised
        ,Manufacturer
        ,Model
        ,_InsertedById
        ,_InsertedDate
        ,_UpdatedById
        ,_UpdatedDate
        ,_IsDeleted
    FROM ORGANISATION.STAGING_ENTITY_ENRICHMENT
) S
ON T.OneViewID = S.EntityEnrichmentID
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
    T.EntityID = S.EntityID,
    T.EntityProductID = S.EntityProductID,
    T.UsedForComment = S.UsedForComment,
    T.UsedForDetailID = S.UsedForDetailID,
    T.Bandwidth = S.Bandwidth,
    T.AccessMediumDetailID = S.AccessMediumDetailID,
    T.Cost = S.Cost,
    T.NetworkCost = S.NetworkCost,
    T.CostTerm = S.CostTerm,
    T.PurchasedDate = S.PurchasedDate,
    T.InstalledDate = S.InstalledDate,
    T.RemovedDate = S.RemovedDate,
    T.Supplier = S.Supplier,
    T.FirmwareVersion = S.FirmwareVersion,
    T.SerialNumber = S.SerialNumber,
    T.Notes = S.Notes,
    T.IP = S.IP,
    T.Priority = S.Priority,
    T.Gateway = S.Gateway,
    T.GatewaySwitch = S.GatewaySwitch,
    T.PurchaseAmortised = S.PurchaseAmortised,
    T.Manufacturer = S.Manufacturer,
    T.Model = S.Model,
    T._UpdatedById = S._UpdatedById,
    T._UpdatedDate = S._UpdatedDate,
    T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
    OneViewID
    ,ClientId
    ,EntityID
    ,EntityProductID
    ,UsedForComment
    ,UsedForDetailID
    ,Bandwidth
    ,AccessMediumDetailID
    ,Cost
    ,NetworkCost
    ,CostTerm
    ,PurchasedDate
    ,InstalledDate
    ,RemovedDate
    ,Supplier
    ,FirmwareVersion
    ,SerialNumber
    ,Notes
    ,IP
    ,Priority
    ,Gateway
    ,GatewaySwitch
    ,PurchaseAmortised
    ,Manufacturer
    ,Model
    ,_InsertedById
    ,_InsertedDate
    ,_UpdatedById
    ,_UpdatedDate
    ,_IsDeleted
) VALUES (
    S.EntityEnrichmentID
    ,S.ClientId
    ,S.EntityID
    ,S.EntityProductID
    ,S.UsedForComment
    ,S.UsedForDetailID
    ,S.Bandwidth
    ,S.AccessMediumDetailID
    ,S.Cost
    ,S.NetworkCost
    ,S.CostTerm
    ,S.PurchasedDate
    ,S.InstalledDate
    ,S.RemovedDate
    ,S.Supplier
    ,S.FirmwareVersion
    ,S.SerialNumber
    ,S.Notes
    ,S.IP
    ,S.Priority
    ,S.Gateway
    ,S.GatewaySwitch
    ,S.PurchaseAmortised
    ,S.Manufacturer
    ,S.Model
    ,S._InsertedById
    ,S._InsertedDate
    ,S._UpdatedById
    ,S._UpdatedDate
    ,S._IsDeleted
);

DELETE FROM ORGANISATION.STAGING_ENTITY_ENRICHMENT;

RETURN 1;

END';