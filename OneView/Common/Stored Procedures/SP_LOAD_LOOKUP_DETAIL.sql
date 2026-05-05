CREATE OR ALTER PROCEDURE COMMON.SP_LOAD_LOOKUP_DETAIL()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO COMMON.LOOKUP_DETAIL as T
USING (
	SELECT
        DetailId        
        ,GroupId         
        ,Reference       
        ,ClientReference 
        ,ClientId        
        ,ShortDescription
        ,LongDescription 
        ,SystemBit       
        ,ActiveBit       
        ,ParentDetailID  
        ,ClientVisibleBit
        ,_InsertedById   
        ,_InsertedDate   
        ,_UpdatedById    
        ,_UpdatedDate    
        ,_IsDeleted             
	FROM COMMON.STAGING_LOOKUP_DETAIL
) S
ON T.OneViewId = S.DetailId
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
	T.GroupId = S.GroupId,
	T.Reference = S.Reference,
	T.ClientId = S.ClientId,
	T.ShortDescription = S.ShortDescription,
	T.LongDescription = S.LongDescription,
	T.SystemBit = S.SystemBit,
	T.ActiveBit = S.ActiveBit,
	T.ParentDetailID = S.ParentDetailID,
	T.ClientVisibleBit = S.ClientVisibleBit,
	T._UpdatedById = S._UpdatedById,
	T._UpdatedDate = S._UpdatedDate,
	T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
	OneViewId            
	,GroupId             
	,Reference           
	,ClientId            
	,ShortDescription    
	,LongDescription     
	,SystemBit           
	,ActiveBit           
	,ParentDetailID      
	,ClientVisibleBit    
	,_InsertedById        
	,_InsertedDate        
	,_UpdatedById         
	,_UpdatedDate         
	,_IsDeleted           
) VALUES (
	 S.DetailId      
	,S.GroupId    
	,S.Reference           
	,S.ClientId           
	,S.ShortDescription   
	,S.LongDescription    
	,S.SystemBit          
	,S.ActiveBit          
	,S.ParentDetailID     
	,S.ClientVisibleBit   
	,S._InsertedById      
	,S._InsertedDate      
	,S._UpdatedById       
	,S._UpdatedDate       
	,S._IsDeleted         
);

DELETE FROM COMMON.STAGING_LOOKUP_DETAIL;

RETURN 1;

END';
