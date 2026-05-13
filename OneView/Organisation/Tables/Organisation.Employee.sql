
CREATE OR ALTER TABLE Organisation.Employee
(
	_ID NUMBER(38,0) NOT NULL AUTOINCREMENT START 1 INCREMENT 1 NOORDER
    ,OneViewID INT COMMENT 'Source-system identifier from OneView'  
    ,ClientId          INT              
	,EmployeeGUID            UUID
	,Emp_No                  NVARCHAR(500) 
	,User_ID                 NVARCHAR 
	,User_ID_Stat            NCHAR (1)     
	,Surname                 NVARCHAR(200) 
	,First_Names             NVARCHAR(200) 
	,FullName                NVARCHAR
	,Termination_Description NVARCHAR(200) 
	,ID_Number               NVARCHAR
	,Nationality             NVARCHAR
	,Class                   NVARCHAR
	,Gender                  NVARCHAR
	,Age                     INT           
	,Job_Code                NVARCHAR(200) 
	,Job_Title               NVARCHAR(200) 
	,Job_Status              NVARCHAR(200) 
	,Hay_Points              NVARCHAR
	,CostCentreID            INT           
	,Store_Or_Dep               NVARCHAR 
	,DivisionCode            NVARCHAR 
	,Division                NVARCHAR(200) 
	,Province                NVARCHAR 
	,Location                NVARCHAR 
	,BusinessUnitID          INT           
	,EmploymentGroup         NVARCHAR 
	,EmpManagerNo            NVARCHAR 
	,EmpManagerName          NVARCHAR 
	,ManagerEmployeeID INT COMMENT 'Parent of the employee in the employee hierarchy, references EmployeeID'  
	,ExtractDate             DATETIME 
	,Hay_Band                NVARCHAR 
	,Date_Engaged            DATE          
	,Term_Date               DATE          
	,Email                   NVARCHAR(200) 
	,SurnameCamel            NVARCHAR(200)             
	,First_NamesCamel        NVARCHAR(200)             
	,FullNameCamel           NVARCHAR(200) 
	,RegisterPIN             NVARCHAR(6)   
	,Essential               BOOLEAN           
    ,_InsertedById      INT
    ,_InsertedDate        DATETIME
    ,_UpdatedById    INT
    ,_UpdatedDate      DATETIME
    ,_IsDeleted       BOOLEAN
	,primary key (_ID)
)