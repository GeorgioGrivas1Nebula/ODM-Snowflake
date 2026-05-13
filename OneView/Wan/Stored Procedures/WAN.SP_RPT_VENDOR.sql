CREATE OR REPLACE PROCEDURE WAN.SP_RPT_VENDOR(ClientID NUMBER(38,0))
RETURNS TABLE (
	Vendor VARCHAR,
	VendorID VARCHAR,
	OrderValue NUMBER(38,0)
)
LANGUAGE SQL
EXECUTE AS OWNER
AS
$$
DECLARE res RESULTSET DEFAULT (
	SELECT
		ven.Vendor,
		ven.VendorID,
		ven.OrderValue
	FROM (
		SELECT
			'All' AS Vendor,
			'-1' AS VendorID,
			1 AS OrderValue

		UNION ALL

		SELECT DISTINCT
			v.Vendor AS Vendor,
			TO_VARCHAR(v._ID) AS VendorID,
			2 AS OrderValue
		FROM WAN.ACCOUNT_CORPORATE_BILLING bl
        JOIN NEBCOREODMSFDEV.ONEVIEW.DIMCLIENT cl ON bl.ClientID = cl._ID
        AND cl.ClientID = :ClientID
		JOIN ORGANISATION.ENTITY ent
			ON ent._ID = bl.EntityID
		   AND ent._IsDeleted = FALSE
		JOIN NEBCOREODMSFDEV.ONEVIEW.DIMVENDOR v
			ON v._ID = bl.VendorID
		WHERE COALESCE(bl._IsDeleted, FALSE) = FALSE
	) ven
	ORDER BY ven.OrderValue, ven.Vendor
);
BEGIN
	RETURN TABLE(res);
END;
$$

