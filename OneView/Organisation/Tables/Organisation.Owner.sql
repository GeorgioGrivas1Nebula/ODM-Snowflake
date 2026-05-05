CREATE OR ALTER TABLE Organisation.Owner
(
	_ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER   
	,OneViewID 	 INT
    ,ClientID          INT     
	,OwnerGUID           UUID 
	,Link                INT              
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
	,primary key (_ID)
)