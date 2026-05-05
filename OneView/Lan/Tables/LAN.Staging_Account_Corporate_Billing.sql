
CREATE TABLE IF NOT EXISTS LAN.Staging_Account_Corporate_Billing
(
    AccountCorporateLanBlID         INT     
    ,ClientReference                NVARCHAR(4)
    ,ClientId                       INT         
    ,PeriodDate                     DATE          
    ,EntityID                      INT           
    ,AccessServiceTypeDetailID     INT           
    ,SlaTypeDetailID               INT           
	,Location                      NVARCHAR(250) 
	,ProductType                   NVARCHAR(250) 
    ,HardwareCostActivation        DECIMAL(18,2)         
    ,HardwareCostPort              DECIMAL(18,2)         
    ,HardwareCostRecovery          DECIMAL(18,2)         
    ,HardwareCostRental            DECIMAL(18,2)         
    ,HardwareCostMaintenance       DECIMAL(18,2)         
    ,HardwareCostSupport           DECIMAL(18,2)         
    ,HardwareCost                  DECIMAL(18,2)         
    ,NetworkCostBandwidth          DECIMAL(18,2)         
    ,NetworkCostRental             DECIMAL(18,2)         
    ,NetworkCostSLA                DECIMAL(18,2)         
    ,NetworkCost                   DECIMAL(18,2)         
    ,OtherCost                     DECIMAL(18,2)         
    ,CalculatedHardwareCost        DECIMAL(18,2)         
    ,CalculatedNetworkCost         DECIMAL(18,2)         
    ,Usage                         BIGINT        
    ,SLAPenaltyCost                DECIMAL(18,2)         
    ,Other                         DECIMAL(18,2)         
    ,Percent                       DECIMAL(18,2)         
    ,Credit                        DECIMAL(18,2)         
    ,Comments                      NVARCHAR (255)
    ,Clarify                       NVARCHAR (100)
    ,ImportID                       INT   
    ,VendorReference                NVARCHAR (4)
    ,_InsertedById                  INT
    ,_InsertedDate                  DATETIME
    ,_UpdatedById                   INT
    ,_UpdatedDate                   DATETIME
    ,_IsDeleted                     BOOLEAN
)