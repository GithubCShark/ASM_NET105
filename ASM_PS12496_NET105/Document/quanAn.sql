USE [ASM_C5]
GO
ALTER TABLE [dbo].[Donhangs] DROP CONSTRAINT [FK_Donhangs_Khachhangs_KhachhangID]
GO
ALTER TABLE [dbo].[DonhangChitiets] DROP CONSTRAINT [FK_DonhangChitiets_MonAns_MonAnID]
GO
ALTER TABLE [dbo].[DonhangChitiets] DROP CONSTRAINT [FK_DonhangChitiets_Donhangs_DonhangID]
GO
/****** Object:  Table [dbo].[Nguoidungs]    Script Date: 6/7/2021 03:01:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nguoidungs]') AND type in (N'U'))
DROP TABLE [dbo].[Nguoidungs]
GO
/****** Object:  Table [dbo].[MonAns]    Script Date: 6/7/2021 03:01:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MonAns]') AND type in (N'U'))
DROP TABLE [dbo].[MonAns]
GO
/****** Object:  Table [dbo].[Khachhangs]    Script Date: 6/7/2021 03:01:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Khachhangs]') AND type in (N'U'))
DROP TABLE [dbo].[Khachhangs]
GO
/****** Object:  Table [dbo].[Donhangs]    Script Date: 6/7/2021 03:01:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Donhangs]') AND type in (N'U'))
DROP TABLE [dbo].[Donhangs]
GO
/****** Object:  Table [dbo].[DonhangChitiets]    Script Date: 6/7/2021 03:01:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DonhangChitiets]') AND type in (N'U'))
DROP TABLE [dbo].[DonhangChitiets]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/7/2021 03:01:05 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__EFMigrationsHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__EFMigrationsHistory]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/7/2021 03:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonhangChitiets]    Script Date: 6/7/2021 03:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonhangChitiets](
	[ChitietID] [int] IDENTITY(1,1) NOT NULL,
	[DonhangID] [int] NOT NULL,
	[MonAnID] [int] NOT NULL,
	[Soluong] [int] NOT NULL,
	[Thanhtien] [float] NOT NULL,
	[Ghichu] [nvarchar](250) NULL,
 CONSTRAINT [PK_DonhangChitiets] PRIMARY KEY CLUSTERED 
(
	[ChitietID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donhangs]    Script Date: 6/7/2021 03:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donhangs](
	[DonhangID] [int] IDENTITY(1,1) NOT NULL,
	[KhachhangID] [int] NOT NULL,
	[Ngaydat] [datetime2](7) NOT NULL,
	[Tongtien] [float] NOT NULL,
	[TrangthaiDonhang] [int] NOT NULL,
	[Ghichu] [nvarchar](250) NULL,
 CONSTRAINT [PK_Donhangs] PRIMARY KEY CLUSTERED 
(
	[DonhangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khachhangs]    Script Date: 6/7/2021 03:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khachhangs](
	[KhachhangID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[Ngaysinh] [datetime2](7) NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[ConfirmPassword] [varchar](50) NOT NULL,
	[Mota] [nvarchar](250) NULL,
 CONSTRAINT [PK_Khachhangs] PRIMARY KEY CLUSTERED 
(
	[KhachhangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonAns]    Script Date: 6/7/2021 03:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonAns](
	[MonAnID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Gia] [float] NOT NULL,
	[Phanloai] [int] NOT NULL,
	[Hinh] [nvarchar](100) NULL,
	[Mota] [nvarchar](250) NULL,
	[Trangthai] [bit] NOT NULL,
 CONSTRAINT [PK_MonAns] PRIMARY KEY CLUSTERED 
(
	[MonAnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nguoidungs]    Script Date: 6/7/2021 03:01:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nguoidungs](
	[NguoidungID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[DOB] [datetime2](7) NULL,
	[Admin] [bit] NOT NULL,
	[Locked] [bit] NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[ConfirmPassword] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Nguoidungs] PRIMARY KEY CLUSTERED 
(
	[NguoidungID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210604212500_DbMonAn', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210606024307_DbNguoidung', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210606195434_ElseDB', N'3.1.10')
GO
SET IDENTITY_INSERT [dbo].[MonAns] ON 

INSERT [dbo].[MonAns] ([MonAnID], [Name], [Gia], [Phanloai], [Hinh], [Mota], [Trangthai]) VALUES (1, N'Big Star Burger Combo', 86000, 2, N'combo_burger_big_star_update.jpg', NULL, 1)
INSERT [dbo].[MonAns] ([MonAnID], [Name], [Gia], [Phanloai], [Hinh], [Mota], [Trangthai]) VALUES (2, N'Combo Burger Tôm (Shrimp Burger Combo)', 77000, 2, N'combo_burger_tom_update.jpg', NULL, 1)
INSERT [dbo].[MonAns] ([MonAnID], [Name], [Gia], [Phanloai], [Hinh], [Mota], [Trangthai]) VALUES (3, N'Bulgogi Burger Combo', 74000, 2, N'combo_burger_bulgogi_update.jpg', NULL, 0)
INSERT [dbo].[MonAns] ([MonAnID], [Name], [Gia], [Phanloai], [Hinh], [Mota], [Trangthai]) VALUES (4, N'Combo Burger Bò Trứng (Beef Egg Burger Combo)', 74000, 2, N'combo_burger_bo_trung_update.jpg', NULL, 1)
INSERT [dbo].[MonAns] ([MonAnID], [Name], [Gia], [Phanloai], [Hinh], [Mota], [Trangthai]) VALUES (5, N'Combo Burger Gà Thượng Hạng (Premium Chicken Combo)', 74000, 2, N'combo_premium-chicken_4.png', NULL, 1)
INSERT [dbo].[MonAns] ([MonAnID], [Name], [Gia], [Phanloai], [Hinh], [Mota], [Trangthai]) VALUES (6, N'Combo Burger Cá (Fish Burger Combo)', 64000, 2, N'combo_burger_ca_update.jpg', NULL, 1)
INSERT [dbo].[MonAns] ([MonAnID], [Name], [Gia], [Phanloai], [Hinh], [Mota], [Trangthai]) VALUES (7, N'Combo Burger Phô Mai (Cheese Burger Combo)', 64000, 2, N'combo_burger_pho_mai_update.jpg', NULL, 1)
INSERT [dbo].[MonAns] ([MonAnID], [Name], [Gia], [Phanloai], [Hinh], [Mota], [Trangthai]) VALUES (8, N'Combo Burger Bò Teriyaki (Teriyaki Burger Combo)', 61000, 2, N'combo_burger_b_teriyaki_update.jpg', NULL, 1)
SET IDENTITY_INSERT [dbo].[MonAns] OFF
GO
SET IDENTITY_INSERT [dbo].[Nguoidungs] ON 

INSERT [dbo].[Nguoidungs] ([NguoidungID], [UserName], [FullName], [Email], [Title], [DOB], [Admin], [Locked], [Password], [ConfirmPassword]) VALUES (1, N'phuongdung', N'Lâm Phương Dung', N'chinhchu@gmail.com', N'Quản lý', CAST(N'2021-06-03T23:30:00.0000000' AS DateTime2), 1, 1, N'C4CA4238A0B923820DCC509A6F75849B', N'1')
SET IDENTITY_INSERT [dbo].[Nguoidungs] OFF
GO
ALTER TABLE [dbo].[DonhangChitiets]  WITH CHECK ADD  CONSTRAINT [FK_DonhangChitiets_Donhangs_DonhangID] FOREIGN KEY([DonhangID])
REFERENCES [dbo].[Donhangs] ([DonhangID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DonhangChitiets] CHECK CONSTRAINT [FK_DonhangChitiets_Donhangs_DonhangID]
GO
ALTER TABLE [dbo].[DonhangChitiets]  WITH CHECK ADD  CONSTRAINT [FK_DonhangChitiets_MonAns_MonAnID] FOREIGN KEY([MonAnID])
REFERENCES [dbo].[MonAns] ([MonAnID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DonhangChitiets] CHECK CONSTRAINT [FK_DonhangChitiets_MonAns_MonAnID]
GO
ALTER TABLE [dbo].[Donhangs]  WITH CHECK ADD  CONSTRAINT [FK_Donhangs_Khachhangs_KhachhangID] FOREIGN KEY([KhachhangID])
REFERENCES [dbo].[Khachhangs] ([KhachhangID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Donhangs] CHECK CONSTRAINT [FK_Donhangs_Khachhangs_KhachhangID]
GO
