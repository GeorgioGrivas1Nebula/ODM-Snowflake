CREATE OR REPLACE FUNCTION ORGANISATION.TF_ENTITY_OWNER_AS_OF(AsAtPeriodDate DATE)
RETURNS TABLE (
    EntityID INT,
    OwnerID INT,
    OwnerNo VARCHAR,
    CostCentreID INT,
    DivisionID INT,
    EmployeeID INT,
    TMSVendorID INT,
    TMSDetailProductID INT,
    AllocationGroupID INT,
    TMSAllowance NUMBER(18,2),
    DefaultBit BOOLEAN
)
AS
$$
    SELECT
        eos.EntityID,
        eos.OwnerID,
        eos.OwnerNo,
        eos.CostCentreID,
        eos.DivisionID,
        eos.EmployeeID,
        eos.TMSVendorID,
        eos.TMSDetailProductID,
        eos.AllocationGroupID,
        eos.TMSAllowance,
        eos.DefaultBit
    FROM (
        SELECT
            eno.EntityID,
            eno.OwnerID,
            own.OwnerNo,
            eno.CostCentreID,
            eno.DivisionID,
            eno.EmployeeID,
            eno.TMSVendorID,
            eno.TMSDetailProductID,
            eno.AllocationGroupID,
            eno.TMSAllowance,
            eno.DefaultBit,
            ROW_NUMBER() OVER (
                PARTITION BY eno.EntityID
                ORDER BY eno.PeriodDate DESC
            ) AS RowNum
        FROM ORGANISATION.ENTITY_OWNER eno
        JOIN ORGANISATION.OWNER own
            ON eno.OwnerID = own._ID
           AND COALESCE(own._IsDeleted, FALSE) = FALSE
        WHERE eno.PeriodDate <= AsAtPeriodDate
          AND COALESCE(eno._IsDeleted, FALSE) = FALSE
    ) eos
    WHERE eos.RowNum = 1
$$;