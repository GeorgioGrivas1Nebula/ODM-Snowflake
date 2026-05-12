
CREATE OR ALTER TABLE WAN.Staging_Account_Corporate_Billing
(
    AccountCorporateWanBlID         INT     
    ,ClientReference                NVARCHAR(4)
    ,ClientId                       INT         
    ,PeriodDate                     DATE          
    ,TrxNumber                      NVARCHAR (150)
    ,EntityID                       INT          
    ,SLATag                         NVARCHAR (50) 
    ,Description                    NVARCHAR (500)
    ,Location                       NVARCHAR(500) 
    ,AccessServiceTypeDetailID      INT           
    ,SlaTypeDetailID                INT           
    ,HardwareCostActivation         DECIMAL(18,2)         
    ,HardwareCostPort               DECIMAL(18,2)         
    ,HardwareCostRecovery           DECIMAL(18,2)         
    ,HardwareCostRental             DECIMAL(18,2)         
    ,HardwareCostMaintenance        DECIMAL(18,2)         
    ,HardwareCostSupport            DECIMAL(18,2)         
    ,HardwareCost                   DECIMAL(18,2)         
    ,NetworkCostBandwidth           DECIMAL(18,2)         
    ,NetworkCostRental              DECIMAL(18,2)         
    ,NetworkCostSLA                 DECIMAL(18,2)         
    ,NetworkCostVSAT                DECIMAL(18,2)         
    ,NetworkCostWANContract         DECIMAL(18,2)         
    ,NetworkCostLastMile            DECIMAL(18,2)         
    ,NetworkCostOther               DECIMAL(18,2)         
    ,NetworkCost                    DECIMAL(18,2)         
    ,OtherCost                      DECIMAL(18,2)         
    ,CalculatedHardwareCost         DECIMAL(18,2)         
    ,CalculatedNetworkCost          DECIMAL(18,2)         
    ,Usage                          BIGINT        
    ,SLAPenaltyCost                 DECIMAL(18,2)         
    ,Other                          DECIMAL(18,2)         
    ,Percent                        DECIMAL(18,2)         
    ,Credit                         DECIMAL(18,2)         
    ,Discounts                      DECIMAL(18,2)         
    ,Refunds                        DECIMAL(18,2)         
    ,OnceOffCharge                  DECIMAL(18,2)         
    ,BackBillingCost                DECIMAL(18,2)         
    ,BillFrom                       DATE          
    ,BillTo                         DATE          
    ,RecurringCost                  DECIMAL(18,2)         
    ,Comments                       NVARCHAR (255)
    ,Clarify                        NVARCHAR (100)
    ,InstallationDate               DATE          
    ,Cancellationdate               DATE          
    ,AccessSpeed                    NVARCHAR (150)
    ,AccessProvider                 NVARCHAR (500)
    ,AccessServiceType              NVARCHAR (60) 
    ,Billing_Type                   NVARCHAR (150)
    ,ImportID                       INT   
    ,VendorReference                NVARCHAR (4)
    ,_InsertedById                  INT
    ,_InsertedDate                  DATETIME
    ,_UpdatedById                   INT
    ,_UpdatedDate                   DATETIME
    ,_IsDeleted                     BOOLEAN
)