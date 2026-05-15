CREATE OR REPLACE VIEW WAN.VW_ACCOUNT_CORPORATE_BILLING AS
WITH EntityOwnerAsOf AS (
	SELECT
		vacw._ID AS AccountCorporateWanBlID,
		eno.OwnerID,
		eno.DivisionID,
		ROW_NUMBER() OVER (
			PARTITION BY vacw._ID
			ORDER BY eno.PeriodDate DESC
		) AS RowNum
	FROM WAN.Account_Corporate_Billing vacw
	LEFT JOIN Organisation.Entity_Owner eno
		ON eno.EntityID = vacw.EntityID
	   AND eno.PeriodDate <= vacw.PeriodDate::DATE
	   AND COALESCE(eno._IsDeleted, FALSE) = FALSE
	WHERE COALESCE(vacw._IsDeleted, FALSE) = FALSE
)
SELECT
	vacw._ID AS AccountCorporateWanBlID,
    vacw.ClientID,
	vacw.PeriodDate,
	vacw.ImportID,
	vacw.TrxNumber,
	oe._ID AS EntityID,
	oe.Entity,
	oe.TypeID AS EntityTypeID,
	va._ID AS AccountID,
	oe.KnownExceptions,
	va.AccountNo,
	oo._ID AS OwnerID,
	oo.Owner,
	ctry.Country,
	br._ID AS BrandID,
	br.Brand,
	od._ID AS DivisionID,
	od.Division,
	occ._ID AS CostCentreID,
	occ.CostCentre,
	occ.ERPCostCentre,
	occ.ERPCustomer,
	cmp._ID AS CompanyID,
	v._ID AS VendorID,
	v.VENDOR AS Vendor,
	COALESCE(vacw.HardwareCost, 0) AS HardwareCost,
	COALESCE(vacw.NetworkCost, 0) AS NetworkCost,
	COALESCE(vacw.CalculatedNetworkCost, 0) AS CalculatedNetworkCost,
	COALESCE(vacw.CalculatedHardwareCost, 0) AS CalculatedHardwareCost,
	vacw.Usage,
	COALESCE(vacw.SLAPenaltyCost, 0) AS SLAPenaltyCost,
	vacw.SLATag,
	acm.LongDescription AS AccessMedium,
	COALESCE(stp.ShortDescription, vacw.SLATag) AS ServiceType,
	COALESCE(lkpSLA.ShortDescription, vacw.SLATag) AS "SLA Type",
	COALESCE(vacw.OtherCost, 0) AS OtherCost,
	COALESCE(vacw.Percent, 0) AS Percent,
	COALESCE(vacw.Credit, 0) AS Credit,
	COALESCE(vacw.Discounts, 0) AS Discounts,
	COALESCE(vacw.Refunds, 0) AS Refunds,
	COALESCE(vacw.OnceOffCharge, 0) AS OnceOffCharge,
	COALESCE(vacw.BackBillingCost, 0) AS BackBillingCost,
	COALESCE(vacw.RecurringCost, 0) AS RecurringCost,
	COALESCE(vacw.HardwareCostActivation, 0) AS HardwareCostActivation,
	COALESCE(vacw.HardwareCostMaintenance, 0) AS HardwareCostMaintenance,
	COALESCE(vacw.HardwareCostPort, 0) AS HardwareCostPort,
	COALESCE(vacw.HardwareCostRecovery, 0) AS HardwareCostRecovery,
	COALESCE(vacw.HardwareCostRental, 0) AS HardwareCostRental,
	COALESCE(vacw.HardwareCostSupport, 0) AS HardwareCostSupport,
	COALESCE(vacw.NetworkCostBandwidth, 0) AS NetworkCostBandwidth,
	COALESCE(vacw.NetworkCostLastMile, 0) AS NetworkCostLastMile,
	COALESCE(vacw.NetworkCostOther, 0) AS NetworkCostOther,
	COALESCE(vacw.NetworkCostRental, 0) AS NetworkCostRental,
	COALESCE(vacw.NetworkCostSLA, 0) AS NetworkCostSLA,
	COALESCE(vacw.NetworkCostVSAT, 0) AS NetworkCostVSAT,
	vacw.BillFrom,
	vacw.BillTo,
	vacw.NetworkCostWANContract,
	vacw.Comments,
	vacw.Clarify,
	vacw.SlaTypeDetailID,
	vacw.AccessServiceTypeDetailID,
	vacw.Description,
	vacw.Location,
	COALESCE(vacw.NetworkCost, 0)
		+ COALESCE(vacw.HardwareCost, 0)
		+ COALESCE(vacw.OtherCost, 0)
		+ COALESCE(vacw.OnceOffCharge, 0)
		+ COALESCE(vacw.BackBillingCost, 0)
		+ COALESCE(vacw.RecurringCost, 0) AS TotalCost,
	vacw.InstallationDate,
	vacw.Cancellationdate,
	vacw.AccessSpeed,
	vacw.AccessProvider,
	vacw.AccessServiceType,
	CASE
		WHEN vacw.FileTypeReference = 'WanCNCBlFl' THEN 'CNC'
		WHEN vacw.FileTypeReference = 'WanFntBlFl' THEN 'Fastnet'
		WHEN vacw.FileTypeReference = 'WanVPNBlFl' THEN 'VPN'
		WHEN vacw.FileTypeReference = 'WanMetBlFl' THEN 'Metacom'
		WHEN vacw.FileTypeReference = 'WanVSATBlFl' THEN 'VSAT'
		ELSE COALESCE(vacw.Billing_Type, '')
	END AS "Billing Type"
FROM WAN.Account_Corporate_Billing vacw
LEFT JOIN Organisation.Entity oe
	ON vacw.EntityID = oe._ID
   AND COALESCE(oe._IsDeleted, FALSE) = FALSE
LEFT JOIN Organisation.Account va
	ON oe.AccountID = va._ID
   AND COALESCE(va._IsDeleted, FALSE) = FALSE
LEFT JOIN EntityOwnerAsOf oeo       
	ON oeo.AccountCorporateWanBlID = vacw._ID
	AND oeo.RowNum = 1
LEFT JOIN Organisation.Owner oo
	ON oeo.OwnerID = oo._ID
   AND COALESCE(oo._IsDeleted, FALSE) = FALSE
LEFT JOIN Organisation.Cost_Centre occ
	ON oo.CostCentreID = occ._ID
   AND COALESCE(occ._IsDeleted, FALSE) = FALSE
LEFT JOIN Organisation.Company cmp
	ON occ.CompanyID = cmp._ID
   AND COALESCE(cmp._IsDeleted, FALSE) = FALSE
LEFT JOIN Organisation.Division od
	ON oeo.DivisionID = od._ID
   AND COALESCE(od._IsDeleted, FALSE) = FALSE
LEFT JOIN NEBCOREODMSFDEV.ONEVIEW.DIMVENDOR v
	ON vacw.VendorId = v._ID
LEFT JOIN Organisation.Entity_Enrichment enr
	ON enr.EntityID = oe._ID
   AND COALESCE(enr._IsDeleted, FALSE) = FALSE
LEFT JOIN Common.Lookup_Detail acm
	ON acm._ID = enr.AccessMediumDetailID
   AND COALESCE(acm._IsDeleted, FALSE) = FALSE
LEFT JOIN Common.Lookup_Detail stp
	ON stp._ID = enr.UsedForDetailID
   AND COALESCE(stp._IsDeleted, FALSE) = FALSE
LEFT JOIN Common.Lookup_Detail lkpSLA
	ON lkpSLA._ID = vacw.SlaTypeDetailID
   AND COALESCE(lkpSLA._IsDeleted, FALSE) = FALSE
LEFT JOIN Common.Country ctry
	ON oo.AdminCountryLink = ctry.Link
   AND ctry.ClientID = vacw.ClientId
   AND COALESCE(ctry._IsDeleted, FALSE) = FALSE
LEFT JOIN Organisation.Brand br
	ON oo.BrandID = br._ID
   AND COALESCE(br._IsDeleted, FALSE) = FALSE
WHERE COALESCE(vacw._IsDeleted, FALSE) = FALSE;