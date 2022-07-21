
-- STA TABLES

CREATE TABLE [DATA_2018] (

    [CallTimestamp] nvarchar(255),
    [Call Type] nvarchar(255),
    [EmployeeID] nvarchar(255),
    [CallDuration] nvarchar(255),
    [WaitTime] nvarchar(255),
    [CallAbandoned] nvarchar(255)
)

CREATE TABLE [DATA_2019] (

    [CallTimestamp] nvarchar(255),
    [Call Type] nvarchar(255),
    [EmployeeID] nvarchar(255),
    [CallDuration] nvarchar(255),
    [WaitTime] nvarchar(255),
    [CallAbandoned] nvarchar(255)
)

CREATE TABLE [DATA_2020] (

    [CallTimestamp] nvarchar(255),
    [Call Type] nvarchar(255),
    [EmployeeID] nvarchar(255),
    [CallDuration] nvarchar(255),
    [WaitTime] nvarchar(255),
    [CallAbandoned] nvarchar(255)
)

CREATE TABLE [DATA_2021] (

    [CallTimestamp] nvarchar(255),
    [Call Type] nvarchar(255),
    [EmployeeID] nvarchar(255),
    [CallDuration] nvarchar(255),
    [WaitTime] nvarchar(255),
    [CallAbandoned] nvarchar(255)
)


CREATE TABLE [CALL_CHARGES] (
[Call Type Key] NVARCHAR(255),
[Call Type ] NVARCHAR(255),
[Call Charges (2018)] NVARCHAR(255),
[Call Charges (2019)] NVARCHAR(255),
[Call Charges (2020)] NVARCHAR(255),
[Call Charges (2021)] NVARCHAR(255)
)

CREATE TABLE [CallTypes] (
[CallTypeID] NVARCHAR(255),
[CallTypeLabel] NVARCHAR(255),
)

CREATE TABLE [Employees] (
[EmployeeID] NVARCHAR(255),
[EmployeeName] NVARCHAR(255),
[Site] NVARCHAR(255),
[ManagerName] NVARCHAR(255),
)

CREATE TABLE [USSTATES] (
[StateCD] NVARCHAR(255),
[Name] NVARCHAR(255),
[Region] NVARCHAR(255),
)



-- Technical Rejects

CREATE TABLE [Technical_Rejects] (

    [RejectDate] datetime,
    [RejectType] nvarchar(15),
    [RejectColumn] nvarchar(13)
)



-- Functional Rejects

CREATE TABLE [Functional_Rejects] (
    [RejectDate] datetime,
    [RejectType] nvarchar(6),
    [RejectColumn] nvarchar(11),
    [NumberOfRejects] numeric(20,0)
)

-- ODS CALL CHARGES 
CREATE TABLE [Call_Charges] (
    
    [Year] nvarchar(4),
    [Call Type Key] int,
    [Call Type] nvarchar(30),
    [Call Charges] nvarchar(30)
)

-- ODS Employees table 
CREATE TABLE [Employees] (
    [EmployeeName] nvarchar(50),
    [EmployeeID] nvarchar(50),
    [Site] nvarchar(30),
    [ManagerName] nvarchar(50),
    [StateName] nvarchar(50),
    [StateCode] nvarchar(2)
)

-- ODS US STATES table 

CREATE TABLE [US_STATES] (
    [StateCD] nvarchar(50),
    [Name] nvarchar(50),
    [Region] nvarchar(50)    
)

-- ODS CallTypes table 

CREATE TABLE [CALLTYPES] (
    [CallTypeID] nvarchar(2),
    [CallTypeLabel] nvarchar(50)
)



-- ODS ALL DATA table

CREATE TABLE [ALLDATA] (
    [CallTimestamp] datetime,
	[Date] datetime,
    [Month] smallint,
    [Year] int,
    [Day] smallint,
    [CallType] int,
    [CallAbandoned] smallint,
    [CallDuration] bigint,
    [EmployeeID] nvarchar(30),
    [WaitTime] int,
 	[StateCode] nvarchar(2)
)
   
-- DWH DimEmployee table create

CREATE TABLE [DimEmployee] (
[EmployeeKey] int PRIMARY KEY IDENTITY(1,1),    
[EmployeeName] nvarchar(50),
    [EmployeeID] nvarchar(50),
    [Site] nvarchar(30),
    [ManagerName] nvarchar(50),
    [StateName] nvarchar(50),
    [StateCode] nvarchar(2)
)



DimEmployee update 
UPDATE [dbo].[DimEmployee]
   SET [EmployeeName] = ?
      ,[Site] = ?
      ,[ManagerName] = ?
      ,[StateName] = ?
      ,[StateCode] = ?
 WHERE       [EmployeeID] = ?
 
 

-- DWH DimUsStates table create


CREATE TABLE [DimUsStates] (
[StateCDKey] int PRIMARY KEY IDENTITY(1,1),    
[StateCD] nvarchar(50),
    [Name] nvarchar(50),
    [Region] nvarchar(50),
    [EmployeeID] nvarchar(50)
)




UPDATE [dbo].[DimUsStates]
   SET 
      [Name] = ?
      ,[Region] = ?
 WHERE [StateCD] = ?




-- DWH DimCallCharges table create 




CREATE TABLE [DimCallCharges] (
[CallChargesKey] int PRIMARY KEY IDENTITY(1,1),     
[Year] nvarchar(4),
    [Call Type Key] int,
    [Call Type] nvarchar(30),
    [Call Charges] nvarchar(30)
)

-- DWH DimCallCharges update 



UPDATE [dbo].[DimCallCharges]
   SET [Year] = ?
    
      ,[Call Type Key] = ?
      ,[Call Type] = ?
    
 WHERE   [Call Charges] = ?

-- DWH DimCallTypes table Create 



CREATE TABLE [DimCallTypes] (
    [CallTypeKey] int PRIMARY KEY IDENTITY(1,1), 
[CallTypeID] int,
    [CallTypeLabel] nvarchar(50),
)

-- DWH FActALLDATA

CREATE TABLE [FactAllData] (
    [CallTimestamp] datetime,
    [Date] datetime,
    [Month] smallint,
    [Year] int,
    [Day] smallint,
	[EmployeeKey] int,
    [CallChargesKey] int,
    [CallTypeKey] int,
    [StateCDKey] int,
    [CallAbandoned] smallint,
    [CallDuration] bigint,
    [WaitTime] int,
    [DateKeyALLDATA] int,
)



-- DWH DimDate

CREATE TABLE dbo.DimDate (
   DateKey INT NOT NULL PRIMARY KEY,
   [Date] DATETIME NOT NULL,
   [Day] TINYINT NOT NULL,
   [DaySuffix] CHAR(2) NOT NULL,
   [Weekday] TINYINT NOT NULL,
   [WeekDayName] VARCHAR(10) NOT NULL,
   [WeekDayName_Short] CHAR(3) NOT NULL,
   [WeekDayName_FirstLetter] CHAR(1) NOT NULL,
   [DOWInMonth] TINYINT NOT NULL,
   [DayOfYear] SMALLINT NOT NULL,
   [WeekOfMonth] TINYINT NOT NULL,
   [WeekOfYear] TINYINT NOT NULL,
   [Month] TINYINT NOT NULL,
   [MonthName] VARCHAR(10) NOT NULL,
   [MonthName_Short] CHAR(3) NOT NULL,
   [MonthName_FirstLetter] CHAR(1) NOT NULL,
   [Quarter] TINYINT NOT NULL,
   [QuarterName] VARCHAR(6) NOT NULL,
   [Year] INT NOT NULL,
   [MMYYYY] CHAR(6) NOT NULL,
   [MonthYear] CHAR(7) NOT NULL,
   IsWeekend BIT NOT NULL,
   )

  
   GO


   SET NOCOUNT ON

TRUNCATE TABLE DimDate

DECLARE @CurrentDate DATE = '2018-01-01'
DECLARE @EndDate DATE = '2021-12-31'

WHILE @CurrentDate < @EndDate
BEGIN
   INSERT INTO [dbo].[DimDate] (
      [DateKey],
      [Date],
      [Day],
      [DaySuffix],
      [Weekday],
      [WeekDayName],
      [WeekDayName_Short],
      [WeekDayName_FirstLetter],
      [DOWInMonth],
      [DayOfYear],
      [WeekOfMonth],
      [WeekOfYear],
      [Month],
      [MonthName],
      [MonthName_Short],
      [MonthName_FirstLetter],
      [Quarter],
      [QuarterName],
      [Year],
      [MMYYYY],
      [MonthYear],
      [IsWeekend]
      )
   SELECT DateKey = YEAR(@CurrentDate) * 10000 + MONTH(@CurrentDate) * 100 + DAY(@CurrentDate),
      DATE = @CurrentDate,
      Day = DAY(@CurrentDate),
      [DaySuffix] = CASE 
         WHEN DAY(@CurrentDate) = 1
            OR DAY(@CurrentDate) = 21
            OR DAY(@CurrentDate) = 31
            THEN 'st'
         WHEN DAY(@CurrentDate) = 2
            OR DAY(@CurrentDate) = 22
            THEN 'nd'
         WHEN DAY(@CurrentDate) = 3
            OR DAY(@CurrentDate) = 23
            THEN 'rd'
         ELSE 'th'
         END,
      WEEKDAY = DATEPART(dw, @CurrentDate),
      WeekDayName = DATENAME(dw, @CurrentDate),
      WeekDayName_Short = UPPER(LEFT(DATENAME(dw, @CurrentDate), 3)),
      WeekDayName_FirstLetter = LEFT(DATENAME(dw, @CurrentDate), 1),
      [DOWInMonth] = DAY(@CurrentDate),
      [DayOfYear] = DATENAME(dy, @CurrentDate),
      [WeekOfMonth] = DATEPART(WEEK, @CurrentDate) - DATEPART(WEEK, DATEADD(MM, DATEDIFF(MM, 0, @CurrentDate), 0)) + 1,
      [WeekOfYear] = DATEPART(wk, @CurrentDate),
      [Month] = MONTH(@CurrentDate),
      [MonthName] = DATENAME(mm, @CurrentDate),
      [MonthName_Short] = UPPER(LEFT(DATENAME(mm, @CurrentDate), 3)),
      [MonthName_FirstLetter] = LEFT(DATENAME(mm, @CurrentDate), 1),
      [Quarter] = DATEPART(q, @CurrentDate),
      [QuarterName] = CASE 
         WHEN DATENAME(qq, @CurrentDate) = 1
            THEN 'First'
         WHEN DATENAME(qq, @CurrentDate) = 2
            THEN 'second'
         WHEN DATENAME(qq, @CurrentDate) = 3
            THEN 'third'
         WHEN DATENAME(qq, @CurrentDate) = 4
            THEN 'fourth'
         END,
      [Year] = YEAR(@CurrentDate),
      [MMYYYY] = RIGHT('0' + CAST(MONTH(@CurrentDate) AS VARCHAR(2)), 2) + CAST(YEAR(@CurrentDate) AS VARCHAR(4)),
      [MonthYear] = CAST(YEAR(@CurrentDate) AS VARCHAR(4)) + UPPER(LEFT(DATENAME(mm, @CurrentDate), 3)),
      [IsWeekend] = CASE 
         WHEN DATENAME(dw, @CurrentDate) = 'Sunday'
            OR DATENAME(dw, @CurrentDate) = 'Saturday'
            THEN 1
         ELSE 0
         END

   SET @CurrentDate = DATEADD(DD, 1, @CurrentDate)

END


