CREATE OR ALTER PROCEDURE COMMON.SP_LOAD_CLIENT_VENDOR()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO COMMON.CLIENT_VENDOR as T
USING (
	SELECT
		ClientVendorID     
		,ClientReference   
		,ClientId          
		,VendorReference   
		,TypeDetailID      
		,StatusDetailID    
		,AdministratorEmail
		,BYOD              
		,GLAccountNo       
		,_InsertedById     
		,_InsertedDate     
		,_UpdatedById      
		,_UpdatedDate      
		,_IsDeleted        
	FROM COMMON.STAGING_CLIENT_VENDOR
) S
ON T.OneViewId = S.ClientVendorID
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
	T.TypeDetailID = S.TypeDetailID,
	T.StatusDetailID = S.StatusDetailID,
	T.AdministratorEmail = S.AdministratorEmail,
	T.BYOD = S.BYOD,
	T.GLAccountNo = S.GLAccountNo,
	T._UpdatedById = S._UpdatedById,
	T._UpdatedDate = S._UpdatedDate,
	T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
	OneViewId            
	,ClientID             
	,TypeDetailID         
	,StatusDetailID       
	,AdministratorEmail   
	,BYOD                 
	,GLAccountNo          
	,_InsertedById        
	,_InsertedDate        
	,_UpdatedById         
	,_UpdatedDate         
	,_IsDeleted           
) VALUES (
	 S.ClientVendorID      
	,S.ClientReference    
	,S.ClientId           
	,S.VendorReference    
	,S.TypeDetailID       
	,S.StatusDetailID     
	,S.AdministratorEmail 
	,S.BYOD               
	,S.GLAccountNo        
	,S._InsertedById      
	,S._InsertedDate      
	,S._UpdatedById       
	,S._UpdatedDate       
	,S._IsDeleted         
);

DELETE FROM COMMON.STAGING_CLIENT_VENDOR;

RETURN 1;

END';
