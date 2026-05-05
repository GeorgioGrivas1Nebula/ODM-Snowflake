
CREATE OR ALTER TABLE Organisation.Staging_Cost_Centre
(
	CostCentreID            INT  
    ,ClientReference        NVARCHAR(4)
    ,ClientId               INT         
    ,CostCentreGUID         UUID
    ,Link                   INT             
    ,CostCentre             NVARCHAR(200)  
    ,Description            NVARCHAR
    ,CompanyID              INT            
    ,ERPCostCentre          NVARCHAR 
    ,ERPCustomer            NVARCHAR 
    ,PostingIdentifier      NVARCHAR(100)  
    ,Email                  NVARCHAR  
    ,OpsBoardMember         NVARCHAR(50)   
    ,CloudProportionedBit   BOOLEAN             
    ,LinkType               INT             
    ,_InsertedById          INT
    ,_InsertedDate          DATETIME
    ,_UpdatedById           INT
    ,_UpdatedDate           DATETIME
    ,_IsDeleted             BOOLEAN
)