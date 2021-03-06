USE [master]
GO
/****** Object:  Database [TinyVideo]    Script Date: 07/20/2015 14:53:35 ******/
CREATE DATABASE [TinyVideo]  
go


USE [TinyVideo]
GO
/****** Object:  Schema [Sales]    Script Date: 07/20/2015 14:53:35 ******/
CREATE SCHEMA [Sales] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [Rentals]    Script Date: 07/20/2015 14:53:35 ******/
CREATE SCHEMA [Rentals] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [Inventory]    Script Date: 07/20/2015 14:53:35 ******/
CREATE SCHEMA [Inventory] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [HumanResources]    Script Date: 07/20/2015 14:53:35 ******/
CREATE SCHEMA [HumanResources] AUTHORIZATION [dbo]
GO
/****** Object:  Table [Sales].[PRICE]    Script Date: 07/20/2015 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Sales].[PRICE](
	[PRICE_CODE] [decimal](2, 0) NOT NULL,
	[PRICE_DESCRIPTION] [varchar](20) NOT NULL,
	[PRICE_RENTFEE] [decimal](5, 2) NULL,
	[PRICE_DAILYLATEFEE] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[PRICE_CODE] ASC
)
)
GO
SET ANSI_PADDING OFF
GO
INSERT [Sales].[PRICE] ([PRICE_CODE], [PRICE_DESCRIPTION], [PRICE_RENTFEE], [PRICE_DAILYLATEFEE]) VALUES (CAST(1 AS Decimal(2, 0)), N'Standard', CAST(2.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)))
INSERT [Sales].[PRICE] ([PRICE_CODE], [PRICE_DESCRIPTION], [PRICE_RENTFEE], [PRICE_DAILYLATEFEE]) VALUES (CAST(2 AS Decimal(2, 0)), N'New Release', CAST(3.50 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)))
INSERT [Sales].[PRICE] ([PRICE_CODE], [PRICE_DESCRIPTION], [PRICE_RENTFEE], [PRICE_DAILYLATEFEE]) VALUES (CAST(3 AS Decimal(2, 0)), N'Discount', CAST(1.50 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)))
INSERT [Sales].[PRICE] ([PRICE_CODE], [PRICE_DESCRIPTION], [PRICE_RENTFEE], [PRICE_DAILYLATEFEE]) VALUES (CAST(4 AS Decimal(2, 0)), N'Weekly Special', CAST(1.00 AS Decimal(5, 2)), CAST(0.50 AS Decimal(5, 2)))
/****** Object:  Table [Rentals].[MembershipCategory]    Script Date: 07/20/2015 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rentals].[MembershipCategory](
	[MembershipCategory] [smallint] NOT NULL,
	[MembershipCatDescription] [nchar](20) NULL,
	constraint [PK_MemberCategories] primary key (MembershipCategory)
) ON [PRIMARY]
GO
INSERT [Rentals].[MembershipCategory] ([MembershipCategory], [MembershipCatDescription]) VALUES (5, N'NonEnglishSpeaking  ')
INSERT [Rentals].[MembershipCategory] ([MembershipCategory], [MembershipCatDescription]) VALUES (1, N'Juvenile            ')
INSERT [Rentals].[MembershipCategory] ([MembershipCategory], [MembershipCatDescription]) VALUES (2, N'Teenager            ')
INSERT [Rentals].[MembershipCategory] ([MembershipCategory], [MembershipCatDescription]) VALUES (3, N'Adult               ')
INSERT [Rentals].[MembershipCategory] ([MembershipCategory], [MembershipCatDescription]) VALUES (4, N'Senior              ')
/****** Object:  Table [Rentals].[MEMBERSHIP]    Script Date: 07/20/2015 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Rentals].[MEMBERSHIP](
	[MEM_NUM] [int] NOT NULL,
	[MEM_FNAME] [varchar](30) NOT NULL,
	[MEM_LNAME] [varchar](30) NOT NULL,
	[MEM_STREET] [varchar](120) NULL,
	[MEM_CITY] [varchar](50) NULL,
	[MEM_STATE] [char](2) NULL,
	[MEM_ZIP] [char](5) NULL,
	[MEM_BALANCE] [decimal](10, 2) not NULL,
	[MEM_CREDITLIMIT] [decimal](10, 2) NULL,
	[MemberCategory] [smallint] NULL,
 CONSTRAINT [PK__MEMBERSH__972E4E1D0519C6AF] PRIMARY KEY (	[MEM_NUM] ),
 constraint [FK_MEMBERSHIP_MEMBERCATEGORY] foreign key (MemberCategory)
  references Rentals.MembershipCategory(MembershipCategory)
  );
  
 
go
SET ANSI_PADDING OFF
GO
INSERT [Rentals].[MEMBERSHIP] ([MEM_NUM], [MEM_FNAME], [MEM_LNAME], [MEM_STREET], [MEM_CITY], [MEM_STATE], [MEM_ZIP], [MEM_BALANCE], [MEM_CREDITLIMIT], [MemberCategory]) VALUES (102, N'TAMI', N'DAWSON', N'2632 TAKLI CIRCLE', N'NORENE', N'TN', N'37136', CAST(11.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), 1)
INSERT [Rentals].[MEMBERSHIP] ([MEM_NUM], [MEM_FNAME], [MEM_LNAME], [MEM_STREET], [MEM_CITY], [MEM_STATE], [MEM_ZIP], [MEM_BALANCE], [MEM_CREDITLIMIT], [MemberCategory]) VALUES (103, N'CURT', N'KNIGHT', N'4025 CORNELL COURT', N'FLATGAP', N'KY', N'41219', CAST(6.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), 1)
INSERT [Rentals].[MEMBERSHIP] ([MEM_NUM], [MEM_FNAME], [MEM_LNAME], [MEM_STREET], [MEM_CITY], [MEM_STATE], [MEM_ZIP], [MEM_BALANCE], [MEM_CREDITLIMIT], [MemberCategory]) VALUES (104, N'JAMAL', N'MELENDEZ', N'788 EAST 145TH AVENUE', N'QUEBECK', N'TN', N'38579', CAST(0.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), 2)
INSERT [Rentals].[MEMBERSHIP] ([MEM_NUM], [MEM_FNAME], [MEM_LNAME], [MEM_STREET], [MEM_CITY], [MEM_STATE], [MEM_ZIP], [MEM_BALANCE], [MEM_CREDITLIMIT], [MemberCategory]) VALUES (105, N'IVA', N'MCCLAIN', N'6045 MUSKET BALL CIRCLE', N'SUMMIT', N'KY', N'42783', CAST(15.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), 2)
INSERT [Rentals].[MEMBERSHIP] ([MEM_NUM], [MEM_FNAME], [MEM_LNAME], [MEM_STREET], [MEM_CITY], [MEM_STATE], [MEM_ZIP], [MEM_BALANCE], [MEM_CREDITLIMIT], [MemberCategory]) VALUES (106, N'MIRANDA', N'PARKS', N'4469 MAXWELL PLACE', N'GERMANTOWN', N'TN', N'38183', CAST(0.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), 2)
INSERT [Rentals].[MEMBERSHIP] ([MEM_NUM], [MEM_FNAME], [MEM_LNAME], [MEM_STREET], [MEM_CITY], [MEM_STATE], [MEM_ZIP], [MEM_BALANCE], [MEM_CREDITLIMIT], [MemberCategory]) VALUES (107, N'ROSARIO', N'ELLIOTT', N'7578 DANNER AVENUE', N'COLUMBIA', N'TN', N'38402', CAST(5.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), 3)
INSERT [Rentals].[MEMBERSHIP] ([MEM_NUM], [MEM_FNAME], [MEM_LNAME], [MEM_STREET], [MEM_CITY], [MEM_STATE], [MEM_ZIP], [MEM_BALANCE], [MEM_CREDITLIMIT], [MemberCategory]) VALUES (108, N'MATTIE', N'GUY', N'4390 EVERGREEN STREET', N'LILY', N'KY', N'40740', CAST(0.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), 3)
INSERT [Rentals].[MEMBERSHIP] ([MEM_NUM], [MEM_FNAME], [MEM_LNAME], [MEM_STREET], [MEM_CITY], [MEM_STATE], [MEM_ZIP], [MEM_BALANCE], [MEM_CREDITLIMIT], [MemberCategory]) VALUES (109, N'CLINT', N'OCHOA', N'1711 ELM STREET', N'GREENEVILLE', N'TN', N'37745', CAST(10.00 AS Decimal(10, 2)), CAST(20.00 AS Decimal(10, 2)), 3)
INSERT [Rentals].[MEMBERSHIP] ([MEM_NUM], [MEM_FNAME], [MEM_LNAME], [MEM_STREET], [MEM_CITY], [MEM_STATE], [MEM_ZIP], [MEM_BALANCE], [MEM_CREDITLIMIT], [MemberCategory]) VALUES (110, N'LEWIS', N'ROSALES', N'4524 SOUTHWIND CIRCLE', N'COUNCE', N'TN', N'38326', CAST(0.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), 4)
INSERT [Rentals].[MEMBERSHIP] ([MEM_NUM], [MEM_FNAME], [MEM_LNAME], [MEM_STREET], [MEM_CITY], [MEM_STATE], [MEM_ZIP], [MEM_BALANCE], [MEM_CREDITLIMIT], [MemberCategory]) VALUES (111, N'STACY', N'MANN', N'2789 EAST COOK AVENUE', N'MURFREESBORO', N'TN', N'37132', CAST(8.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), 4)
INSERT [Rentals].[MEMBERSHIP] ([MEM_NUM], [MEM_FNAME], [MEM_LNAME], [MEM_STREET], [MEM_CITY], [MEM_STATE], [MEM_ZIP], [MEM_BALANCE], [MEM_CREDITLIMIT], [MemberCategory]) VALUES (112, N'LUIS', N'TRUJILLO', N'7267 MELVIN AVENUE', N'HEISKELL', N'TN', N'37754', CAST(3.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), 4)
INSERT [Rentals].[MEMBERSHIP] ([MEM_NUM], [MEM_FNAME], [MEM_LNAME], [MEM_STREET], [MEM_CITY], [MEM_STATE], [MEM_ZIP], [MEM_BALANCE], [MEM_CREDITLIMIT], [MemberCategory]) VALUES (113, N'MINNIE', N'GONZALES', N'6430 VASILI DRIVE', N'WILLISTON', N'TN', N'38076', CAST(0.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), 4)
INSERT [Rentals].[MEMBERSHIP] ([MEM_NUM], [MEM_FNAME], [MEM_LNAME], [MEM_STREET], [MEM_CITY], [MEM_STATE], [MEM_ZIP], [MEM_BALANCE], [MEM_CREDITLIMIT], [MemberCategory]) VALUES (114, N'TONY', N'BLAIR', N'62 WATSON AVE', N'EDISON', N'NJ', N'08817', CAST(0.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), 4)
/****** Object:  Table [HumanResources].[EMPTYPES]    Script Date: 07/20/2015 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [HumanResources].[EMPTYPES](
	[EmpTypeID] [int] NOT NULL,
	[EmpType_Description] [char](25) NOT NULL,
 CONSTRAINT [EmpType_PK] PRIMARY KEY CLUSTERED 
(
	[EmpTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [HumanResources].[EMPTYPES] ([EmpTypeID], [EmpType_Description]) VALUES (1, N'MANAGER                  ')
INSERT [HumanResources].[EMPTYPES] ([EmpTypeID], [EmpType_Description]) VALUES (2, N'STOCKBOY                 ')
INSERT [HumanResources].[EMPTYPES] ([EmpTypeID], [EmpType_Description]) VALUES (3, N'CASHIER                  ')
INSERT [HumanResources].[EMPTYPES] ([EmpTypeID], [EmpType_Description]) VALUES (4, N'ACCOUNTANT               ')
INSERT [HumanResources].[EMPTYPES] ([EmpTypeID], [EmpType_Description]) VALUES (5, N'ACCOUNT MANAGER          ')
INSERT [HumanResources].[EMPTYPES] ([EmpTypeID], [EmpType_Description]) VALUES (6, N'PROGRAMMER               ')
INSERT [HumanResources].[EMPTYPES] ([EmpTypeID], [EmpType_Description]) VALUES (7, N'DBA                      ')
INSERT [HumanResources].[EMPTYPES] ([EmpTypeID], [EmpType_Description]) VALUES (8, N'SALES                    ')
INSERT [HumanResources].[EMPTYPES] ([EmpTypeID], [EmpType_Description]) VALUES (9, N'INVENTORYMANAGER         ')
/****** Object:  Table [Inventory].[MOVIEGENRE]    Script Date: 07/20/2015 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Inventory].[MOVIEGENRE](
	[GenreCode] [smallint] NOT NULL,
	[GenreDescription] [nchar](10) NULL,
 CONSTRAINT [PK_MOVIEGENRE] PRIMARY KEY CLUSTERED 
(
	[GenreCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Inventory].[MOVIEGENRE] ([GenreCode], [GenreDescription]) VALUES (1, N'FAMILY    ')
INSERT [Inventory].[MOVIEGENRE] ([GenreCode], [GenreDescription]) VALUES (2, N'ACTION    ')
INSERT [Inventory].[MOVIEGENRE] ([GenreCode], [GenreDescription]) VALUES (3, N'DRAMA     ')
INSERT [Inventory].[MOVIEGENRE] ([GenreCode], [GenreDescription]) VALUES (4, N'COMEDY    ')
INSERT [Inventory].[MOVIEGENRE] ([GenreCode], [GenreDescription]) VALUES (5, N'HISTORY   ')
/****** Object:  Table [Inventory].[MOVIE]    Script Date: 07/20/2015 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Inventory].[MOVIE](
	[MOVIE_NUM] [int] NOT NULL,
	[MOVIE_TITLE] [varchar](75) NOT NULL,
	[MOVIE_YEAR] [decimal](4, 0) NULL,
	[MOVIE_COST] [decimal](5, 2) NULL,
	[MOVIE_GENRE] [smallint] NULL,
	[PRICE_CODE] [decimal](2, 0) NULL,
 CONSTRAINT [PK__MOVIE__896F539B164452B1] PRIMARY KEY CLUSTERED 
(
	[MOVIE_NUM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [Inventory].[MOVIE] ([MOVIE_NUM], [MOVIE_TITLE], [MOVIE_YEAR], [MOVIE_COST], [MOVIE_GENRE], [PRICE_CODE]) VALUES (1234, N'The Cesar Family Christmas', CAST(2007 AS Decimal(4, 0)), CAST(39.95 AS Decimal(5, 2)), 1, CAST(2 AS Decimal(2, 0)))
INSERT [Inventory].[MOVIE] ([MOVIE_NUM], [MOVIE_TITLE], [MOVIE_YEAR], [MOVIE_COST], [MOVIE_GENRE], [PRICE_CODE]) VALUES (1235, N'Smokey Mountain Wildlife', CAST(2004 AS Decimal(4, 0)), CAST(59.95 AS Decimal(5, 2)), 2, CAST(1 AS Decimal(2, 0)))
INSERT [Inventory].[MOVIE] ([MOVIE_NUM], [MOVIE_TITLE], [MOVIE_YEAR], [MOVIE_COST], [MOVIE_GENRE], [PRICE_CODE]) VALUES (1236, N'Richard Goodhope', CAST(2008 AS Decimal(4, 0)), CAST(59.95 AS Decimal(5, 2)), 3, CAST(2 AS Decimal(2, 0)))
INSERT [Inventory].[MOVIE] ([MOVIE_NUM], [MOVIE_TITLE], [MOVIE_YEAR], [MOVIE_COST], [MOVIE_GENRE], [PRICE_CODE]) VALUES (1237, N'Beatnik Fever', CAST(2007 AS Decimal(4, 0)), CAST(29.95 AS Decimal(5, 2)), 4, CAST(2 AS Decimal(2, 0)))
INSERT [Inventory].[MOVIE] ([MOVIE_NUM], [MOVIE_TITLE], [MOVIE_YEAR], [MOVIE_COST], [MOVIE_GENRE], [PRICE_CODE]) VALUES (1238, N'Constant Companion', CAST(2008 AS Decimal(4, 0)), CAST(89.95 AS Decimal(5, 2)), 3, CAST(1 AS Decimal(2, 0)))
INSERT [Inventory].[MOVIE] ([MOVIE_NUM], [MOVIE_TITLE], [MOVIE_YEAR], [MOVIE_COST], [MOVIE_GENRE], [PRICE_CODE]) VALUES (1239, N'Where Hope Dies', CAST(1998 AS Decimal(4, 0)), CAST(25.49 AS Decimal(5, 2)), 3, CAST(3 AS Decimal(2, 0)))
INSERT [Inventory].[MOVIE] ([MOVIE_NUM], [MOVIE_TITLE], [MOVIE_YEAR], [MOVIE_COST], [MOVIE_GENRE], [PRICE_CODE]) VALUES (1245, N'Time to Burn', CAST(2005 AS Decimal(4, 0)), CAST(45.49 AS Decimal(5, 2)), 2, CAST(1 AS Decimal(2, 0)))
INSERT [Inventory].[MOVIE] ([MOVIE_NUM], [MOVIE_TITLE], [MOVIE_YEAR], [MOVIE_COST], [MOVIE_GENRE], [PRICE_CODE]) VALUES (1246, N'What He Doesn''t Know', CAST(2006 AS Decimal(4, 0)), CAST(58.29 AS Decimal(5, 2)), 4, CAST(1 AS Decimal(2, 0)))
/****** Object:  Table [HumanResources].[EMPLOYEE]    Script Date: 07/20/2015 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [HumanResources].[EMPLOYEE](
	[EmpID] [int] NOT NULL,
	[Emp_FName] [char](15) NOT NULL,
	[Emp_LName] [char](30) NOT NULL,
	[Emp_BirthDate] [datetime] NOT NULL,
	[Emp_SSNum] [char](9) NOT NULL,
	[Emp_HireDate] [datetime] NOT NULL,
	[Emp_Salary] [decimal](10, 2) NOT NULL,
	[Emp_TYPE] [int] NOT NULL,
 CONSTRAINT [EMP_PK] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [SSNUM_UDX] UNIQUE NONCLUSTERED 
(
	[Emp_SSNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [HumanResources].[EMPLOYEE] ([EmpID], [Emp_FName], [Emp_LName], [Emp_BirthDate], [Emp_SSNum], [Emp_HireDate], [Emp_Salary], [Emp_TYPE]) VALUES (1, N'John           ', N'Dickson                       ', CAST(0x0000564F00000000 AS DateTime), N'111223333', CAST(0x000080F600000000 AS DateTime), CAST(80000.00 AS Decimal(10, 2)), 1)
INSERT [HumanResources].[EMPLOYEE] ([EmpID], [Emp_FName], [Emp_LName], [Emp_BirthDate], [Emp_SSNum], [Emp_HireDate], [Emp_Salary], [Emp_TYPE]) VALUES (2, N'Jim            ', N'Walker                        ', CAST(0x00006B8F00000000 AS DateTime), N'222334444', CAST(0x0000884A00000000 AS DateTime), CAST(15000.00 AS Decimal(10, 2)), 2)
INSERT [HumanResources].[EMPLOYEE] ([EmpID], [Emp_FName], [Emp_LName], [Emp_BirthDate], [Emp_SSNum], [Emp_HireDate], [Emp_Salary], [Emp_TYPE]) VALUES (3, N'Jane           ', N'Walsh                         ', CAST(0x00006CB500000000 AS DateTime), N'333445555', CAST(0x00008C0500000000 AS DateTime), CAST(20000.00 AS Decimal(10, 2)), 3)
INSERT [HumanResources].[EMPLOYEE] ([EmpID], [Emp_FName], [Emp_LName], [Emp_BirthDate], [Emp_SSNum], [Emp_HireDate], [Emp_Salary], [Emp_TYPE]) VALUES (4, N'Donald         ', N'Williams                      ', CAST(0x000065A900000000 AS DateTime), N'123454444', CAST(0x00008D8500000000 AS DateTime), CAST(76000.00 AS Decimal(10, 2)), 6)
INSERT [HumanResources].[EMPLOYEE] ([EmpID], [Emp_FName], [Emp_LName], [Emp_BirthDate], [Emp_SSNum], [Emp_HireDate], [Emp_Salary], [Emp_TYPE]) VALUES (5, N'George         ', N'Evans                         ', CAST(0x00006D2F00000000 AS DateTime), N'112233445', CAST(0x00008ACA00000000 AS DateTime), CAST(65000.00 AS Decimal(10, 2)), 7)
INSERT [HumanResources].[EMPLOYEE] ([EmpID], [Emp_FName], [Emp_LName], [Emp_BirthDate], [Emp_SSNum], [Emp_HireDate], [Emp_Salary], [Emp_TYPE]) VALUES (6, N'Tina           ', N'Edwards                       ', CAST(0x00005D5F00000000 AS DateTime), N'111222333', CAST(0x00008CA700000000 AS DateTime), CAST(50000.00 AS Decimal(10, 2)), 8)
INSERT [HumanResources].[EMPLOYEE] ([EmpID], [Emp_FName], [Emp_LName], [Emp_BirthDate], [Emp_SSNum], [Emp_HireDate], [Emp_Salary], [Emp_TYPE]) VALUES (7, N'Jill           ', N'Nevins                        ', CAST(0x000057EA00000000 AS DateTime), N'232345443', CAST(0x00008DF400000000 AS DateTime), CAST(55000.00 AS Decimal(10, 2)), 5)
INSERT [HumanResources].[EMPLOYEE] ([EmpID], [Emp_FName], [Emp_LName], [Emp_BirthDate], [Emp_SSNum], [Emp_HireDate], [Emp_Salary], [Emp_TYPE]) VALUES (8, N'Susan          ', N'Young                         ', CAST(0x0000535D00000000 AS DateTime), N'678912345', CAST(0x0000826E00000000 AS DateTime), CAST(62000.00 AS Decimal(10, 2)), 9)
INSERT [HumanResources].[EMPLOYEE] ([EmpID], [Emp_FName], [Emp_LName], [Emp_BirthDate], [Emp_SSNum], [Emp_HireDate], [Emp_Salary], [Emp_TYPE]) VALUES (9, N'Dave           ', N'Hartman                       ', CAST(0x000067AE00000000 AS DateTime), N'987654321', CAST(0x00008FA200000000 AS DateTime), CAST(70000.00 AS Decimal(10, 2)), 4)
/****** Object:  Table [Rentals].[RENTAL]    Script Date: 07/20/2015 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rentals].[RENTAL](
	[RENT_NUM] [decimal](8, 0) NOT NULL,
	[RENT_DATE] [date] NULL,
	[MEM_NUM] [int] NULL,
	[EMPID] int null,
 CONSTRAINT [PK_RENTAL] PRIMARY KEY CLUSTERED 
(
	[RENT_NUM] ASC
),
constraint [FK_Rental_Employee] foreign key (EmpID)
references HumanResources.Employee(empid)
) ON [PRIMARY]
GO
INSERT [Rentals].[RENTAL] ([RENT_NUM], [RENT_DATE], [MEM_NUM],empID) VALUES (CAST(1001 AS Decimal(8, 0)), CAST(0x1A310B00 AS Date), 103,3)
INSERT [Rentals].[RENTAL] ([RENT_NUM], [RENT_DATE], [MEM_NUM],empid) VALUES (CAST(1002 AS Decimal(8, 0)), CAST(0x1A310B00 AS Date), 105,3)
INSERT [Rentals].[RENTAL] ([RENT_NUM], [RENT_DATE], [MEM_NUM],empid) VALUES (CAST(1003 AS Decimal(8, 0)), CAST(0x1B310B00 AS Date), 102,3)
INSERT [Rentals].[RENTAL] ([RENT_NUM], [RENT_DATE], [MEM_NUM],empid) VALUES (CAST(1004 AS Decimal(8, 0)), CAST(0x1B310B00 AS Date), 110,3)
INSERT [Rentals].[RENTAL] ([RENT_NUM], [RENT_DATE], [MEM_NUM],empid) VALUES (CAST(1005 AS Decimal(8, 0)), CAST(0x1B310B00 AS Date), 111,3)
INSERT [Rentals].[RENTAL] ([RENT_NUM], [RENT_DATE], [MEM_NUM],empid) VALUES (CAST(1006 AS Decimal(8, 0)), CAST(0x1B310B00 AS Date), 107,3)
INSERT [Rentals].[RENTAL] ([RENT_NUM], [RENT_DATE], [MEM_NUM],empid) VALUES (CAST(1007 AS Decimal(8, 0)), CAST(0x1B310B00 AS Date), 104,3)
INSERT [Rentals].[RENTAL] ([RENT_NUM], [RENT_DATE], [MEM_NUM],empid) VALUES (CAST(1008 AS Decimal(8, 0)), CAST(0x1C310B00 AS Date), 105,6)
INSERT [Rentals].[RENTAL] ([RENT_NUM], [RENT_DATE], [MEM_NUM],empid) VALUES (CAST(1009 AS Decimal(8, 0)), CAST(0x1C310B00 AS Date), 111,6)
INSERT [Rentals].[RENTAL] ([RENT_NUM], [RENT_DATE], [MEM_NUM],empid) VALUES (CAST(1010 AS Decimal(8, 0)), CAST(0x29310B00 AS Date), 113,3)
/****** Object:  Table [Rentals].[PAYMENT]    Script Date: 07/20/2015 14:53:37 ******/




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rentals].[PAYMENT](
	[PaymentID] [int] NOT NULL,
	[PaymentDate] [smalldatetime] NOT NULL,
	[Mem_Num] [int] NOT NULL,
	[PaymentAmount] [decimal](5, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Inventory].[VIDEO]    Script Date: 07/20/2015 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Inventory].[VIDEO](
	[VID_NUM] [int] NOT NULL,
	[VID_INDATE] [date] NULL,
	[VID_MOVIE_NUM] [int] NULL,
 CONSTRAINT [PK__VIDEO__3A82860C1BFD2C07] PRIMARY KEY CLUSTERED 
(
	[VID_NUM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Inventory].[VIDEO] ([VID_NUM], [VID_INDATE], [VID_MOVIE_NUM]) VALUES (34341, CAST(0x192E0B00 AS Date), 1235)
INSERT [Inventory].[VIDEO] ([VID_NUM], [VID_INDATE], [VID_MOVIE_NUM]) VALUES (34342, CAST(0x192E0B00 AS Date), 1235)
INSERT [Inventory].[VIDEO] ([VID_NUM], [VID_INDATE], [VID_MOVIE_NUM]) VALUES (34366, CAST(0x1B310B00 AS Date), 1236)
INSERT [Inventory].[VIDEO] ([VID_NUM], [VID_INDATE], [VID_MOVIE_NUM]) VALUES (34367, CAST(0x1B310B00 AS Date), 1236)
INSERT [Inventory].[VIDEO] ([VID_NUM], [VID_INDATE], [VID_MOVIE_NUM]) VALUES (34368, CAST(0x1B310B00 AS Date), 1236)
INSERT [Inventory].[VIDEO] ([VID_NUM], [VID_INDATE], [VID_MOVIE_NUM]) VALUES (34369, CAST(0x1B310B00 AS Date), 1236)
INSERT [Inventory].[VIDEO] ([VID_NUM], [VID_INDATE], [VID_MOVIE_NUM]) VALUES (44392, CAST(0x97300B00 AS Date), 1237)
INSERT [Inventory].[VIDEO] ([VID_NUM], [VID_INDATE], [VID_MOVIE_NUM]) VALUES (44397, CAST(0x97300B00 AS Date), 1237)
INSERT [Inventory].[VIDEO] ([VID_NUM], [VID_INDATE], [VID_MOVIE_NUM]) VALUES (54321, CAST(0x1A300B00 AS Date), 1234)
INSERT [Inventory].[VIDEO] ([VID_NUM], [VID_INDATE], [VID_MOVIE_NUM]) VALUES (54324, CAST(0x1A300B00 AS Date), 1234)
INSERT [Inventory].[VIDEO] ([VID_NUM], [VID_INDATE], [VID_MOVIE_NUM]) VALUES (54325, CAST(0x1A300B00 AS Date), 1234)
INSERT [Inventory].[VIDEO] ([VID_NUM], [VID_INDATE], [VID_MOVIE_NUM]) VALUES (59237, CAST(0x0B310B00 AS Date), 1237)
INSERT [Inventory].[VIDEO] ([VID_NUM], [VID_INDATE], [VID_MOVIE_NUM]) VALUES (61353, CAST(0xB22C0B00 AS Date), 1245)
INSERT [Inventory].[VIDEO] ([VID_NUM], [VID_INDATE], [VID_MOVIE_NUM]) VALUES (61354, CAST(0xB22C0B00 AS Date), 1245)
INSERT [Inventory].[VIDEO] ([VID_NUM], [VID_INDATE], [VID_MOVIE_NUM]) VALUES (61367, CAST(0x44300B00 AS Date), 1246)
INSERT [Inventory].[VIDEO] ([VID_NUM], [VID_INDATE], [VID_MOVIE_NUM]) VALUES (61369, CAST(0x44300B00 AS Date), 1246)
INSERT [Inventory].[VIDEO] ([VID_NUM], [VID_INDATE], [VID_MOVIE_NUM]) VALUES (61388, CAST(0x1C2E0B00 AS Date), 1239)
/****** Object:  Table [Rentals].[RENTALDETAILS]    Script Date: 07/20/2015 14:53:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Rentals].[RENTALDETAILS](
	[RENT_NUM] [decimal](8, 0) NOT NULL,
	[VID_NUM] [int] NOT NULL,
	[DETAIL_FEE] [decimal](5, 2) NULL,
	[DETAIL_DUEDATE] [date] NULL,
	[DETAIL_RETURNDATE] [date] NULL,
	[DETAIL_DAILYLATEFEE] [decimal](5, 2) NULL,
 CONSTRAINT [DETAIL_RENT_VID_PK] PRIMARY KEY CLUSTERED 
(
	[RENT_NUM] ASC,
	[VID_NUM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1001 AS Decimal(8, 0)), 34342, CAST(2.00 AS Decimal(5, 2)), CAST(0x1D310B00 AS Date), CAST(0x1B310B00 AS Date), CAST(1.00 AS Decimal(5, 2)))
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1001 AS Decimal(8, 0)), 34366, CAST(3.50 AS Decimal(5, 2)), CAST(0x1D310B00 AS Date), CAST(0x1B310B00 AS Date), CAST(3.00 AS Decimal(5, 2)))
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1001 AS Decimal(8, 0)), 61353, CAST(2.00 AS Decimal(5, 2)), CAST(0x1D310B00 AS Date), CAST(0x1C310B00 AS Date), CAST(1.00 AS Decimal(5, 2)))
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1002 AS Decimal(8, 0)), 59237, CAST(3.50 AS Decimal(5, 2)), CAST(0x1D310B00 AS Date), CAST(0x1D310B00 AS Date), CAST(3.00 AS Decimal(5, 2)))
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1003 AS Decimal(8, 0)), 54325, CAST(3.50 AS Decimal(5, 2)), CAST(0x1D310B00 AS Date), CAST(0x22310B00 AS Date), CAST(3.00 AS Decimal(5, 2)))
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1003 AS Decimal(8, 0)), 61369, CAST(2.00 AS Decimal(5, 2)), CAST(0x1F310B00 AS Date), CAST(0x22310B00 AS Date), CAST(1.00 AS Decimal(5, 2)))
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1003 AS Decimal(8, 0)), 61388, CAST(0.00 AS Decimal(5, 2)), CAST(0x1F310B00 AS Date), CAST(0x22310B00 AS Date), CAST(1.00 AS Decimal(5, 2)))
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1004 AS Decimal(8, 0)), 34341, CAST(2.00 AS Decimal(5, 2)), CAST(0x20310B00 AS Date), CAST(0x20310B00 AS Date), CAST(1.00 AS Decimal(5, 2)))
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1004 AS Decimal(8, 0)), 34367, CAST(3.50 AS Decimal(5, 2)), CAST(0x1E310B00 AS Date), CAST(0x20310B00 AS Date), CAST(3.00 AS Decimal(5, 2)))
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1004 AS Decimal(8, 0)), 44392, CAST(3.50 AS Decimal(5, 2)), CAST(0x1E310B00 AS Date), CAST(0x20310B00 AS Date), CAST(3.00 AS Decimal(5, 2)))
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1005 AS Decimal(8, 0)), 34342, CAST(2.00 AS Decimal(5, 2)), CAST(0x20310B00 AS Date), CAST(0x1E310B00 AS Date), CAST(1.00 AS Decimal(5, 2)))
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1005 AS Decimal(8, 0)), 44397, CAST(3.50 AS Decimal(5, 2)), CAST(0x1E310B00 AS Date), CAST(0x1E310B00 AS Date), CAST(3.00 AS Decimal(5, 2)))
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1006 AS Decimal(8, 0)), 34366, CAST(3.50 AS Decimal(5, 2)), CAST(0x1E310B00 AS Date), CAST(0x1D310B00 AS Date), CAST(3.00 AS Decimal(5, 2)))
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1006 AS Decimal(8, 0)), 61367, CAST(2.00 AS Decimal(5, 2)), CAST(0x20310B00 AS Date), NULL, CAST(1.00 AS Decimal(5, 2)))
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1007 AS Decimal(8, 0)), 34368, CAST(3.50 AS Decimal(5, 2)), CAST(0x1E310B00 AS Date), NULL, CAST(3.00 AS Decimal(5, 2)))
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1008 AS Decimal(8, 0)), 34369, CAST(3.50 AS Decimal(5, 2)), CAST(0x1E310B00 AS Date), CAST(0x1E310B00 AS Date), CAST(3.00 AS Decimal(5, 2)))
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1009 AS Decimal(8, 0)), 54324, CAST(3.50 AS Decimal(5, 2)), CAST(0x1E310B00 AS Date), NULL, CAST(3.00 AS Decimal(5, 2)))
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1010 AS Decimal(8, 0)), 34369, CAST(3.50 AS Decimal(5, 2)), CAST(0x2B310B00 AS Date), CAST(0x2A310B00 AS Date), CAST(3.00 AS Decimal(5, 2)))
INSERT [Rentals].[RENTALDETAILS] ([RENT_NUM], [VID_NUM], [DETAIL_FEE], [DETAIL_DUEDATE], [DETAIL_RETURNDATE], [DETAIL_DAILYLATEFEE]) VALUES (CAST(1010 AS Decimal(8, 0)), 61369, CAST(2.00 AS Decimal(5, 2)), CAST(0x2B310B00 AS Date), CAST(0x29310B00 AS Date), CAST(1.00 AS Decimal(5, 2)))
/****** Object:  Default [DF__RENTAL__RENT_DAT__07F6335A]    Script Date: 07/20/2015 14:53:37 ******/
ALTER TABLE [Rentals].[RENTAL] ADD  CONSTRAINT [DF__RENTAL__RENT_DAT__07F6335A]  DEFAULT (getdate()) FOR [RENT_DATE]
GO
/****** Object:  Check [CK__PRICE__PRICE_DAI__023D5A04]    Script Date: 07/20/2015 14:53:37 ******/
ALTER TABLE [Sales].[PRICE]  WITH CHECK ADD CHECK  (([PRICE_DAILYLATEFEE]>=(0)))
GO
/****** Object:  Check [CK__PRICE__PRICE_REN__014935CB]    Script Date: 07/20/2015 14:53:37 ******/
ALTER TABLE [Sales].[PRICE]  WITH CHECK ADD CHECK  (([PRICE_RENTFEE]>=(0)))
GO
/****** Object:  Check [CK__MOVIE__MOVIE_YEA__182C9B23]    Script Date: 07/20/2015 14:53:37 ******/
ALTER TABLE [Inventory].[MOVIE]  WITH CHECK ADD  CONSTRAINT [CK__MOVIE__MOVIE_YEA__182C9B23] CHECK  (([MOVIE_YEAR]>(1900)))
GO
ALTER TABLE [Inventory].[MOVIE] CHECK CONSTRAINT [CK__MOVIE__MOVIE_YEA__182C9B23]
GO
/****** Object:  Check [CK_PaymentAmount]    Script Date: 07/20/2015 14:53:37 ******/
ALTER TABLE [Rentals].[PAYMENT]  WITH CHECK ADD  CONSTRAINT [CK_PaymentAmount] CHECK  (([PaymentAmount]>(0)))
GO
ALTER TABLE [Rentals].[PAYMENT] CHECK CONSTRAINT [CK_PaymentAmount]
GO
/****** Object:  ForeignKey [FK_MOVIE_MOVIEGENRE]    Script Date: 07/20/2015 14:53:37 ******/
ALTER TABLE [Inventory].[MOVIE]  WITH CHECK ADD  CONSTRAINT [FK_MOVIE_MOVIEGENRE] FOREIGN KEY([MOVIE_GENRE])
REFERENCES [Inventory].[MOVIEGENRE] ([GenreCode])
GO
ALTER TABLE [Inventory].[MOVIE] CHECK CONSTRAINT [FK_MOVIE_MOVIEGENRE]
GO
/****** Object:  ForeignKey [MOVIE_PRICE_CODE_FK]    Script Date: 07/20/2015 14:53:37 ******/
ALTER TABLE [Inventory].[MOVIE]  WITH CHECK ADD  CONSTRAINT [MOVIE_PRICE_CODE_FK] FOREIGN KEY([PRICE_CODE])
REFERENCES [Sales].[PRICE] ([PRICE_CODE])
GO
ALTER TABLE [Inventory].[MOVIE] CHECK CONSTRAINT [MOVIE_PRICE_CODE_FK]
GO
/****** Object:  ForeignKey [EMPTYPE_FK]    Script Date: 07/20/2015 14:53:37 ******/
ALTER TABLE [HumanResources].[EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [EMPTYPE_FK] FOREIGN KEY([Emp_TYPE])
REFERENCES [HumanResources].[EMPTYPES] ([EmpTypeID])
GO
ALTER TABLE [HumanResources].[EMPLOYEE] CHECK CONSTRAINT [EMPTYPE_FK]
GO
/****** Object:  ForeignKey [RENTAL_MEM_NUM_FK]    Script Date: 07/20/2015 14:53:37 ******/
ALTER TABLE [Rentals].[RENTAL]  WITH CHECK ADD  CONSTRAINT [RENTAL_MEM_NUM_FK] FOREIGN KEY([MEM_NUM])
REFERENCES [Rentals].[MEMBERSHIP] ([MEM_NUM])
GO
ALTER TABLE [Rentals].[RENTAL] CHECK CONSTRAINT [RENTAL_MEM_NUM_FK]
GO
/****** Object:  ForeignKey [FK_PAYMENT_MEMBERSHIP]    Script Date: 07/20/2015 14:53:37 ******/
ALTER TABLE [Rentals].[PAYMENT]  WITH CHECK ADD  CONSTRAINT [FK_PAYMENT_MEMBERSHIP] FOREIGN KEY([Mem_Num])
REFERENCES [Rentals].[MEMBERSHIP] ([MEM_NUM])
GO
ALTER TABLE [Rentals].[PAYMENT] CHECK CONSTRAINT [FK_PAYMENT_MEMBERSHIP]
GO
/****** Object:  ForeignKey [VIDEO_MOVIE_NUM_FK]    Script Date: 07/20/2015 14:53:37 ******/
ALTER TABLE [Inventory].[VIDEO]  WITH CHECK ADD  CONSTRAINT [VIDEO_MOVIE_NUM_FK] FOREIGN KEY([VID_MOVIE_NUM])
REFERENCES [Inventory].[MOVIE] ([MOVIE_NUM])
GO
ALTER TABLE [Inventory].[VIDEO] CHECK CONSTRAINT [VIDEO_MOVIE_NUM_FK]
GO
/****** Object:  ForeignKey [DETAIL_RENT_NUM_FK]    Script Date: 07/20/2015 14:53:37 ******/
ALTER TABLE [Rentals].[RENTALDETAILS]  WITH CHECK ADD  CONSTRAINT [DETAIL_RENT_NUM_FK] FOREIGN KEY([RENT_NUM])
REFERENCES [Rentals].[RENTAL] ([RENT_NUM])
GO
ALTER TABLE [Rentals].[RENTALDETAILS] CHECK CONSTRAINT [DETAIL_RENT_NUM_FK]
GO
/****** Object:  ForeignKey [DETAIL_VID_NUM_FK]    Script Date: 07/20/2015 14:53:37 ******/
ALTER TABLE [Rentals].[RENTALDETAILS]  WITH CHECK ADD  CONSTRAINT [DETAIL_VID_NUM_FK] FOREIGN KEY([VID_NUM])
REFERENCES [Inventory].[VIDEO] ([VID_NUM])
GO
ALTER TABLE [Rentals].[RENTALDETAILS] CHECK CONSTRAINT [DETAIL_VID_NUM_FK]
GO

select * from humanresources.employee
select * from humanresources.emptypes
select * from inventory.movie
select * from  inventory.MOVIEGENRE
select * from inventory.video
select * from rentals.membership
select * from rentals.MembershipCategory
select * from rentals.payment
select * from rentals.rental
select * from rentals.rentaldetails
select * from sales.price
