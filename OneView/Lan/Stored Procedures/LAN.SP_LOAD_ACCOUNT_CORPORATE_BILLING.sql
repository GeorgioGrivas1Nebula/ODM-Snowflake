CREATE OR ALTER PROCEDURE LAN.SP_LOAD_ACCOUNT_CORPORATE_BILLING()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO LAN.ACCOUNT_CORPORATE_BILLING as T
USING (
    SELECT
        AccountCorporateLanBlID
        ,ClientId
        ,PeriodDate
        ,EntityID
        ,AccessServiceTypeDetailID
        ,SlaTypeDetailID
        ,Location
        ,ProductType
        ,HardwareCostActivation
        ,HardwareCostPort
        ,HardwareCostRecovery
        ,HardwareCostRental
        ,HardwareCostMaintenance
        ,HardwareCostSupport
        ,HardwareCost
        ,NetworkCostBandwidth
        ,NetworkCostRental
        ,NetworkCostSLA
        ,NetworkCost
        ,OtherCost
        ,CalculatedHardwareCost
        ,CalculatedNetworkCost
        ,Usage
        ,SLAPenaltyCost
        ,Other
        ,Percent
        ,Credit
        ,Comments
        ,Clarify
        ,ImportID
        ,VendorReference
        ,_InsertedById
        ,_InsertedDate
        ,_UpdatedById
        ,_UpdatedDate
        ,_IsDeleted
    FROM LAN.STAGING_ACCOUNT_CORPORATE_BILLING
) S
ON T.OneViewID = S.AccountCorporateLanBlID
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
    T.PeriodDate = S.PeriodDate,
    T.EntityID = S.EntityID,
    T.AccessServiceTypeDetailID = S.AccessServiceTypeDetailID,
    T.SlaTypeDetailID = S.SlaTypeDetailID,
    T.Location = S.Location,
    T.ProductType = S.ProductType,
    T.HardwareCostActivation = S.HardwareCostActivation,
    T.HardwareCostPort = S.HardwareCostPort,
    T.HardwareCostRecovery = S.HardwareCostRecovery,
    T.HardwareCostRental = S.HardwareCostRental,
    T.HardwareCostMaintenance = S.HardwareCostMaintenance,
    T.HardwareCostSupport = S.HardwareCostSupport,
    T.HardwareCost = S.HardwareCost,
    T.NetworkCostBandwidth = S.NetworkCostBandwidth,
    T.NetworkCostRental = S.NetworkCostRental,
    T.NetworkCostSLA = S.NetworkCostSLA,
    T.NetworkCost = S.NetworkCost,
    T.OtherCost = S.OtherCost,
    T.CalculatedHardwareCost = S.CalculatedHardwareCost,
    T.CalculatedNetworkCost = S.CalculatedNetworkCost,
    T.Usage = S.Usage,
    T.SLAPenaltyCost = S.SLAPenaltyCost,
    T.Other = S.Other,
    T.Percent = S.Percent,
    T.Credit = S.Credit,
    T.Comments = S.Comments,
    T.Clarify = S.Clarify,
    T.ImportID = S.ImportID,
    T.VendorReference = S.VendorReference,
    T._UpdatedById = S._UpdatedById,
    T._UpdatedDate = S._UpdatedDate,
    T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
    OneViewID
    ,ClientId
    ,PeriodDate
    ,EntityID
    ,AccessServiceTypeDetailID
    ,SlaTypeDetailID
    ,Location
    ,ProductType
    ,HardwareCostActivation
    ,HardwareCostPort
    ,HardwareCostRecovery
    ,HardwareCostRental
    ,HardwareCostMaintenance
    ,HardwareCostSupport
    ,HardwareCost
    ,NetworkCostBandwidth
    ,NetworkCostRental
    ,NetworkCostSLA
    ,NetworkCost
    ,OtherCost
    ,CalculatedHardwareCost
    ,CalculatedNetworkCost
    ,Usage
    ,SLAPenaltyCost
    ,Other
    ,Percent
    ,Credit
    ,Comments
    ,Clarify
    ,ImportID
    ,VendorReference
    ,_InsertedById
    ,_InsertedDate
    ,_UpdatedById
    ,_UpdatedDate
    ,_IsDeleted
) VALUES (
    S.AccountCorporateLanBlID
    ,S.ClientId
    ,S.PeriodDate
    ,S.EntityID
    ,S.AccessServiceTypeDetailID
    ,S.SlaTypeDetailID
    ,S.Location
    ,S.ProductType
    ,S.HardwareCostActivation
    ,S.HardwareCostPort
    ,S.HardwareCostRecovery
    ,S.HardwareCostRental
    ,S.HardwareCostMaintenance
    ,S.HardwareCostSupport
    ,S.HardwareCost
    ,S.NetworkCostBandwidth
    ,S.NetworkCostRental
    ,S.NetworkCostSLA
    ,S.NetworkCost
    ,S.OtherCost
    ,S.CalculatedHardwareCost
    ,S.CalculatedNetworkCost
    ,S.Usage
    ,S.SLAPenaltyCost
    ,S.Other
    ,S.Percent
    ,S.Credit
    ,S.Comments
    ,S.Clarify
    ,S.ImportID
    ,S.VendorReference
    ,S._InsertedById
    ,S._InsertedDate
    ,S._UpdatedById
    ,S._UpdatedDate
    ,S._IsDeleted
);

DELETE FROM LAN.STAGING_ACCOUNT_CORPORATE_BILLING;

RETURN 1;

END';