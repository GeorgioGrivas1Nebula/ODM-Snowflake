CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_ENTITY()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO ORGANISATION.ENTITY as T
USING (
    SELECT
        EntityID
        ,ClientId
        ,EntityGUID
        ,ParentEntityID
        ,OwnerID
        ,Entity
        ,Description
        ,UserLabel
        ,KnownExceptions
        ,TypeID
        ,StatusID
        ,AccountID
        ,ClientVendorID
        ,CapacityGroupID
        ,CacheGUID
        ,CacheGUIDUpdated
        ,_InsertedById
        ,_InsertedDate
        ,_UpdatedById
        ,_UpdatedDate
        ,_IsDeleted
    FROM ORGANISATION.STAGING_ENTITY
) S
ON T.OneViewID = S.EntityID
AND T.ClientID = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
    T.EntityGUID = S.EntityGUID,
    T.ParentEntityID = S.ParentEntityID,
    T.OwnerID = S.OwnerID,
    T.Entity = S.Entity,
    T.Description = S.Description,
    T.UserLabel = S.UserLabel,
    T.KnownExceptions = S.KnownExceptions,
    T.TypeID = S.TypeID,
    T.StatusID = S.StatusID,
    T.AccountID = S.AccountID,
    T.ClientVendorID = S.ClientVendorID,
    T.CapacityGroupID = S.CapacityGroupID,
    T.CacheGUID = S.CacheGUID,
    T.CacheGUIDUpdated = S.CacheGUIDUpdated,
    T._UpdatedByID = S._UpdatedById,
    T._UpdatedDate = S._UpdatedDate,
    T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
    OneViewID
    ,ClientID
    ,EntityGUID
    ,ParentEntityID
    ,OwnerID
    ,Entity
    ,Description
    ,UserLabel
    ,KnownExceptions
    ,TypeID
    ,StatusID
    ,AccountID
    ,ClientVendorID
    ,CapacityGroupID
    ,CacheGUID
    ,CacheGUIDUpdated
    ,_InsertedByID
    ,_InsertedDate
    ,_UpdatedByID
    ,_UpdatedDate
    ,_IsDeleted
) VALUES (
    S.EntityID
    ,S.ClientId
    ,S.EntityGUID
    ,S.ParentEntityID
    ,S.OwnerID
    ,S.Entity
    ,S.Description
    ,S.UserLabel
    ,S.KnownExceptions
    ,S.TypeID
    ,S.StatusID
    ,S.AccountID
    ,S.ClientVendorID
    ,S.CapacityGroupID
    ,S.CacheGUID
    ,S.CacheGUIDUpdated
    ,S._InsertedById
    ,S._InsertedDate
    ,S._UpdatedById
    ,S._UpdatedDate
    ,S._IsDeleted
);

DELETE FROM ORGANISATION.STAGING_ENTITY;

RETURN 1;

END';