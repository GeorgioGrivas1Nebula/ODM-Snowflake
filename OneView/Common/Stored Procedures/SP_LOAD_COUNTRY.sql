CREATE OR ALTER PROCEDURE COMMON.SP_LOAD_COUNTRY()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO COMMON.COUNTRY as T
USING (
	SELECT
		CountryId
		,Link
		,Country
		,ContinentRegionID
		,ISO31661alpha2
		,ISO31661alpha3
		,UNNumericalCode
		,Flag
		,_InsertedById     
		,_InsertedDate     
		,_UpdatedById      
		,_UpdatedDate      
		,_IsDeleted  
	FROM COMMON.STAGING_COUNTRY
) S
ON T.OneViewId = S.CountryId
WHEN MATCHED
AND S.Country != T.Country
THEN UPDATE SET
	T.Country = S.Country,
	T._UpdatedDate = S._UpdatedDate,
	T._UpdatedById = S._UpdatedById
WHEN MATCHED
AND S._IsDeleted != T._IsDeleted
THEN UPDATE SET
	T._UpdatedDate = S._UpdatedDate,
	T._UpdatedById = S._UpdatedById,
	T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
	OneViewId,
	Link,
	Country,
	ContinentRegionID,
	ISO31661alpha2,
	ISO31661alpha3,
	UNNumericalCode,
	Flag,
	_InsertedDate,
	_InsertedById,
	_UpdatedDate,
	_UpdatedById,
	_IsDeleted
) VALUES (
	S.CountryId,
	S.Link,
	S.Country,
	S.ContinentRegionID,
	S.ISO31661alpha2,
	S.ISO31661alpha3,
	S.UNNumericalCode,
	S.Flag,
	S._InsertedDate,
	S._InsertedById,
	S._UpdatedDate,
	S._UpdatedById,
	S._IsDeleted
);

DELETE FROM COMMON.STAGING_COUNTRY;

RETURN 1;

END';
