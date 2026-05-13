CREATE OR ALTER PROCEDURE WAN.SP_LOAD_ACCOUNT_CORPORATE_BILLING()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO WAN.ACCOUNT_CORPORATE_BILLING as T
USING (
    SELECT
        AccountCorporateWanBlID
        ,ClientId
        ,VendorId
        ,PeriodDate
        ,TrxNumber
        ,EntityID
        ,SLATag
        ,Description
        ,Location
        ,AccessServiceTypeDetailID
        ,SlaTypeDetailID
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
        ,NetworkCostVSAT
        ,NetworkCostWANContract
        ,NetworkCostLastMile
        ,NetworkCostOther
        ,NetworkCost
        ,OtherCost
        ,CalculatedHardwareCost
        ,CalculatedNetworkCost
        ,Usage
        ,SLAPenaltyCost
        ,Other
        ,Percent
        ,Credit
        ,Discounts
        ,Refunds
        ,OnceOffCharge
        ,BackBillingCost
        ,BillFrom
        ,BillTo
        ,RecurringCost
        ,Comments
        ,Clarify
        ,InstallationDate
        ,Cancellationdate
        ,AccessSpeed
        ,AccessProvider
        ,AccessServiceType
        ,Billing_Type
        ,ImportID
        ,FileTypeReference
        ,_InsertedById
        ,_InsertedDate
        ,_UpdatedById
        ,_UpdatedDate
        ,_IsDeleted
    FROM WAN.STAGING_ACCOUNT_CORPORATE_BILLING
) S
ON T.OneViewID = S.AccountCorporateWanBlID
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
    T.VendorId = S.VendorId,
    T.PeriodDate = S.PeriodDate,
    T.TrxNumber = S.TrxNumber,
    T.EntityID = S.EntityID,
    T.SLATag = S.SLATag,
    T.Description = S.Description,
    T.Location = S.Location,
    T.AccessServiceTypeDetailID = S.AccessServiceTypeDetailID,
    T.SlaTypeDetailID = S.SlaTypeDetailID,
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
    T.NetworkCostVSAT = S.NetworkCostVSAT,
    T.NetworkCostWANContract = S.NetworkCostWANContract,
    T.NetworkCostLastMile = S.NetworkCostLastMile,
    T.NetworkCostOther = S.NetworkCostOther,
    T.NetworkCost = S.NetworkCost,
    T.OtherCost = S.OtherCost,
    T.CalculatedHardwareCost = S.CalculatedHardwareCost,
    T.CalculatedNetworkCost = S.CalculatedNetworkCost,
    T.Usage = S.Usage,
    T.SLAPenaltyCost = S.SLAPenaltyCost,
    T.Other = S.Other,
    T.Percent = S.Percent,
    T.Credit = S.Credit,
    T.Discounts = S.Discounts,
    T.Refunds = S.Refunds,
    T.OnceOffCharge = S.OnceOffCharge,
    T.BackBillingCost = S.BackBillingCost,
    T.BillFrom = S.BillFrom,
    T.BillTo = S.BillTo,
    T.RecurringCost = S.RecurringCost,
    T.Comments = S.Comments,
    T.Clarify = S.Clarify,
    T.InstallationDate = S.InstallationDate,
    T.Cancellationdate = S.Cancellationdate,
    T.AccessSpeed = S.AccessSpeed,
    T.AccessProvider = S.AccessProvider,
    T.AccessServiceType = S.AccessServiceType,
    T.Billing_Type = S.Billing_Type,
    T.ImportID = S.ImportID,
    T.FileTypeReference = S.FileTypeReference,
    T._UpdatedById = S._UpdatedById,
    T._UpdatedDate = S._UpdatedDate,
    T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
    OneViewID
    ,ClientId
    ,VendorId
    ,PeriodDate
    ,TrxNumber
    ,EntityID
    ,SLATag
    ,Description
    ,Location
    ,AccessServiceTypeDetailID
    ,SlaTypeDetailID
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
    ,NetworkCostVSAT
    ,NetworkCostWANContract
    ,NetworkCostLastMile
    ,NetworkCostOther
    ,NetworkCost
    ,OtherCost
    ,CalculatedHardwareCost
    ,CalculatedNetworkCost
    ,Usage
    ,SLAPenaltyCost
    ,Other
    ,Percent
    ,Credit
    ,Discounts
    ,Refunds
    ,OnceOffCharge
    ,BackBillingCost
    ,BillFrom
    ,BillTo
    ,RecurringCost
    ,Comments
    ,Clarify
    ,InstallationDate
    ,Cancellationdate
    ,AccessSpeed
    ,AccessProvider
    ,AccessServiceType
    ,Billing_Type
    ,ImportID
    ,FileTypeReference
    ,_InsertedById
    ,_InsertedDate
    ,_UpdatedById
    ,_UpdatedDate
    ,_IsDeleted
) VALUES (
    S.AccountCorporateWanBlID
    ,S.ClientId
    ,S.VendorId
    ,S.PeriodDate
    ,S.TrxNumber
    ,S.EntityID
    ,S.SLATag
    ,S.Description
    ,S.Location
    ,S.AccessServiceTypeDetailID
    ,S.SlaTypeDetailID
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
    ,S.NetworkCostVSAT
    ,S.NetworkCostWANContract
    ,S.NetworkCostLastMile
    ,S.NetworkCostOther
    ,S.NetworkCost
    ,S.OtherCost
    ,S.CalculatedHardwareCost
    ,S.CalculatedNetworkCost
    ,S.Usage
    ,S.SLAPenaltyCost
    ,S.Other
    ,S.Percent
    ,S.Credit
    ,S.Discounts
    ,S.Refunds
    ,S.OnceOffCharge
    ,S.BackBillingCost
    ,S.BillFrom
    ,S.BillTo
    ,S.RecurringCost
    ,S.Comments
    ,S.Clarify
    ,S.InstallationDate
    ,S.Cancellationdate
    ,S.AccessSpeed
    ,S.AccessProvider
    ,S.AccessServiceType
    ,S.Billing_Type
    ,S.ImportID
    ,S.FileTypeReference
    ,S._InsertedById
    ,S._InsertedDate
    ,S._UpdatedById
    ,S._UpdatedDate
    ,S._IsDeleted
);

DELETE FROM WAN.STAGING_ACCOUNT_CORPORATE_BILLING;

RETURN 1;

END';