CREATE OR ALTER PROCEDURE ORGANISATION.SP_LOAD_EMPLOYEE()
RETURNS VARCHAR
LANGUAGE SQL
EXECUTE AS OWNER
AS
'BEGIN

MERGE INTO ORGANISATION.EMPLOYEE as T
USING (
    SELECT
        EmployeeID
        ,ClientId
        ,EmployeeGUID
        ,Emp_No
        ,User_ID
        ,User_ID_Stat
        ,Surname
        ,First_Names
        ,FullName
        ,Termination_Description
        ,ID_Number
        ,Nationality
        ,Class
        ,Gender
        ,Age
        ,Job_Code
        ,Job_Title
        ,Job_Status
        ,Hay_Points
        ,CostCentreID
        ,Store_Or_Dep
        ,DivisionCode
        ,Division
        ,Province
        ,Location
        ,BusinessUnitID
        ,EmploymentGroup
        ,EmpManagerNo
        ,EmpManagerName
        ,ManagerEmployeeID
        ,ExtractDate
        ,Hay_Band
        ,Date_Engaged
        ,Term_Date
        ,Email
        ,SurnameCamel
        ,First_NamesCamel
        ,FullNameCamel
        ,RegisterPIN
        ,Essential
        ,_InsertedById
        ,_InsertedDate
        ,_UpdatedById
        ,_UpdatedDate
        ,_IsDeleted
    FROM ORGANISATION.STAGING_EMPLOYEE
) S
ON T.OneViewID = S.EmployeeID
AND T.ClientId = S.ClientId
WHEN MATCHED
AND S._UpdatedDate != T._UpdatedDate
THEN UPDATE SET
    T.EmployeeGUID = S.EmployeeGUID,
    T.Emp_No = S.Emp_No,
    T.User_ID = S.User_ID,
    T.User_ID_Stat = S.User_ID_Stat,
    T.Surname = S.Surname,
    T.First_Names = S.First_Names,
    T.FullName = S.FullName,
    T.Termination_Description = S.Termination_Description,
    T.ID_Number = S.ID_Number,
    T.Nationality = S.Nationality,
    T.Class = S.Class,
    T.Gender = S.Gender,
    T.Age = S.Age,
    T.Job_Code = S.Job_Code,
    T.Job_Title = S.Job_Title,
    T.Job_Status = S.Job_Status,
    T.Hay_Points = S.Hay_Points,
    T.CostCentreID = S.CostCentreID,
    T.Store_Or_Dep = S.Store_Or_Dep,
    T.DivisionCode = S.DivisionCode,
    T.Division = S.Division,
    T.Province = S.Province,
    T.Location = S.Location,
    T.BusinessUnitID = S.BusinessUnitID,
    T.EmploymentGroup = S.EmploymentGroup,
    T.EmpManagerNo = S.EmpManagerNo,
    T.EmpManagerName = S.EmpManagerName,
    T.ManagerEmployeeID = S.ManagerEmployeeID,
    T.ExtractDate = S.ExtractDate,
    T.Hay_Band = S.Hay_Band,
    T.Date_Engaged = S.Date_Engaged,
    T.Term_Date = S.Term_Date,
    T.Email = S.Email,
    T.SurnameCamel = S.SurnameCamel,
    T.First_NamesCamel = S.First_NamesCamel,
    T.FullNameCamel = S.FullNameCamel,
    T.RegisterPIN = S.RegisterPIN,
    T.Essential = S.Essential,
    T._UpdatedById = S._UpdatedById,
    T._UpdatedDate = S._UpdatedDate,
    T._IsDeleted = S._IsDeleted
WHEN NOT MATCHED THEN
INSERT (
    OneViewID
    ,ClientId
    ,EmployeeGUID
    ,Emp_No
    ,User_ID
    ,User_ID_Stat
    ,Surname
    ,First_Names
    ,FullName
    ,Termination_Description
    ,ID_Number
    ,Nationality
    ,Class
    ,Gender
    ,Age
    ,Job_Code
    ,Job_Title
    ,Job_Status
    ,Hay_Points
    ,CostCentreID
    ,Store_Or_Dep
    ,DivisionCode
    ,Division
    ,Province
    ,Location
    ,BusinessUnitID
    ,EmploymentGroup
    ,EmpManagerNo
    ,EmpManagerName
    ,ManagerEmployeeID
    ,ExtractDate
    ,Hay_Band
    ,Date_Engaged
    ,Term_Date
    ,Email
    ,SurnameCamel
    ,First_NamesCamel
    ,FullNameCamel
    ,RegisterPIN
    ,Essential
    ,_InsertedById
    ,_InsertedDate
    ,_UpdatedById
    ,_UpdatedDate
    ,_IsDeleted
) VALUES (
    S.EmployeeID
    ,S.ClientId
    ,S.EmployeeGUID
    ,S.Emp_No
    ,S.User_ID
    ,S.User_ID_Stat
    ,S.Surname
    ,S.First_Names
    ,S.FullName
    ,S.Termination_Description
    ,S.ID_Number
    ,S.Nationality
    ,S.Class
    ,S.Gender
    ,S.Age
    ,S.Job_Code
    ,S.Job_Title
    ,S.Job_Status
    ,S.Hay_Points
    ,S.CostCentreID
    ,S.Store_Or_Dep
    ,S.DivisionCode
    ,S.Division
    ,S.Province
    ,S.Location
    ,S.BusinessUnitID
    ,S.EmploymentGroup
    ,S.EmpManagerNo
    ,S.EmpManagerName
    ,S.ManagerEmployeeID
    ,S.ExtractDate
    ,S.Hay_Band
    ,S.Date_Engaged
    ,S.Term_Date
    ,S.Email
    ,S.SurnameCamel
    ,S.First_NamesCamel
    ,S.FullNameCamel
    ,S.RegisterPIN
    ,S.Essential
    ,S._InsertedById
    ,S._InsertedDate
    ,S._UpdatedById
    ,S._UpdatedDate
    ,S._IsDeleted
);

DELETE FROM ORGANISATION.STAGING_EMPLOYEE;

RETURN 1;

END';