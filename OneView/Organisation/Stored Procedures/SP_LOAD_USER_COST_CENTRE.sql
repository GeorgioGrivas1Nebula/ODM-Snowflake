CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_USER_COST_CENTRE()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO ORGANISATION.USER_COST_CENTRE as T
USING (
	SELECT
		UserCostCentreID
		,ClientId
		,UserId
		,CostCentreId
		,_InsertedById
		,_InsertedDate
		,_UpdatedById
		,_UpdatedDate
		,_IsDeleted
	FROM ORGANISATION.STAGING_USER_COST_CENTRE
) S
ON T.OneViewID = S.UserCostCentreID
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
	T.UserId = S.UserId,
	T.CostCentreId = S.CostCentreId,
	T._UpdatedById = S._UpdatedById,
	T._UpdatedDate = S._UpdatedDate,
	T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
	OneViewID
	,ClientId
	,UserId
	,CostCentreId
	,_InsertedById
	,_InsertedDate
	,_UpdatedById
	,_UpdatedDate
	,_IsDeleted
) VALUES (
	S.UserCostCentreID
	,S.ClientId
	,S.UserId
	,S.CostCentreId
	,S._InsertedById
	,S._InsertedDate
	,S._UpdatedById
	,S._UpdatedDate
	,S._IsDeleted
);

DELETE FROM ORGANISATION.STAGING_USER_COST_CENTRE;

RETURN 1;

END';