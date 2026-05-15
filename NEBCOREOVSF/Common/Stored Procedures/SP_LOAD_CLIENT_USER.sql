CREATE OR ALTER PROCEDURE COMMON.SP_LOAD_CLIENT_USER()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO COMMON.CLIENT_USERS as T
USING (
	SELECT
		ClientUserID
		,ClientId
		,ClientReference
		,UserId
		,Email
		,ClientUserEmail
		,_InsertedById
		,_InsertedDate
		,_UpdatedById
		,_UpdatedDate
		,_IsDeleted
	FROM COMMON.STAGING_CLIENT_USERS
) S
ON T.OneViewID = S.ClientUserID
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
	T.ClientReference = S.ClientReference,
	T.UserId = S.UserId,
	T.Email = S.Email,
	T.ClientUserEmail = S.ClientUserEmail,
	T._UpdatedById = S._UpdatedById,
	T._UpdatedDate = S._UpdatedDate,
	T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
	OneViewID
	,ClientId
	,ClientReference
	,UserId
	,Email
	,ClientUserEmail
	,_InsertedById
	,_InsertedDate
	,_UpdatedById
	,_UpdatedDate
	,_IsDeleted
) VALUES (
	S.ClientUserID
	,S.ClientId
	,S.ClientReference
	,S.UserId
	,S.Email
	,S.ClientUserEmail
	,S._InsertedById
	,S._InsertedDate
	,S._UpdatedById
	,S._UpdatedDate
	,S._IsDeleted
);

DELETE FROM COMMON.STAGING_CLIENT_USERS;

RETURN 1;

END';
