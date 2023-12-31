USE [PFMS]
GO
/****** Object:  Table [dbo].[EducationExperience]    Script Date: 2023/10/13 20:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducationExperience](
	[ExperienceID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[SchoolName] [varchar](255) NULL,
	[Major] [varchar](255) NULL,
	[EducationLevel] [varchar](50) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK__Educatio__2F4E3469A8F9511A] PRIMARY KEY CLUSTERED 
(
	[ExperienceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[EducationAnalysisView]    Script Date: 2023/10/13 20:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EducationAnalysisView] AS
SELECT EducationLevel , COUNT(*)AS count
FROM EducationExperience 
GROUP BY EducationLevel;
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2023/10/13 20:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[EmployeeName] [varchar](255) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Age] [int] NULL,
	[PoliticalStatus] [varchar](50) NULL,
	[Education] [varchar](50) NULL,
	[Gender] [varchar](10) NULL,
	[BirthDate] [date] NULL,
	[Hometown] [varchar](255) NULL,
	[EntryDate] [date] NULL,
	[RegularDate] [date] NULL,
	[ContractExpiration] [date] NULL,
	[DepartureDate] [date] NULL,
	[DepartmentID] [int] NULL,
	[PositionID] [int] NULL,
	[ApprovalStatus] [varchar](20) NULL,
	[Photo] [varchar](255) NULL,
 CONSTRAINT [PK__Employee__7AD04FF19FDDEFD3] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MonthlyHiresView]    Script Date: 2023/10/13 20:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MonthlyHiresView] AS
SELECT
  CONVERT(CHAR(7), EntryDate, 120) AS Month,
  COUNT(*) AS Total  
FROM Employee
WHERE YEAR(EntryDate) = YEAR(GETDATE())  
GROUP BY CONVERT(CHAR(7), EntryDate, 120);
GO
/****** Object:  View [dbo].[MonthlyOutView]    Script Date: 2023/10/13 20:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MonthlyOutView] AS
SELECT
	CONVERT(CHAR(7),DepartureDate,120) AS Month,
	COUNT(*) AS Total
FROM Employee
WHERE YEAR(DepartureDate) = YEAR(GETDATE())
GROUP BY CONVERT(CHAR(7),DepartureDate,120);
GO
/****** Object:  View [dbo].[EmployeeView]    Script Date: 2023/10/13 20:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EmployeeView] AS
SELECT
    [EmployeeID],
    [EmployeeName],
    [PhoneNumber],
    DATEDIFF(YEAR, [BirthDate], GETDATE()) AS Age,
    [PoliticalStatus],
    [Education],
    [Gender],
    [BirthDate],
    [Hometown],
    [EntryDate],
    [RegularDate],
    [ContractExpiration],
    [DepartureDate],
    [DepartmentID],
    [PositionID],
    [ApprovalStatus],
    [Photo]
FROM [PFMS].[dbo].[Employee];
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2023/10/13 20:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[pwd_hash] [varchar](64) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assessment]    Script Date: 2023/10/13 20:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessment](
	[AssessmentID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[AssessmentResult] [varchar](255) NULL,
 CONSTRAINT [PK__Assessme__3D2BF83E34C14650] PRIMARY KEY CLUSTERED 
(
	[AssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2023/10/13 20:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] NOT NULL,
	[DepartmentName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeRelative]    Script Date: 2023/10/13 20:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeRelative](
	[EmployeeRelativeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[RelativeOneName] [varchar](255) NULL,
	[RelativeOneRelationship] [varchar](50) NULL,
	[RelativeOnePhoneNumber] [varchar](20) NULL,
	[RelativeTwoName] [varchar](255) NULL,
	[RelativeTwoRelationship] [varchar](50) NULL,
	[RelativeTwoPhoneNumber] [varchar](20) NULL,
 CONSTRAINT [PK__Employee__AFE57B7C7FDD6C13] PRIMARY KEY CLUSTERED 
(
	[EmployeeRelativeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveRecord]    Script Date: 2023/10/13 20:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveRecord](
	[LeaveEmployeeID] [int] NOT NULL,
	[LeaveEmployeeName] [varchar](255) NULL,
	[LeaveDepartmentID] [int] NULL,
	[LeaveDepartmentName] [varchar](255) NULL,
	[LeavePositionID] [int] NULL,
	[LeavePositionName] [varchar](255) NULL,
	[HandoverEmployeeID] [int] NULL,
	[HandoverEmployeeName] [varchar](255) NULL,
	[HandoverDepartmentID] [int] NULL,
	[HandoverDepartmentName] [varchar](255) NULL,
	[HandoverPositionID] [int] NULL,
	[HandoverPositionName] [varchar](255) NULL,
	[ItemName] [varchar](255) NULL,
	[ItemQuantity] [int] NULL,
	[ReturnDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[LeaveEmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 2023/10/13 20:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[PositionID] [int] NOT NULL,
	[PositionName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkExperience]    Script Date: 2023/10/13 20:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkExperience](
	[ExperienceID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[CompanyName] [varchar](255) NULL,
	[Position] [varchar](255) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK__WorkExpe__2F4E346987C96C57] PRIMARY KEY CLUSTERED 
(
	[ExperienceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([id], [username], [pwd_hash]) VALUES (1001, N'周慧敏', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b')
INSERT [dbo].[Admin] ([id], [username], [pwd_hash]) VALUES (1002, N'李四', N'4e07408562bedb8b60ce05c1decfe3ad16b72230967de01f640b7e4729b49fce')
GO
SET IDENTITY_INSERT [dbo].[Assessment] ON 

INSERT [dbo].[Assessment] ([AssessmentID], [EmployeeID], [AssessmentResult]) VALUES (1, 1001, N'通过')
INSERT [dbo].[Assessment] ([AssessmentID], [EmployeeID], [AssessmentResult]) VALUES (2, 1002, N'通过')
INSERT [dbo].[Assessment] ([AssessmentID], [EmployeeID], [AssessmentResult]) VALUES (3, 1003, N'通过')
INSERT [dbo].[Assessment] ([AssessmentID], [EmployeeID], [AssessmentResult]) VALUES (4, 1004, N'通过')
INSERT [dbo].[Assessment] ([AssessmentID], [EmployeeID], [AssessmentResult]) VALUES (5, 1005, N'通过')
INSERT [dbo].[Assessment] ([AssessmentID], [EmployeeID], [AssessmentResult]) VALUES (6, 1006, N'通过')
INSERT [dbo].[Assessment] ([AssessmentID], [EmployeeID], [AssessmentResult]) VALUES (7, 1007, N'通过')
INSERT [dbo].[Assessment] ([AssessmentID], [EmployeeID], [AssessmentResult]) VALUES (8, 1008, N'通过')
INSERT [dbo].[Assessment] ([AssessmentID], [EmployeeID], [AssessmentResult]) VALUES (9, 1009, N'通过')
INSERT [dbo].[Assessment] ([AssessmentID], [EmployeeID], [AssessmentResult]) VALUES (10, 1010, N'通过')
INSERT [dbo].[Assessment] ([AssessmentID], [EmployeeID], [AssessmentResult]) VALUES (11, 1011, N'通过')
INSERT [dbo].[Assessment] ([AssessmentID], [EmployeeID], [AssessmentResult]) VALUES (12, 1012, N'通过')
INSERT [dbo].[Assessment] ([AssessmentID], [EmployeeID], [AssessmentResult]) VALUES (17, 1013, N'通过')
INSERT [dbo].[Assessment] ([AssessmentID], [EmployeeID], [AssessmentResult]) VALUES (18, 1013, N'不通过')
INSERT [dbo].[Assessment] ([AssessmentID], [EmployeeID], [AssessmentResult]) VALUES (20, 1012, N'不通过')
INSERT [dbo].[Assessment] ([AssessmentID], [EmployeeID], [AssessmentResult]) VALUES (30, 1007, N'通过')
SET IDENTITY_INSERT [dbo].[Assessment] OFF
GO
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (1, N'研发部')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (2, N'人事部')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (3, N'财务部')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (4, N'行政部')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (5, N'公关部')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName]) VALUES (6, N'销售部')
GO
SET IDENTITY_INSERT [dbo].[EducationExperience] ON 

INSERT [dbo].[EducationExperience] ([ExperienceID], [EmployeeID], [SchoolName], [Major], [EducationLevel], [StartDate], [EndDate]) VALUES (1, 1001, N'广东科技学院', N'商务英语', N'高中', CAST(N'2020-10-11' AS Date), CAST(N'2024-06-20' AS Date))
INSERT [dbo].[EducationExperience] ([ExperienceID], [EmployeeID], [SchoolName], [Major], [EducationLevel], [StartDate], [EndDate]) VALUES (2, 1002, N'广东轻工职业技术学院', N'电子商务', N'高中', CAST(N'2020-10-11' AS Date), CAST(N'2024-06-20' AS Date))
INSERT [dbo].[EducationExperience] ([ExperienceID], [EmployeeID], [SchoolName], [Major], [EducationLevel], [StartDate], [EndDate]) VALUES (3, 1003, N'广东白云学院', N'商务英语', N'本科', CAST(N'2020-10-11' AS Date), CAST(N'2024-06-20' AS Date))
INSERT [dbo].[EducationExperience] ([ExperienceID], [EmployeeID], [SchoolName], [Major], [EducationLevel], [StartDate], [EndDate]) VALUES (4, 1004, N'广东工业大学', N'物联网工程', N'硕士', CAST(N'2020-10-11' AS Date), CAST(N'2024-06-20' AS Date))
INSERT [dbo].[EducationExperience] ([ExperienceID], [EmployeeID], [SchoolName], [Major], [EducationLevel], [StartDate], [EndDate]) VALUES (5, 1005, N'中山大学', N'机械制造及其自动化', N'本科', CAST(N'2020-10-11' AS Date), CAST(N'2024-06-20' AS Date))
INSERT [dbo].[EducationExperience] ([ExperienceID], [EmployeeID], [SchoolName], [Major], [EducationLevel], [StartDate], [EndDate]) VALUES (6, 1006, N'广东白云学院', N'工程造价', N'本科', CAST(N'2020-10-11' AS Date), CAST(N'2024-06-20' AS Date))
INSERT [dbo].[EducationExperience] ([ExperienceID], [EmployeeID], [SchoolName], [Major], [EducationLevel], [StartDate], [EndDate]) VALUES (7, 1007, N'深圳职业技术学院', N'软件工程', N'大专', CAST(N'2020-10-11' AS Date), CAST(N'2024-06-20' AS Date))
INSERT [dbo].[EducationExperience] ([ExperienceID], [EmployeeID], [SchoolName], [Major], [EducationLevel], [StartDate], [EndDate]) VALUES (8, 1008, N'广东外语大学', N'电子商务', N'硕士', CAST(N'2020-10-11' AS Date), CAST(N'2024-06-20' AS Date))
INSERT [dbo].[EducationExperience] ([ExperienceID], [EmployeeID], [SchoolName], [Major], [EducationLevel], [StartDate], [EndDate]) VALUES (9, 1009, N'广东外语大学', N'商务英语', N'本科', CAST(N'2020-10-11' AS Date), CAST(N'2024-06-20' AS Date))
INSERT [dbo].[EducationExperience] ([ExperienceID], [EmployeeID], [SchoolName], [Major], [EducationLevel], [StartDate], [EndDate]) VALUES (10, 1010, N'蓝翔职业技术学校', N'物联网工程', N'中专', CAST(N'2020-10-11' AS Date), CAST(N'2024-06-20' AS Date))
INSERT [dbo].[EducationExperience] ([ExperienceID], [EmployeeID], [SchoolName], [Major], [EducationLevel], [StartDate], [EndDate]) VALUES (11, 1011, N'潮州金山中学', N'理科', N'高中', CAST(N'2020-10-11' AS Date), CAST(N'2024-06-20' AS Date))
INSERT [dbo].[EducationExperience] ([ExperienceID], [EmployeeID], [SchoolName], [Major], [EducationLevel], [StartDate], [EndDate]) VALUES (12, 1012, N'中山大学', N'工程造价', N'硕士', CAST(N'2020-10-11' AS Date), CAST(N'2024-06-20' AS Date))
INSERT [dbo].[EducationExperience] ([ExperienceID], [EmployeeID], [SchoolName], [Major], [EducationLevel], [StartDate], [EndDate]) VALUES (17, 1013, N'深圳大学', N'软件工程', N'大专', CAST(N'2019-08-21' AS Date), CAST(N'2022-05-01' AS Date))
INSERT [dbo].[EducationExperience] ([ExperienceID], [EmployeeID], [SchoolName], [Major], [EducationLevel], [StartDate], [EndDate]) VALUES (1015, 1014, N'广东科技学院', N'演员', N'高中', CAST(N'2004-01-28' AS Date), CAST(N'2008-08-24' AS Date))
SET IDENTITY_INSERT [dbo].[EducationExperience] OFF
GO
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [PhoneNumber], [Age], [PoliticalStatus], [Education], [Gender], [BirthDate], [Hometown], [EntryDate], [RegularDate], [ContractExpiration], [DepartureDate], [DepartmentID], [PositionID], [ApprovalStatus], [Photo]) VALUES (1001, N'周慧敏', N'178717826382', NULL, N'党员', N'高中', N'女', CAST(N'2001-08-22' AS Date), N'广东潮州', CAST(N'2023-07-24' AS Date), CAST(N'2024-07-24' AS Date), CAST(N'2025-07-24' AS Date), CAST(N'2023-08-21' AS Date), 3, 3, N'已审核', N'D:\以前作业\图片\imageone\zhm.jpg')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [PhoneNumber], [Age], [PoliticalStatus], [Education], [Gender], [BirthDate], [Hometown], [EntryDate], [RegularDate], [ContractExpiration], [DepartureDate], [DepartmentID], [PositionID], [ApprovalStatus], [Photo]) VALUES (1002, N'李四', N'1728188281', NULL, N'团员', N'高中', N'男', CAST(N'2001-09-22' AS Date), N'广东汕头', CAST(N'2023-01-23' AS Date), CAST(N'2024-09-22' AS Date), CAST(N'2025-09-22' AS Date), CAST(N'2023-08-22' AS Date), 2, 2, N'已审核', N'D:/visual project/PFMS2/FileData/image/张三头像.png')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [PhoneNumber], [Age], [PoliticalStatus], [Education], [Gender], [BirthDate], [Hometown], [EntryDate], [RegularDate], [ContractExpiration], [DepartureDate], [DepartmentID], [PositionID], [ApprovalStatus], [Photo]) VALUES (1003, N'周慧敏', N'1782918129', NULL, N'群众', N'本科', N'男', CAST(N'2002-08-22' AS Date), N'广东梅州', CAST(N'2023-01-23' AS Date), CAST(N'2024-09-22' AS Date), CAST(N'2025-09-22' AS Date), CAST(N'2023-08-22' AS Date), 2, 3, N'已审核', N'D:\以前作业\图片\imageone\zjl.png')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [PhoneNumber], [Age], [PoliticalStatus], [Education], [Gender], [BirthDate], [Hometown], [EntryDate], [RegularDate], [ContractExpiration], [DepartureDate], [DepartmentID], [PositionID], [ApprovalStatus], [Photo]) VALUES (1004, N'赵老六', N'112323532', NULL, N'党员', N'硕士', N'男', CAST(N'2003-08-12' AS Date), N'广东汕尾', CAST(N'2023-01-23' AS Date), CAST(N'2024-09-22' AS Date), CAST(N'2025-07-21' AS Date), CAST(N'2023-08-24' AS Date), 4, 4, N'已审核', N'D:\以前作业\图片\imageone\张三头像.png')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [PhoneNumber], [Age], [PoliticalStatus], [Education], [Gender], [BirthDate], [Hometown], [EntryDate], [RegularDate], [ContractExpiration], [DepartureDate], [DepartmentID], [PositionID], [ApprovalStatus], [Photo]) VALUES (1005, N'小猪', N'127137172', NULL, N'团员', N'大专', N'男', CAST(N'2002-01-13' AS Date), N'广东深圳', CAST(N'2023-01-23' AS Date), CAST(N'2024-09-22' AS Date), CAST(N'2025-04-21' AS Date), NULL, 5, 5, N'已审核', N'')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [PhoneNumber], [Age], [PoliticalStatus], [Education], [Gender], [BirthDate], [Hometown], [EntryDate], [RegularDate], [ContractExpiration], [DepartureDate], [DepartmentID], [PositionID], [ApprovalStatus], [Photo]) VALUES (1006, N'小军', N'213178912', NULL, N'党员', N'本科', N'男', CAST(N'2003-03-13' AS Date), N'广东河源', CAST(N'2023-01-23' AS Date), CAST(N'2024-09-22' AS Date), CAST(N'2025-07-21' AS Date), NULL, 6, 6, N'已审核', NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [PhoneNumber], [Age], [PoliticalStatus], [Education], [Gender], [BirthDate], [Hometown], [EntryDate], [RegularDate], [ContractExpiration], [DepartureDate], [DepartmentID], [PositionID], [ApprovalStatus], [Photo]) VALUES (1007, N'小美', N'1213242423', NULL, N'群众', N'大专', N'女', CAST(N'2004-12-09' AS Date), N'福建厦门', CAST(N'2023-01-23' AS Date), CAST(N'2024-09-22' AS Date), CAST(N'2025-09-21' AS Date), NULL, 1, 7, N'已审核', NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [PhoneNumber], [Age], [PoliticalStatus], [Education], [Gender], [BirthDate], [Hometown], [EntryDate], [RegularDate], [ContractExpiration], [DepartureDate], [DepartmentID], [PositionID], [ApprovalStatus], [Photo]) VALUES (1008, N'小绿', N'122124121', NULL, N'群众', N'硕士', N'女', CAST(N'2002-08-01' AS Date), N'福建福州', CAST(N'2023-01-23' AS Date), CAST(N'2024-09-22' AS Date), CAST(N'2025-06-21' AS Date), NULL, 2, 8, N'已审核', NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [PhoneNumber], [Age], [PoliticalStatus], [Education], [Gender], [BirthDate], [Hometown], [EntryDate], [RegularDate], [ContractExpiration], [DepartureDate], [DepartmentID], [PositionID], [ApprovalStatus], [Photo]) VALUES (1009, N'热巴', N'23123211', NULL, N'党员', N'本科', N'女', CAST(N'2001-09-09' AS Date), N'安徽合肥', CAST(N'2023-01-23' AS Date), CAST(N'2024-09-22' AS Date), CAST(N'2025-07-21' AS Date), NULL, 3, 9, N'已审核', N'D:\以前作业\图片\iconimage\xihuan.png')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [PhoneNumber], [Age], [PoliticalStatus], [Education], [Gender], [BirthDate], [Hometown], [EntryDate], [RegularDate], [ContractExpiration], [DepartureDate], [DepartmentID], [PositionID], [ApprovalStatus], [Photo]) VALUES (1010, N'小黑', N'123113232', NULL, N'团员', N'中专', N'男', CAST(N'2003-12-29' AS Date), N'黑龙江哈尔滨', CAST(N'2023-01-23' AS Date), CAST(N'2024-09-22' AS Date), CAST(N'2023-08-21' AS Date), CAST(N'2023-08-23' AS Date), 4, 10, N'已审核', N'')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [PhoneNumber], [Age], [PoliticalStatus], [Education], [Gender], [BirthDate], [Hometown], [EntryDate], [RegularDate], [ContractExpiration], [DepartureDate], [DepartmentID], [PositionID], [ApprovalStatus], [Photo]) VALUES (1011, N'小红', N'123213211', NULL, N'团员', N'高中', N'女', CAST(N'2001-12-09' AS Date), N'美国华盛顿', CAST(N'2023-01-23' AS Date), CAST(N'2024-09-22' AS Date), CAST(N'2025-06-21' AS Date), NULL, 5, 11, N'已审核', NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [PhoneNumber], [Age], [PoliticalStatus], [Education], [Gender], [BirthDate], [Hometown], [EntryDate], [RegularDate], [ContractExpiration], [DepartureDate], [DepartmentID], [PositionID], [ApprovalStatus], [Photo]) VALUES (1012, N'小岛', N'123212123', NULL, N'团员', N'硕士', N'女', CAST(N'2001-08-13' AS Date), N'广东揭阳', CAST(N'2023-01-23' AS Date), CAST(N'2024-09-22' AS Date), CAST(N'2025-06-21' AS Date), NULL, 6, 12, N'已审核', NULL)
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [PhoneNumber], [Age], [PoliticalStatus], [Education], [Gender], [BirthDate], [Hometown], [EntryDate], [RegularDate], [ContractExpiration], [DepartureDate], [DepartmentID], [PositionID], [ApprovalStatus], [Photo]) VALUES (1013, N'制造商', N'21739218128', NULL, N'党员', N'大专', N'男', CAST(N'2010-08-21' AS Date), N'广东揭阳', CAST(N'2023-08-21' AS Date), CAST(N'2024-02-01' AS Date), CAST(N'2024-06-01' AS Date), NULL, 1, 3, N'待审核', N'D:\以前作业\图片\iconimage\wode.png')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [PhoneNumber], [Age], [PoliticalStatus], [Education], [Gender], [BirthDate], [Hometown], [EntryDate], [RegularDate], [ContractExpiration], [DepartureDate], [DepartmentID], [PositionID], [ApprovalStatus], [Photo]) VALUES (1014, N'红太狼', N'18912122121', NULL, N'党员', N'高中', N'女', CAST(N'2023-08-24' AS Date), N'广东梅州', CAST(N'2023-08-24' AS Date), CAST(N'2023-08-24' AS Date), CAST(N'2023-08-24' AS Date), NULL, 3, 2, N'待审核', N'D:\以前作业\图片\imageone\背景图片4.png')
GO
SET IDENTITY_INSERT [dbo].[EmployeeRelative] ON 

INSERT [dbo].[EmployeeRelative] ([EmployeeRelativeID], [EmployeeID], [RelativeOneName], [RelativeOneRelationship], [RelativeOnePhoneNumber], [RelativeTwoName], [RelativeTwoRelationship], [RelativeTwoPhoneNumber]) VALUES (1, 1001, N'张军', N'父子', N'178182189', N'李云', N'母子', N'1232112111')
INSERT [dbo].[EmployeeRelative] ([EmployeeRelativeID], [EmployeeID], [RelativeOneName], [RelativeOneRelationship], [RelativeOnePhoneNumber], [RelativeTwoName], [RelativeTwoRelationship], [RelativeTwoPhoneNumber]) VALUES (2, 1002, N'马俊明', N'父子', N'12212112', N'欧超', N'朋友', N'123121121')
INSERT [dbo].[EmployeeRelative] ([EmployeeRelativeID], [EmployeeID], [RelativeOneName], [RelativeOneRelationship], [RelativeOnePhoneNumber], [RelativeTwoName], [RelativeTwoRelationship], [RelativeTwoPhoneNumber]) VALUES (3, 1003, N'胡六十', N'父子', N'122121312', N'曾庆', N'朋友', N'123121121')
INSERT [dbo].[EmployeeRelative] ([EmployeeRelativeID], [EmployeeID], [RelativeOneName], [RelativeOneRelationship], [RelativeOnePhoneNumber], [RelativeTwoName], [RelativeTwoRelationship], [RelativeTwoPhoneNumber]) VALUES (4, 1004, N'老刘', N'父子', N'2132111', N'小老七', N'朋友', N'123121121')
INSERT [dbo].[EmployeeRelative] ([EmployeeRelativeID], [EmployeeID], [RelativeOneName], [RelativeOneRelationship], [RelativeOnePhoneNumber], [RelativeTwoName], [RelativeTwoRelationship], [RelativeTwoPhoneNumber]) VALUES (5, 1005, N'老张', N'父子', N'21321111', N'马上', N'朋友', N'123121121')
INSERT [dbo].[EmployeeRelative] ([EmployeeRelativeID], [EmployeeID], [RelativeOneName], [RelativeOneRelationship], [RelativeOnePhoneNumber], [RelativeTwoName], [RelativeTwoRelationship], [RelativeTwoPhoneNumber]) VALUES (6, 1006, N'老柯', N'父子', N'12133112', N'小文', N'朋友', N'123121121')
INSERT [dbo].[EmployeeRelative] ([EmployeeRelativeID], [EmployeeID], [RelativeOneName], [RelativeOneRelationship], [RelativeOnePhoneNumber], [RelativeTwoName], [RelativeTwoRelationship], [RelativeTwoPhoneNumber]) VALUES (7, 1007, N'王顺', N'父子', N'131212131', N'牛马', N'朋友', N'123121121')
INSERT [dbo].[EmployeeRelative] ([EmployeeRelativeID], [EmployeeID], [RelativeOneName], [RelativeOneRelationship], [RelativeOnePhoneNumber], [RelativeTwoName], [RelativeTwoRelationship], [RelativeTwoPhoneNumber]) VALUES (8, 1008, N'马斌', N'父子', N'141252113', N'王舍', N'朋友', N'123121121')
INSERT [dbo].[EmployeeRelative] ([EmployeeRelativeID], [EmployeeID], [RelativeOneName], [RelativeOneRelationship], [RelativeOnePhoneNumber], [RelativeTwoName], [RelativeTwoRelationship], [RelativeTwoPhoneNumber]) VALUES (9, 1009, N'曾凡吧', N'父子', N'142525423', N'白天居', N'朋友', N'123121121')
INSERT [dbo].[EmployeeRelative] ([EmployeeRelativeID], [EmployeeID], [RelativeOneName], [RelativeOneRelationship], [RelativeOnePhoneNumber], [RelativeTwoName], [RelativeTwoRelationship], [RelativeTwoPhoneNumber]) VALUES (10, 1010, N'欧咪', N'朋友', N'134352212', N'沐溪', N'朋友', N'123121121')
INSERT [dbo].[EmployeeRelative] ([EmployeeRelativeID], [EmployeeID], [RelativeOneName], [RelativeOneRelationship], [RelativeOnePhoneNumber], [RelativeTwoName], [RelativeTwoRelationship], [RelativeTwoPhoneNumber]) VALUES (11, 1011, N'李俊', N'朋友', N'134532323', N'郝四', N'朋友', N'123121121')
INSERT [dbo].[EmployeeRelative] ([EmployeeRelativeID], [EmployeeID], [RelativeOneName], [RelativeOneRelationship], [RelativeOnePhoneNumber], [RelativeTwoName], [RelativeTwoRelationship], [RelativeTwoPhoneNumber]) VALUES (12, 1012, N'张伟', N'朋友', N'143635453', N'小牛', N'朋友', N'123121121')
INSERT [dbo].[EmployeeRelative] ([EmployeeRelativeID], [EmployeeID], [RelativeOneName], [RelativeOneRelationship], [RelativeOnePhoneNumber], [RelativeTwoName], [RelativeTwoRelationship], [RelativeTwoPhoneNumber]) VALUES (17, 1013, N'阿什顿', N'父子', N'18932321', N'大戟科', N'母子', N'12892891122')
INSERT [dbo].[EmployeeRelative] ([EmployeeRelativeID], [EmployeeID], [RelativeOneName], [RelativeOneRelationship], [RelativeOnePhoneNumber], [RelativeTwoName], [RelativeTwoRelationship], [RelativeTwoPhoneNumber]) VALUES (1015, 1014, N'灰太狼', N'夫妻', N'1391281931', N'小灰灰', N'母子', N'138981281212')
SET IDENTITY_INSERT [dbo].[EmployeeRelative] OFF
GO
INSERT [dbo].[LeaveRecord] ([LeaveEmployeeID], [LeaveEmployeeName], [LeaveDepartmentID], [LeaveDepartmentName], [LeavePositionID], [LeavePositionName], [HandoverEmployeeID], [HandoverEmployeeName], [HandoverDepartmentID], [HandoverDepartmentName], [HandoverPositionID], [HandoverPositionName], [ItemName], [ItemQuantity], [ReturnDate]) VALUES (1001, N'周慧敏', 1, N'研发部', 1, N'软件工程师', 1005, N'小猪', 5, N'公关部', 5, N'公关专员', N'被子', 2, CAST(N'2023-10-09' AS Date))
INSERT [dbo].[LeaveRecord] ([LeaveEmployeeID], [LeaveEmployeeName], [LeaveDepartmentID], [LeaveDepartmentName], [LeavePositionID], [LeavePositionName], [HandoverEmployeeID], [HandoverEmployeeName], [HandoverDepartmentID], [HandoverDepartmentName], [HandoverPositionID], [HandoverPositionName], [ItemName], [ItemQuantity], [ReturnDate]) VALUES (1002, N'李四', 2, N'人事部', 2, N'人力部长', 1004, N'赵老六', 4, N'行政部', 4, N'行政经理', N'枕头', 3, CAST(N'2023-09-11' AS Date))
INSERT [dbo].[LeaveRecord] ([LeaveEmployeeID], [LeaveEmployeeName], [LeaveDepartmentID], [LeaveDepartmentName], [LeavePositionID], [LeavePositionName], [HandoverEmployeeID], [HandoverEmployeeName], [HandoverDepartmentID], [HandoverDepartmentName], [HandoverPositionID], [HandoverPositionName], [ItemName], [ItemQuantity], [ReturnDate]) VALUES (1003, N'周慧敏', 2, N'人事部', 3, N'财务经理', 1004, N'赵老六', 4, N'行政部', 4, N'行政经理', N'枕头', 3, CAST(N'2023-09-11' AS Date))
INSERT [dbo].[LeaveRecord] ([LeaveEmployeeID], [LeaveEmployeeName], [LeaveDepartmentID], [LeaveDepartmentName], [LeavePositionID], [LeavePositionName], [HandoverEmployeeID], [HandoverEmployeeName], [HandoverDepartmentID], [HandoverDepartmentName], [HandoverPositionID], [HandoverPositionName], [ItemName], [ItemQuantity], [ReturnDate]) VALUES (1004, N'赵老六', 4, N'行政部', 4, N'行政经理', 1005, N'小猪', 5, N'公关部', 5, N'公关专员', N'床垫', 2, CAST(N'2023-09-11' AS Date))
INSERT [dbo].[LeaveRecord] ([LeaveEmployeeID], [LeaveEmployeeName], [LeaveDepartmentID], [LeaveDepartmentName], [LeavePositionID], [LeavePositionName], [HandoverEmployeeID], [HandoverEmployeeName], [HandoverDepartmentID], [HandoverDepartmentName], [HandoverPositionID], [HandoverPositionName], [ItemName], [ItemQuantity], [ReturnDate]) VALUES (1010, N'小黑', 4, N'行政部', 10, N'行政主管', 1009, N'热巴', 3, N'财务部', 9, N'会计', N'电视', 2, CAST(N'2023-08-01' AS Date))
GO
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (1, N'软件工程师')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (2, N'人力部长')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (3, N'财务经理')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (4, N'行政经理')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (5, N'公关专员')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (6, N'销售经理')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (7, N'前端开发工程师')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (8, N'人事助理')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (9, N'会计')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (10, N'行政主管')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (11, N'公关部长')
INSERT [dbo].[Position] ([PositionID], [PositionName]) VALUES (12, N'销售代表')
GO
SET IDENTITY_INSERT [dbo].[WorkExperience] ON 

INSERT [dbo].[WorkExperience] ([ExperienceID], [EmployeeID], [CompanyName], [Position], [StartDate], [EndDate]) VALUES (1, 1001, N'华为技术有限公司', N'软件工程师', CAST(N'2021-09-08' AS Date), CAST(N'2022-01-03' AS Date))
INSERT [dbo].[WorkExperience] ([ExperienceID], [EmployeeID], [CompanyName], [Position], [StartDate], [EndDate]) VALUES (2, 1002, N'华为技术有限公司', N'人事招聘员', CAST(N'2021-07-12' AS Date), CAST(N'2022-01-08' AS Date))
INSERT [dbo].[WorkExperience] ([ExperienceID], [EmployeeID], [CompanyName], [Position], [StartDate], [EndDate]) VALUES (3, 1003, N'潮州三环有限公司', N'财务经理', CAST(N'2021-04-11' AS Date), CAST(N'2022-03-12' AS Date))
INSERT [dbo].[WorkExperience] ([ExperienceID], [EmployeeID], [CompanyName], [Position], [StartDate], [EndDate]) VALUES (4, 1004, N'潮州三环有限公司', N'行政主席', CAST(N'2021-06-22' AS Date), CAST(N'2022-04-22' AS Date))
INSERT [dbo].[WorkExperience] ([ExperienceID], [EmployeeID], [CompanyName], [Position], [StartDate], [EndDate]) VALUES (5, 1005, N'小米', N'公关部长', CAST(N'2021-06-22' AS Date), CAST(N'2022-04-22' AS Date))
INSERT [dbo].[WorkExperience] ([ExperienceID], [EmployeeID], [CompanyName], [Position], [StartDate], [EndDate]) VALUES (6, 1006, N'三星', N'销售经理', CAST(N'2021-06-22' AS Date), CAST(N'2022-05-22' AS Date))
INSERT [dbo].[WorkExperience] ([ExperienceID], [EmployeeID], [CompanyName], [Position], [StartDate], [EndDate]) VALUES (7, 1007, N'字节跳动', N'Java开发工程师', CAST(N'2021-06-22' AS Date), CAST(N'2022-05-22' AS Date))
INSERT [dbo].[WorkExperience] ([ExperienceID], [EmployeeID], [CompanyName], [Position], [StartDate], [EndDate]) VALUES (8, 1008, N'字节跳动', N'人事部长', CAST(N'2021-06-22' AS Date), CAST(N'2022-05-22' AS Date))
INSERT [dbo].[WorkExperience] ([ExperienceID], [EmployeeID], [CompanyName], [Position], [StartDate], [EndDate]) VALUES (9, 1009, N'建滔科技', N'财务部长', CAST(N'2021-06-22' AS Date), CAST(N'2022-05-22' AS Date))
INSERT [dbo].[WorkExperience] ([ExperienceID], [EmployeeID], [CompanyName], [Position], [StartDate], [EndDate]) VALUES (10, 1010, N'新视窗', N'行政总管', CAST(N'2021-06-22' AS Date), CAST(N'2022-05-22' AS Date))
INSERT [dbo].[WorkExperience] ([ExperienceID], [EmployeeID], [CompanyName], [Position], [StartDate], [EndDate]) VALUES (11, 1011, N'新能德', N'公关经理', CAST(N'2021-06-22' AS Date), CAST(N'2022-05-22' AS Date))
INSERT [dbo].[WorkExperience] ([ExperienceID], [EmployeeID], [CompanyName], [Position], [StartDate], [EndDate]) VALUES (12, 1012, N'技研新阳', N'销售部长', CAST(N'2021-06-22' AS Date), CAST(N'2022-05-22' AS Date))
INSERT [dbo].[WorkExperience] ([ExperienceID], [EmployeeID], [CompanyName], [Position], [StartDate], [EndDate]) VALUES (17, 1013, N'腾讯公司', N'软件工程师', CAST(N'2022-08-21' AS Date), CAST(N'2023-03-01' AS Date))
INSERT [dbo].[WorkExperience] ([ExperienceID], [EmployeeID], [CompanyName], [Position], [StartDate], [EndDate]) VALUES (1015, 1014, N'广东都市丽人', N'卡通演员', CAST(N'2011-03-04' AS Date), CAST(N'2023-08-24' AS Date))
SET IDENTITY_INSERT [dbo].[WorkExperience] OFF
GO
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD  CONSTRAINT [FK__Assessmen__Emplo__6FE99F9F] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Assessment] CHECK CONSTRAINT [FK__Assessmen__Emplo__6FE99F9F]
GO
ALTER TABLE [dbo].[EducationExperience]  WITH CHECK ADD  CONSTRAINT [FK__Education__Emplo__4CA06362] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EducationExperience] CHECK CONSTRAINT [FK__Education__Emplo__4CA06362]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK__Employee__Depart__403A8C7D] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK__Employee__Depart__403A8C7D]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK__Employee__Positi__412EB0B6] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([PositionID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK__Employee__Positi__412EB0B6]
GO
ALTER TABLE [dbo].[EmployeeRelative]  WITH CHECK ADD  CONSTRAINT [FK__EmployeeR__Emplo__440B1D61] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeRelative] CHECK CONSTRAINT [FK__EmployeeR__Emplo__440B1D61]
GO
ALTER TABLE [dbo].[WorkExperience]  WITH CHECK ADD  CONSTRAINT [FK__WorkExper__Emplo__49C3F6B7] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[WorkExperience] CHECK CONSTRAINT [FK__WorkExper__Emplo__49C3F6B7]
GO
