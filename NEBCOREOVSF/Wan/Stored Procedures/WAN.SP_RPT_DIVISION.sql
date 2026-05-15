CREATE OR REPLACE PROCEDURE WAN.SP_RPT_DIVISION(ClientID NUMBER(38,0), PeriodDate DATE, VendorID NUMBER(38,0))
RETURNS TABLE (
	DivisionID NUMBER(38,0),
	Division VARCHAR,
	OrderValue NUMBER(38,0)
)
LANGUAGE SQL
EXECUTE AS OWNER
AS
$$
DECLARE
    effective_period_date DATE;
    res RESULTSET;

BEGIN
    effective_period_date := IFF(
        :PeriodDate = TO_DATE('1900-01-01'),
        (SELECT MAX(mth.PeriodDate) 
        FROM WAN.ACCOUNT_CORPORATE_BILLING mth WHERE COALESCE(mth._IsDeleted, FALSE) = FALSE),
        :PeriodDate
    );

    res := (
        SELECT
            divs.DivisionID,
            divs.Division,
            divs.OrderValue
        FROM (
            SELECT
                -1 AS DivisionID,
                'All' AS Division,
                1 AS OrderValue

            UNION ALL

            SELECT DISTINCT
                entown.DivisionID AS DivisionID,
                div.Division AS Division,
                2 AS OrderValue
            FROM WAN.ACCOUNT_CORPORATE_BILLING wan
            JOIN NEBCOREODMSFDEV.ONEVIEW.DIMCLIENT cl ON wan.ClientID = cl._ID
            AND cl.ClientID = :ClientID
            LEFT JOIN ORGANISATION.ENTITY_OWNER entown
                ON wan.EntityID = entown.EntityID
                AND entown.PeriodDate = :effective_period_date
                AND COALESCE(entown._IsDeleted, FALSE) = FALSE
            LEFT JOIN ORGANISATION.DIVISION div
                ON entown.DivisionID = div._ID
                AND COALESCE(div._IsDeleted, FALSE) = FALSE
            WHERE wan.PeriodDate = :effective_period_date
            AND COALESCE(wan._IsDeleted, FALSE) = FALSE
            AND (:VendorID = -1 OR wan.VendorID = :VendorID)
            AND entown.DivisionID IS NOT NULL
        ) divs
        ORDER BY divs.OrderValue, divs.Division
    );
	RETURN TABLE(res);
END;
$$





    -- SELECT TOP 100 *
    -- FROM 

    SELECT DISTINCT
        entown.DivisionID AS DivisionID,
        div.Division AS Division,
        2 AS OrderValue
    FROM WAN.ACCOUNT_CORPORATE_BILLING wan
    JOIN NEBCOREODMSFDEV.ONEVIEW.DIMCLIENT cl ON wan.ClientID = cl._ID
    AND cl.ClientID = $ClientID
    LEFT JOIN ORGANISATION.ENTITY_OWNER entown
        ON wan.EntityID = entown.EntityID
        AND entown.PeriodDate = $PeriodDate
        AND COALESCE(entown._IsDeleted, FALSE) = FALSE
    LEFT JOIN ORGANISATION.DIVISION div
        ON entown.DivisionID = div._ID
        AND COALESCE(div._IsDeleted, FALSE) = FALSE
    WHERE wan.PeriodDate = $PeriodDate
    AND COALESCE(wan._IsDeleted, FALSE) = FALSE
    AND ($VendorID = -1 OR wan.VendorID = $VendorID)
    AND entown.DivisionID IS NOT NULL;


