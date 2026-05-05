
CREATE OR ALTER TABLE Organisation.Cost_Centre
(
	_ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER
    ,OneViewID INT
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
    ,primary key (_ID)
)