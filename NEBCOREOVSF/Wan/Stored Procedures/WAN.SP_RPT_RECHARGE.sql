CREATE OR REPLACE PROCEDURE WAN.SP_RPT_RECHARGE(
    ClientID NUMBER(38,0),
	PeriodDate DATE,
	VendorID NUMBER(38,0),
	Type VARCHAR,
	DivisionID NUMBER(38,0)
)
RETURNS TABLE (
	Division VARCHAR,
	CostCentre VARCHAR,
	Owner VARCHAR,
	VSATBackup NUMBER(18,2),
	WANContract NUMBER(18,2),
	LastMile NUMBER(18,2),
	NetworkOther NUMBER(18,2),
	Other NUMBER(18,2),
	Total NUMBER(18,2),
	VAT NUMBER(18,2)
)
LANGUAGE SQL
EXECUTE AS OWNER
AS
$$
DECLARE
	effective_period_date DATE;
	vat_rate NUMBER(10,4) DEFAULT 0.14;
	res RESULTSET;

BEGIN
	effective_period_date := IFF(
		:PeriodDate = TO_DATE('1900-01-01'),
		(
			SELECT MAX(mth.PeriodDate)
			FROM WAN.ACCOUNT_CORPORATE_BILLING mth
			WHERE COALESCE(mth._IsDeleted, FALSE) = FALSE
		),
		:PeriodDate
	);

	IF (UPPER(:Type) = 'SUM') THEN
		res := (
			SELECT
				COALESCE(div.Division, '-Unknown-') AS Division,
				CAST(NULL AS VARCHAR) AS CostCentre,
				CAST(NULL AS VARCHAR) AS Owner,
				SUM(COALESCE(wan.NetworkCostVSAT, 0.00)) AS VSATBackup,
				SUM(COALESCE(wan.NetworkCostWANContract, 0.00)) AS WANContract,
				SUM(COALESCE(wan.NetworkCostLastMile, 0.00)) AS LastMile,
				SUM(COALESCE(wan.NetworkCostOther, 0.00)) AS NetworkOther,
				SUM(COALESCE(wan.OtherCost, 0.00)) AS Other,
				SUM(COALESCE(wan.NetworkCostVSAT, 0.00))
				+ SUM(COALESCE(wan.NetworkCostWANContract, 0.00))
				+ SUM(COALESCE(wan.NetworkCostLastMile, 0.00))
				+ SUM(COALESCE(wan.NetworkCostOther, 0.00))
				+ SUM(COALESCE(wan.OtherCost, 0.00)) AS Total,
				(
					SUM(COALESCE(wan.NetworkCostVSAT, 0.00))
					+ SUM(COALESCE(wan.NetworkCostWANContract, 0.00))
					+ SUM(COALESCE(wan.NetworkCostLastMile, 0.00))
					+ SUM(COALESCE(wan.NetworkCostOther, 0.00))
					+ SUM(COALESCE(wan.OtherCost, 0.00))
				) * :vat_rate AS VAT
			FROM WAN.ACCOUNT_CORPORATE_BILLING wan
            JOIN NEBCOREODMSFDEV.ONEVIEW.DIMCLIENT cl ON wan.ClientID = cl._ID
            AND cl.ClientID = :ClientID
			LEFT JOIN TABLE(ORGANISATION.TF_ENTITY_OWNER_AS_OF(:effective_period_date)) entown
				ON wan.EntityID = entown.EntityID
			LEFT JOIN ORGANISATION.DIVISION div
				ON entown.DivisionID = div._ID
			   AND COALESCE(div._IsDeleted, FALSE) = FALSE
			WHERE wan.PeriodDate = :effective_period_date
			AND COALESCE(wan._IsDeleted, FALSE) = FALSE
			AND (:VendorID = -1 OR wan.VendorID = :VendorID)
			AND (:DivisionID = -1 OR entown.DivisionID = :DivisionID)
			GROUP BY div.Division
			ORDER BY div.Division
		);
	ELSEIF (UPPER(:Type) = 'DET') THEN
		res := (
			SELECT
				COALESCE(div.Division, '-Unknown-') AS Division,
				cc.CostCentre,
				own.Owner,
				SUM(COALESCE(wan.NetworkCostVSAT, 0.00)) AS VSATBackup,
				SUM(COALESCE(wan.NetworkCostWANContract, 0.00)) AS WANContract,
				SUM(COALESCE(wan.NetworkCostLastMile, 0.00)) AS LastMile,
				SUM(COALESCE(wan.NetworkCostOther, 0.00)) AS NetworkOther,
				SUM(COALESCE(wan.OtherCost, 0.00)) AS Other,
				SUM(COALESCE(wan.NetworkCostVSAT, 0.00))
				+ SUM(COALESCE(wan.NetworkCostWANContract, 0.00))
				+ SUM(COALESCE(wan.NetworkCostLastMile, 0.00))
				+ SUM(COALESCE(wan.NetworkCostOther, 0.00))
				+ SUM(COALESCE(wan.OtherCost, 0.00)) AS Total,
				(
					SUM(COALESCE(wan.NetworkCostVSAT, 0.00))
					+ SUM(COALESCE(wan.NetworkCostWANContract, 0.00))
					+ SUM(COALESCE(wan.NetworkCostLastMile, 0.00))
					+ SUM(COALESCE(wan.NetworkCostOther, 0.00))
					+ SUM(COALESCE(wan.OtherCost, 0.00))
				) * :vat_rate AS VAT
			FROM WAN.ACCOUNT_CORPORATE_BILLING wan
            JOIN NEBCOREODMSFDEV.ONEVIEW.DIMCLIENT cl ON wan.ClientID = cl._ID
            AND cl.ClientID = :ClientID
			LEFT JOIN TABLE(ORGANISATION.TF_ENTITY_OWNER_AS_OF(:effective_period_date)) entown
				ON wan.EntityID = entown.EntityID
			LEFT JOIN ORGANISATION.DIVISION div
				ON entown.DivisionID = div._ID
			   AND COALESCE(div._IsDeleted, FALSE) = FALSE
			LEFT JOIN ORGANISATION.COST_CENTRE cc
				ON entown.CostCentreID = cc._ID
			   AND COALESCE(cc._IsDeleted, FALSE) = FALSE
			LEFT JOIN ORGANISATION.OWNER own
				ON entown.OwnerID = own._ID
			   AND COALESCE(own._IsDeleted, FALSE) = FALSE
			WHERE wan.PeriodDate = :effective_period_date
			AND COALESCE(wan._IsDeleted, FALSE) = FALSE
			AND (:VendorID = -1 OR wan.VendorID = :VendorID)
			AND (:DivisionID = -1 OR entown.DivisionID = :DivisionID)
			GROUP BY div.Division, entown.CostCentreID, cc.CostCentre, own.Owner, entown.OwnerID
			ORDER BY div.Division, cc.CostCentre, own.Owner
		);
	ELSE
		res := (
			SELECT
				CAST(NULL AS VARCHAR) AS Division,
				CAST(NULL AS VARCHAR) AS CostCentre,
				CAST(NULL AS VARCHAR) AS Owner,
				CAST(NULL AS NUMBER(18,2)) AS VSATBackup,
				CAST(NULL AS NUMBER(18,2)) AS WANContract,
				CAST(NULL AS NUMBER(18,2)) AS LastMile,
				CAST(NULL AS NUMBER(18,2)) AS NetworkOther,
				CAST(NULL AS NUMBER(18,2)) AS Other,
				CAST(NULL AS NUMBER(18,2)) AS Total,
				CAST(NULL AS NUMBER(18,2)) AS VAT
			WHERE 1 = 0
		);
	END IF;

	RETURN TABLE(res);
END;
$$

CALL WAN.SP_RPT_RECHARGE(
	ClientID => 1033,
	PeriodDate => TO_DATE('1900-01-01'),
	VendorID => -1,
	Type => 'SUM',
	DivisionID => -1
);