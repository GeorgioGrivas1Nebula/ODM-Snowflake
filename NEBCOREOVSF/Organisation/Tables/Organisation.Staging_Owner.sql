CREATE OR REPLACE TABLE Organisation.Staging_Owner
(
	OwnerID           INT        
	,ClientReference             NVARCHAR (4)
	,ClientId          INT     
	,OwnerGUID           UUID 
	,Owner               NVARCHAR (500)   
	,OwnerNo             NVARCHAR (100)   
	,Description         NVARCHAR 
	,Notes               NVARCHAR  
	,OwnerTypeID         INT              
	,OwnerStatusDetailID INT              
	,RegionID            INT              
	,AdminCountryLink    INT              
	,Email               NVARCHAR (250)   
	,BrandID             INT              
	,CostCentreID        INT              
	,DivisionID          INT              
	,LineGroupReference  NVARCHAR (10)    
	,OwnerClassDetailID  INT
    ,_InsertedById      INT
    ,_InsertedDate        DATETIME
    ,_UpdatedById    INT
    ,_UpdatedDate      DATETIME
    ,_IsDeleted       BOOLEAN
)