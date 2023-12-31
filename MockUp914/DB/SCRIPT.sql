USE [VlGunShop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 17.10.2023 18:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[DateOfCreation] [date] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Check]    Script Date: 17.10.2023 18:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Check](
	[Id] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[IdWorker] [int] NOT NULL,
	[IdClient] [int] NOT NULL,
 CONSTRAINT [PK_Check] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 17.10.2023 18:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] NOT NULL,
	[SureName] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronimyc] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[PassportSerial] [char](4) NOT NULL,
	[PassportNumber] [char](6) NOT NULL,
	[Phone] [nvarchar](20) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientLicense]    Script Date: 17.10.2023 18:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientLicense](
	[IdClient] [int] NOT NULL,
	[IdLicense] [int] NOT NULL,
	[LicenseNum] [nvarchar](50) NULL,
	[LicenseDate] [date] NULL,
 CONSTRAINT [PK_ClientLicense] PRIMARY KEY CLUSTERED 
(
	[IdClient] ASC,
	[IdLicense] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LicenseType]    Script Date: 17.10.2023 18:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicenseType](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_LicenseType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 17.10.2023 18:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[IdLicenseType] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCheck]    Script Date: 17.10.2023 18:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCheck](
	[Id] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[CheckId] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_ProductCheck] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 17.10.2023 18:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[IdProduct] [int] NOT NULL,
	[IdType] [int] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC,
	[IdType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 17.10.2023 18:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worker]    Script Date: 17.10.2023 18:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worker](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdAccount] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PassportSerial] [char](4) NOT NULL,
	[PassportNum] [char](10) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Phone] [nvarchar](11) NOT NULL,
 CONSTRAINT [PK_Worker] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Username], [Password], [DateOfCreation], [IsAdmin]) VALUES (1, N'admin', N'admin', CAST(N'2023-09-29' AS Date), 1)
INSERT [dbo].[Account] ([Id], [Username], [Password], [DateOfCreation], [IsAdmin]) VALUES (2, N'12345', N'12345', CAST(N'2023-09-29' AS Date), 0)
INSERT [dbo].[Account] ([Id], [Username], [Password], [DateOfCreation], [IsAdmin]) VALUES (3, N'Cashier', N'Cashier', CAST(N'2023-09-29' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (1, CAST(N'2023-09-29' AS Date), 2, 47)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (2, CAST(N'2023-10-02' AS Date), 2, 50)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (3, CAST(N'2023-10-03' AS Date), 2, 26)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (4, CAST(N'2023-10-09' AS Date), 2, 16)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (5, CAST(N'2023-10-13' AS Date), 3, 16)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (6, CAST(N'2023-10-17' AS Date), 3, 19)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (7, CAST(N'2023-10-18' AS Date), 2, 0)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (8, CAST(N'2023-10-19' AS Date), 3, 16)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (9, CAST(N'2023-10-20' AS Date), 3, 46)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (10, CAST(N'2023-10-23' AS Date), 3, 32)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (11, CAST(N'2023-10-30' AS Date), 3, 32)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (12, CAST(N'2023-11-08' AS Date), 2, 24)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (13, CAST(N'2023-11-09' AS Date), 2, 4)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (14, CAST(N'2023-11-10' AS Date), 3, 42)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (15, CAST(N'2023-11-17' AS Date), 3, 18)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (16, CAST(N'2023-11-20' AS Date), 3, 26)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (17, CAST(N'2023-11-21' AS Date), 2, 32)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (18, CAST(N'2023-11-24' AS Date), 2, 0)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (19, CAST(N'2023-11-27' AS Date), 2, 27)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (20, CAST(N'2023-11-30' AS Date), 2, 12)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (21, CAST(N'2023-12-04' AS Date), 2, 24)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (22, CAST(N'2023-12-13' AS Date), 3, 36)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (23, CAST(N'2023-12-20' AS Date), 2, 0)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (24, CAST(N'2023-12-22' AS Date), 2, 8)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (25, CAST(N'2023-12-26' AS Date), 2, 24)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (26, CAST(N'2023-10-09' AS Date), 3, 18)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (27, CAST(N'2023-10-10' AS Date), 3, 43)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (28, CAST(N'2023-10-13' AS Date), 2, 12)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (29, CAST(N'2023-10-18' AS Date), 2, 7)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (30, CAST(N'2023-10-23' AS Date), 3, 5)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (31, CAST(N'2023-10-26' AS Date), 2, 44)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (32, CAST(N'2023-10-27' AS Date), 2, 29)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (33, CAST(N'2023-10-30' AS Date), 2, 7)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (34, CAST(N'2023-10-31' AS Date), 2, 50)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (35, CAST(N'2023-11-06' AS Date), 3, 6)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (36, CAST(N'2023-11-09' AS Date), 3, 19)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (37, CAST(N'2023-11-17' AS Date), 3, 39)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (38, CAST(N'2023-11-20' AS Date), 2, 7)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (39, CAST(N'2023-11-22' AS Date), 2, 11)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (40, CAST(N'2023-11-23' AS Date), 3, 31)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (41, CAST(N'2023-11-29' AS Date), 2, 17)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (42, CAST(N'2023-12-04' AS Date), 3, 43)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (43, CAST(N'2023-12-05' AS Date), 2, 43)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (44, CAST(N'2023-12-06' AS Date), 3, 9)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (45, CAST(N'2023-12-11' AS Date), 3, 45)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (46, CAST(N'2023-12-12' AS Date), 3, 49)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (47, CAST(N'2023-12-13' AS Date), 2, 14)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (48, CAST(N'2023-12-15' AS Date), 2, 32)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (49, CAST(N'2023-12-19' AS Date), 3, 41)
INSERT [dbo].[Check] ([Id], [Date], [IdWorker], [IdClient]) VALUES (50, CAST(N'2023-12-26' AS Date), 2, 38)
GO
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (0, N'Аноним', N'Аноним', N'Аноним', CAST(N'2000-01-01' AS Date), N'0000', N'000000', N'')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (1, N'Павлов', N'Даниил', N'Сергеевич', CAST(N'2023-10-03' AS Date), N'1493', N'310786', N'+7(8442)379629')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (2, N'Лукин', N'Николай', N'Никитич', CAST(N'2023-10-09' AS Date), N'2969', N'752059', N'+7(861)9886766')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (3, N'Трофимов', N'Сергей', N'Матвеевич', CAST(N'2023-10-10' AS Date), N'2076', N'253728', N'+7(383)4636179')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (4, N'Панов', N'Юрий', N'Артурович', CAST(N'2023-10-16' AS Date), N'3901', N'259125', N'+7(3435)591329')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (5, N'Демидова', N'Екатерина', N'Алексеевна', CAST(N'2023-10-20' AS Date), N'2648', N'519636', N'+7(8202)586932')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (6, N'Майоров', N'Никита', N'Антонович', CAST(N'2023-10-22' AS Date), N'4473', N'919163', N'+7(343)4767107')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (7, N'Герасимова', N'София', N'Константиновна', CAST(N'2023-10-30' AS Date), N'1618', N'936046', N'+7(3452)686574')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (8, N'Филиппова', N'Юлия', N'Александровна', CAST(N'2023-10-31' AS Date), N'5546', N'632116', N'+7(39543)45247')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (9, N'Федосеева', N'Дарина', N'Даниэльевна', CAST(N'2023-11-01' AS Date), N'6166', N'555511', N'+7(3435)890121')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (10, N'Савина', N'Алиса', N'Даниловна', CAST(N'2023-11-15' AS Date), N'2083', N'430800', N'+7(496)9737047')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (11, N'Королев', N'Тимофей', N'Денисович', CAST(N'2023-11-16' AS Date), N'1901', N'245922', N'+7(4922)351634')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (12, N'Наумова', N'Анастасия', N'Никитична', CAST(N'2023-11-19' AS Date), N'6799', N'481116', N'+7(383)2256709')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (13, N'Самсонов', N'Юрий', N'Ильич', CAST(N'2023-11-20' AS Date), N'4486', N'448957', N'+7(3522)624635')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (14, N'Кузин', N'Тимофей', N'Максимович', CAST(N'2023-11-21' AS Date), N'1056', N'126911', N'+7(8142)587995')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (15, N'Кузнецов', N'Артём', N'Леонидович', CAST(N'2023-11-25' AS Date), N'6355', N'850439', N'+7(4742)131993')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (16, N'Соколова', N'Виктория', N'Ильинична', CAST(N'2023-11-28' AS Date), N'9568', N'316389', N'+7(4212)970017')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (17, N'Смирнов', N'Глеб', N'Тимофеевич', CAST(N'2023-12-08' AS Date), N'1102', N'328007', N'+7(4732)376537')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (18, N'Сорокин', N'Богдан', N'Максимович', CAST(N'2023-12-09' AS Date), N'6758', N'175888', N'+7(8635)518963')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (19, N'Никольская', N'Вероника', N'Марковна', CAST(N'2023-12-10' AS Date), N'2471', N'686302', N'+7(4212)145011')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (20, N'Новиков', N'Михаил', N'Александрович', CAST(N'2023-12-12' AS Date), N'8792', N'711876', N'+7(3955)365209')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (21, N'Кузнецова', N'Майя', N'Максимовна', CAST(N'2023-12-13' AS Date), N'3011', N'284993', N'+7(4812)130540')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (22, N'Шмелев', N'Александр', N'Дмитриевич', CAST(N'2023-12-15' AS Date), N'7211', N'313370', N'+7(8452)341689')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (23, N'Раков', N'Данил', N'Павлович', CAST(N'2023-12-16' AS Date), N'4165', N'409837', N'+7(4812)234537')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (24, N'Щукина', N'Яна', N'Антоновна', CAST(N'2023-12-18' AS Date), N'3856', N'946764', N'+7(3435)253276')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (25, N'Широков', N'Кирилл', N'Артёмович', CAST(N'2023-12-21' AS Date), N'8335', N'715325', N'+7(843)3688007')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (26, N'Скворцов', N'Илья', N'Викторович', CAST(N'2023-09-30' AS Date), N'7003', N'541259', N'+7(3519)987338')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (27, N'Давыдов', N'Артём', N'Владиславович', CAST(N'2023-10-03' AS Date), N'1549', N'202692', N'+7(861)9257787')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (28, N'Куликов', N'Пётр', N'Тимурович', CAST(N'2023-10-04' AS Date), N'2324', N'649171', N'+7(8552)631763')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (29, N'Коротков', N'Александр', N'Иванович', CAST(N'2023-10-06' AS Date), N'7204', N'380549', N'+7(383)7285533')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (30, N'Крючкова', N'Анастасия', N'Кирилловна', CAST(N'2023-10-12' AS Date), N'2370', N'224678', N'+7(496)9461135')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (31, N'Горбунова', N'Виктория', N'Демьяновна', CAST(N'2023-10-16' AS Date), N'6693', N'602621', N'+7(8652)294062')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (32, N'Назаров', N'Владимир', N'Константинович', CAST(N'2023-10-18' AS Date), N'9995', N'885143', N'+7(8652)784964')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (33, N'Лебедев', N'Кирилл', N'Артурович', CAST(N'2023-10-22' AS Date), N'4029', N'662563', N'+7(3452)963080')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (34, N'Петрова', N'Алиса', N'Артёмовна', CAST(N'2023-10-26' AS Date), N'4437', N'755073', N'+7(861)8394815')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (35, N'Фомичева', N'Мария', N'Александровна', CAST(N'2023-10-27' AS Date), N'5248', N'504350', N'+7(861)8468844')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (36, N'Герасимов', N'Максим', N'Денисович', CAST(N'2023-10-31' AS Date), N'3913', N'131778', N'+7(3842)560274')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (37, N'Лебедев', N'Александр', N'Кириллович', CAST(N'2023-11-03' AS Date), N'8167', N'802113', N'+7(3466)927805')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (38, N'Рябов', N'Виктор', N'Артёмович', CAST(N'2023-11-04' AS Date), N'1331', N'851239', N'+7(4732)667758')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (39, N'Самойлов', N'Данила', N'Тихонович', CAST(N'2023-11-06' AS Date), N'1834', N'777596', N'+7(846)9949819')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (40, N'Сидоров', N'Иван', N'Ильич', CAST(N'2023-11-11' AS Date), N'6111', N'193616', N'+7(3522)877170')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (41, N'Михеев', N'Захар', N'Егорович', CAST(N'2023-11-23' AS Date), N'1411', N'294784', N'+7(4812)234537')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (42, N'Зимин', N'Дамир', N'Георгиевич', CAST(N'2023-11-24' AS Date), N'3311', N'225475', N'+7(3435)253276')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (43, N'Гусева', N'Варвара', N'Константиновна', CAST(N'2023-11-28' AS Date), N'2510', N'625127', N'+7(843)3688007')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (44, N'Майорова', N'Надежда', N'Викторовна', CAST(N'2023-12-20' AS Date), N'2858', N'370878', N'+7(3519)987338')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (45, N'Карташов', N'Денис', N'Антонович', CAST(N'2023-12-23' AS Date), N'1705', N'412923', N'+7(861)9257787')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (46, N'Галкина', N'Варвара', N'Кирилловна', CAST(N'2023-12-25' AS Date), N'2786', N'836160', N'+7(8552)631763')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (47, N'Серов', N'Мирон', N'Александрович', CAST(N'2023-12-27' AS Date), N'9313', N'448710', N'+7(383)7285533')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (48, N'Боброва', N'Варвара', N'Тимуровна', CAST(N'2023-12-29' AS Date), N'8500', N'725144', N'+7(4812)234537')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (49, N'Степанов', N'Лев', N'Егорович', CAST(N'2023-12-30' AS Date), N'5909', N'814083', N'+7(3435)253276')
INSERT [dbo].[Client] ([Id], [SureName], [Name], [Patronimyc], [DateOfBirth], [PassportSerial], [PassportNumber], [Phone]) VALUES (50, N'Иванов', N'Валерий', N'Егорович', CAST(N'2023-12-31' AS Date), N'4613', N'465091', N'+7(843)3688007')
GO
INSERT [dbo].[ClientLicense] ([IdClient], [IdLicense], [LicenseNum], [LicenseDate]) VALUES (1, 1, N'1', CAST(N'2023-09-29' AS Date))
INSERT [dbo].[ClientLicense] ([IdClient], [IdLicense], [LicenseNum], [LicenseDate]) VALUES (1, 2, N'1', CAST(N'2023-09-29' AS Date))
GO
INSERT [dbo].[LicenseType] ([Id], [Title], [Description]) VALUES (1, N'Всем', N'1')
INSERT [dbo].[LicenseType] ([Id], [Title], [Description]) VALUES (2, N'Спорт', N'2')
INSERT [dbo].[LicenseType] ([Id], [Title], [Description]) VALUES (3, N'Воен', N'3')
GO
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (1, N'AA12', CAST(18065.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (2, N'Модель 57', CAST(63150.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (3, N'AG87', CAST(61369.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (4, N'АК-47', CAST(58920.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (5, N'АК-74', CAST(13336.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (6, N'АК-74М', CAST(46675.00 AS Decimal(10, 2)), 1, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (7, N'AKM', CAST(93198.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (8, N'АК-12', CAST(49208.00 AS Decimal(10, 2)), 1, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (9, N'АК-15', CAST(47468.00 AS Decimal(10, 2)), 2, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (10, N'АК-19', CAST(7847.00 AS Decimal(10, 2)), 1, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (11, N'АК-101', CAST(25541.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (12, N'АК-102', CAST(74881.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (13, N'АК-103', CAST(37340.00 AS Decimal(10, 2)), 2, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (14, N'АК-104', CAST(96620.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (15, N'АК-105', CAST(42625.00 AS Decimal(10, 2)), 1, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (16, N'АК-200', CAST(49585.00 AS Decimal(10, 2)), 2, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (17, N'АК-201', CAST(25466.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (18, N'АК-202', CAST(40286.00 AS Decimal(10, 2)), 1, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (19, N'АК-203', CAST(65226.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (20, N'АК-204', CAST(13666.00 AS Decimal(10, 2)), 2, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (21, N'АК-205', CAST(71790.00 AS Decimal(10, 2)), 2, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (22, N'АК-308', CAST(65931.00 AS Decimal(10, 2)), 1, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (23, N'АКС-74У', CAST(89996.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (24, N'АК-55', CAST(57827.00 AS Decimal(10, 2)), 1, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (25, N'АКВ-521', CAST(82400.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (26, N'A-180', CAST(27374.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (27, N'AR-10', CAST(47087.00 AS Decimal(10, 2)), 1, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (28, N'AR-15', CAST(68353.00 AS Decimal(10, 2)), 2, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (29, N'AR-13', CAST(36289.00 AS Decimal(10, 2)), 2, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (30, N'КАК ВАЛ', CAST(40270.00 AS Decimal(10, 2)), 1, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (31, N'AR-18', CAST(36973.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (32, N'AR-100', CAST(47251.00 AS Decimal(10, 2)), 1, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (33, N'AN-94', CAST(13941.00 AS Decimal(10, 2)), 2, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (34, N'Daewoo', CAST(14281.00 AS Decimal(10, 2)), 1, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (35, N'Fabarm FP6 ', CAST(56010.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (36, N'MP1', CAST(68957.00 AS Decimal(10, 2)), 2, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (37, N'MP2', CAST(25017.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (38, N'MP3', CAST(55655.00 AS Decimal(10, 2)), 1, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (39, N'MP4', CAST(44757.00 AS Decimal(10, 2)), 2, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (40, N'MP5', CAST(43954.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (41, N'MP6', CAST(16621.00 AS Decimal(10, 2)), 1, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (42, N'MP7', CAST(40854.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (43, N'MP8', CAST(44089.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (44, N'MP9', CAST(4431.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (45, N'MP10', CAST(61117.00 AS Decimal(10, 2)), 1, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (46, N'MP11', CAST(66872.00 AS Decimal(10, 2)), 2, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (47, N'MP12', CAST(97851.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (48, N'MP13', CAST(31221.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (49, N'MP14', CAST(72166.00 AS Decimal(10, 2)), 3, N'')
INSERT [dbo].[Product] ([Id], [Title], [Cost], [IdLicenseType], [PhotoPath]) VALUES (50, N'MP15', CAST(59419.00 AS Decimal(10, 2)), 1, N'')
GO
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (1, 28, 16, 18)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (2, 20, 46, 55)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (3, 35, 11, 66)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (4, 21, 22, 63)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (5, 48, 46, 48)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (6, 5, 14, 25)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (7, 1, 12, 35)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (8, 4, 23, 10)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (9, 47, 4, 23)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (10, 44, 49, 72)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (11, 28, 3, 37)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (12, 14, 17, 75)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (13, 30, 21, 44)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (14, 7, 50, 24)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (15, 41, 44, 5)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (16, 23, 22, 2)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (17, 6, 15, 61)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (18, 30, 40, 27)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (19, 22, 37, 66)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (20, 10, 30, 63)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (21, 10, 12, 31)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (22, 50, 34, 97)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (23, 24, 25, 5)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (24, 23, 19, 65)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (25, 3, 3, 5)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (26, 17, 43, 56)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (27, 2, 12, 9)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (28, 47, 9, 61)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (29, 11, 5, 25)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (30, 6, 36, 69)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (31, 33, 16, 30)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (32, 3, 12, 13)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (33, 30, 18, 83)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (34, 1, 39, 55)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (35, 40, 39, 46)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (36, 43, 15, 39)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (37, 24, 4, 46)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (38, 31, 1, 89)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (39, 26, 33, 95)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (40, 21, 38, 51)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (41, 24, 24, 29)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (42, 27, 1, 60)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (43, 47, 20, 80)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (44, 36, 12, 49)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (45, 3, 10, 68)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (46, 2, 29, 97)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (47, 20, 32, 89)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (48, 15, 18, 92)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (49, 46, 41, 90)
INSERT [dbo].[ProductCheck] ([Id], [ProductId], [CheckId], [Quantity]) VALUES (50, 23, 33, 78)
GO
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (1, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (2, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (3, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (4, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (5, 2)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (6, 2)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (7, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (8, 2)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (9, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (10, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (11, 1)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (12, 2)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (13, 1)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (14, 1)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (15, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (16, 2)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (17, 2)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (18, 1)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (19, 1)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (20, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (21, 1)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (22, 1)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (23, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (24, 2)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (25, 2)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (26, 2)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (27, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (28, 1)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (29, 2)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (30, 2)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (31, 2)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (32, 2)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (33, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (34, 2)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (35, 2)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (36, 1)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (37, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (38, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (39, 2)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (40, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (41, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (42, 1)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (43, 2)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (44, 1)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (45, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (46, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (47, 3)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (48, 1)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (49, 1)
INSERT [dbo].[ProductType] ([IdProduct], [IdType]) VALUES (50, 1)
GO
INSERT [dbo].[Type] ([Id], [Title], [Description]) VALUES (1, N'Аммуниция', NULL)
INSERT [dbo].[Type] ([Id], [Title], [Description]) VALUES (2, N'Оружие', NULL)
INSERT [dbo].[Type] ([Id], [Title], [Description]) VALUES (3, N'Другое', NULL)
GO
SET IDENTITY_INSERT [dbo].[Worker] ON 

INSERT [dbo].[Worker] ([Id], [IdAccount], [FirstName], [LastName], [PassportSerial], [PassportNum], [DateOfBirth], [Phone]) VALUES (1, 1, N'Иванов', N'Иван', N'1234', N'567891    ', CAST(N'2023-09-28' AS Date), N'7366455454')
INSERT [dbo].[Worker] ([Id], [IdAccount], [FirstName], [LastName], [PassportSerial], [PassportNum], [DateOfBirth], [Phone]) VALUES (2, 2, N'Сергей', N'Сергеевич', N'1234', N'567891    ', CAST(N'2023-09-29' AS Date), N'123456789')
INSERT [dbo].[Worker] ([Id], [IdAccount], [FirstName], [LastName], [PassportSerial], [PassportNum], [DateOfBirth], [Phone]) VALUES (3, 3, N'Касса', N'Кассова', N'1234', N'5678910   ', CAST(N'2004-05-06' AS Date), N'123456789')
SET IDENTITY_INSERT [dbo].[Worker] OFF
GO
ALTER TABLE [dbo].[Check]  WITH CHECK ADD  CONSTRAINT [FK_Check_Client] FOREIGN KEY([IdClient])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Check] CHECK CONSTRAINT [FK_Check_Client]
GO
ALTER TABLE [dbo].[Check]  WITH CHECK ADD  CONSTRAINT [FK_Check_Worker] FOREIGN KEY([IdWorker])
REFERENCES [dbo].[Worker] ([Id])
GO
ALTER TABLE [dbo].[Check] CHECK CONSTRAINT [FK_Check_Worker]
GO
ALTER TABLE [dbo].[ClientLicense]  WITH CHECK ADD  CONSTRAINT [FK_ClientLicense_Client] FOREIGN KEY([IdClient])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[ClientLicense] CHECK CONSTRAINT [FK_ClientLicense_Client]
GO
ALTER TABLE [dbo].[ClientLicense]  WITH CHECK ADD  CONSTRAINT [FK_ClientLicense_LicenseType] FOREIGN KEY([IdLicense])
REFERENCES [dbo].[LicenseType] ([Id])
GO
ALTER TABLE [dbo].[ClientLicense] CHECK CONSTRAINT [FK_ClientLicense_LicenseType]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_LicenseType] FOREIGN KEY([IdLicenseType])
REFERENCES [dbo].[LicenseType] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_LicenseType]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_LicenseType1] FOREIGN KEY([IdLicenseType])
REFERENCES [dbo].[LicenseType] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_LicenseType1]
GO
ALTER TABLE [dbo].[ProductCheck]  WITH CHECK ADD  CONSTRAINT [FK_ProductCheck_Check] FOREIGN KEY([CheckId])
REFERENCES [dbo].[Check] ([Id])
GO
ALTER TABLE [dbo].[ProductCheck] CHECK CONSTRAINT [FK_ProductCheck_Check]
GO
ALTER TABLE [dbo].[ProductCheck]  WITH CHECK ADD  CONSTRAINT [FK_ProductCheck_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductCheck] CHECK CONSTRAINT [FK_ProductCheck_Product]
GO
ALTER TABLE [dbo].[ProductType]  WITH CHECK ADD  CONSTRAINT [FK_ProductType_Product] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [FK_ProductType_Product]
GO
ALTER TABLE [dbo].[ProductType]  WITH CHECK ADD  CONSTRAINT [FK_ProductType_Type] FOREIGN KEY([IdType])
REFERENCES [dbo].[Type] ([Id])
GO
ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [FK_ProductType_Type]
GO
ALTER TABLE [dbo].[Worker]  WITH CHECK ADD  CONSTRAINT [FK_Worker_Account] FOREIGN KEY([IdAccount])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Worker] CHECK CONSTRAINT [FK_Worker_Account]
GO
