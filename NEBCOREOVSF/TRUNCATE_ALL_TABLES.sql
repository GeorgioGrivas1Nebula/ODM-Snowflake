-- Truncate all current OneView tables.
BEGIN
-- Common
TRUNCATE TABLE Common.Client_Vendor;
TRUNCATE TABLE Common.Country;
TRUNCATE TABLE Common.Language;
TRUNCATE TABLE Common.Lookup_Detail;
TRUNCATE TABLE Common.Lookup_Group;
TRUNCATE TABLE Common.Region;
TRUNCATE TABLE Common.Staging_Client_Vendor;
TRUNCATE TABLE Common.Staging_Country;
TRUNCATE TABLE Common.Staging_Language;
TRUNCATE TABLE Common.Staging_Lookup_Detail;
TRUNCATE TABLE Common.Staging_Lookup_Group;
TRUNCATE TABLE Common.Staging_Region;

-- Lan
TRUNCATE TABLE LAN.Account_Corporate_Billing;
TRUNCATE TABLE LAN.Staging_Account_Corporate_Billing;

-- Organisation
TRUNCATE TABLE Organisation.Account;
TRUNCATE TABLE Organisation.Allocation_Group;
TRUNCATE TABLE Organisation.Brand;
TRUNCATE TABLE Organisation.Business_Unit;
TRUNCATE TABLE Organisation.Capacity_Group;
TRUNCATE TABLE Organisation.Company;
TRUNCATE TABLE Organisation.Cost_Centre;
TRUNCATE TABLE Organisation.Division;
TRUNCATE TABLE Organisation.Employee;
TRUNCATE TABLE Organisation.Entity;
TRUNCATE TABLE Organisation.Entity_Enrichment;
TRUNCATE TABLE Organisation.Entity_Owner;
TRUNCATE TABLE Organisation.Entity_Product;
TRUNCATE TABLE Organisation.Owner;
TRUNCATE TABLE Organisation.Owner_Type;
TRUNCATE TABLE Organisation.Staging_Account;
TRUNCATE TABLE Organisation.Staging_Allocation_Group;
TRUNCATE TABLE Organisation.Staging_Brand;
TRUNCATE TABLE Organisation.Staging_Business_Unit;
TRUNCATE TABLE Organisation.Staging_Capacity_Group;
TRUNCATE TABLE Organisation.Staging_Company;
TRUNCATE TABLE Organisation.Staging_Cost_Centre;
TRUNCATE TABLE Organisation.Staging_Division;
TRUNCATE TABLE Organisation.Staging_Employee;
TRUNCATE TABLE Organisation.Staging_Entity;
TRUNCATE TABLE Organisation.Staging_Entity_Enrichment;
TRUNCATE TABLE Organisation.Staging_Entity_Owner;
TRUNCATE TABLE Organisation.Staging_Entity_Product;
TRUNCATE TABLE Organisation.Staging_Owner;
TRUNCATE TABLE Organisation.Staging_Owner_Type;

-- Voice
TRUNCATE TABLE Voice.STAGING_TMS_DETAIL_PRODUCT;
TRUNCATE TABLE Voice.TMS_DETAIL_PRODUCT;

-- Wan
TRUNCATE TABLE WAN.Account_Corporate_Billing;
TRUNCATE TABLE WAN.Staging_Account_Corporate_Billing;

END

