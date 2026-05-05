CREATE OR ALTER PROCEDURE COMMON.SP_LOAD_LOOKUP_GROUP()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO COMMON.LOOKUP_GROUP as T
USING (
	SELECT
        GroupId       
        ,ClientReference
        ,ClientId      
        ,ParentGroupId 
        ,Reference     
        ,GroupName     
        ,Description   
        ,_InsertedById 
        ,_InsertedDate 
        ,_UpdatedById  
        ,_UpdatedDate  
        ,_IsDeleted               
	FROM COMMON.STAGING_LOOKUP_GROUP
) S
ON T.OneViewId = S.GroupId
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
	T.GroupId = S.GroupId,
	T.ClientId = S.ClientId,
	T.Reference = S.Reference,
	T.GroupName = S.GroupName,
	T.Description = S.Description,
	T.ParentGroupId = S.ParentGroupId,
	T._UpdatedById = S._UpdatedById,
	T._UpdatedDate = S._UpdatedDate,
	T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
	OneViewId            
	,GroupId             
	,Reference           
	,ClientId            
	,GroupName    
	,Description     
	,ParentGroupId      
	,_UpdatedById         
	,_UpdatedDate         
	,_IsDeleted           
) VALUES (
	 S.GroupId      
	,S.Reference           
	,S.ClientId           
	,S.GroupName   
	,S.Description    
	,S.ParentGroupId     
	,S._UpdatedById       
	,S._UpdatedDate       
	,S._IsDeleted         
);

DELETE FROM COMMON.STAGING_LOOKUP_GROUP;

RETURN 1;

END';
