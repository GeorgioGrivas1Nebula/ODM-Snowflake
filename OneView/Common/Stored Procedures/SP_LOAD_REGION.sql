CREATE OR ALTER PROCEDURE COMMON.SP_LOAD_REGION()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO COMMON.REGION as T
USING (
	SELECT
	RegionId,
    ClientReference,  
    ClientId,         
    Region,           
    Email,            
    Business_Manager,
    Regional_Manager, 
    UserAddedID, 
    DateAdded, 
    UserUpdatedID, 
    DateUpdated, 
    _DeletedBit
	FROM COMMON.STAGING_REGION
) S
ON T.OneViewRegionId = S.RegionId
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S.DateUpdated != T.DateUpdated
THEN UPDATE SET
    T.Region = S.Region,
    T.Email = S.Email,
    T.Business_Manager = S.Business_Manager,
    T.Regional_Manager = S.Regional_Manager,
    T._UpdatedDate = S._UpdatedDate,
    T._UpdatedById = S._UpdatedById,
    T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
	OneViewRegionId
    ,ClientId         
    ,Region           
    ,Email            
    ,Business_Manager
    ,Regional_Manager 
    ,_InsertedById   
    ,_InsertedDate   
    ,_UpdatedById    
    ,_UpdatedDate    
    ,_IsDeleted 
) VALUES (
	S.RegionId,
    S.ClientId,         
    S.Region,           
    S.Email,            
    S.Business_Manager,
    S.Regional_Manager, 
    S._InsertedById, 
    S._InsertedDate, 
    S._UpdatedById, 
    S._UpdatedDate, 
    S._IsDeleted 
);

DELETE FROM COMMON.STAGING_REGION;

RETURN 1;

END';
