USE [master]
GO
/****** Object:  Database [WEB]    Script Date: 1/13/2021 2:26:00 PM ******/
CREATE DATABASE [WEB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WEB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WEB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WEB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WEB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WEB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WEB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WEB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WEB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WEB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WEB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WEB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WEB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WEB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WEB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WEB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WEB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WEB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WEB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WEB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WEB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WEB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WEB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WEB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WEB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WEB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WEB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WEB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WEB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WEB] SET RECOVERY FULL 
GO
ALTER DATABASE [WEB] SET  MULTI_USER 
GO
ALTER DATABASE [WEB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WEB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WEB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WEB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WEB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WEB', N'ON'
GO
USE [WEB]
GO
/****** Object:  Table [dbo].[CTHoaDon]    Script Date: 1/13/2021 2:26:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHoaDon](
	[MaCTHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaHoaDon] [int] NULL,
	[MaHangHoa] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_CTHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaCTHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 1/13/2021 2:26:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[MaHangHoa] [nvarchar](50) NOT NULL,
	[TenHangHoa] [nvarchar](50) NULL,
	[DonGia] [int] NULL,
	[Anh] [nvarchar](500) NULL,
	[GiamGia] [int] NULL,
	[MaLoai] [nvarchar](50) NULL,
	[TinhTrang] [bit] NULL,
 CONSTRAINT [PK_HangHoa_1] PRIMARY KEY CLUSTERED 
(
	[MaHangHoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 1/13/2021 2:26:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[NgayBan] [date] NULL,
	[IDUser] [nvarchar](50) NULL,
	[TinhTrang] [bit] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 1/13/2021 2:26:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaLoai] [nvarchar](50) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/13/2021 2:26:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IDUser] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Type] [bit] NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CTHoaDon] ON 

INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (19, 11, N'50', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (26, 12, N'50', 2)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (27, 12, N'5', 2)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (28, 12, N'2', 2)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (30, 11, N'2', 11)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (88, 41, N'2', 2)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (90, 41, N'3', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (97, 11, N'4', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (99, 11, N'5', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (101, 11, N'7', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (157, 80, N'2', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (204, 89, N'2', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (205, 89, N'3', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (206, 89, N'4', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (207, 89, N'5', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (208, 89, N'50', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (209, 89, N'6', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (210, 89, N'7', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (211, 89, N'DMC1', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (212, 89, N'DMC2', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (213, 89, N'DMC3', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (217, 91, N'2', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (218, 92, N'2', 2)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (233, 102, N'2', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (237, 104, N'6', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (238, 104, N'FC3', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (239, 104, N'DMC2', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (302, 115, N'3', 3)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (304, 115, N'2', 2)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (307, 117, N'2', 2)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (308, 117, N'3', 1)
INSERT [dbo].[CTHoaDon] ([MaCTHoaDon], [MaHoaDon], [MaHangHoa], [SoLuong]) VALUES (309, 117, N'4', 1)
SET IDENTITY_INSERT [dbo].[CTHoaDon] OFF
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'2', N'Don''t Starve Together', 150100, N'dontstarve.png', 0, N'AD                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'3', N'Rise of the Tomb Raider™', 357000, N'rottr.png', 50000, N'AD                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'4', N'Garry''s Mod', 31000, N'garrymod.png', 1000, N'SI                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'5', N'Total War: THREE KINGDOMS', 878000, N'totalwar.png', 390000, N'ST', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'50', N'How to collect coin ???', 1000000, N'coin.png', 10000, N'SI', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'6', N'Cyberpunk 2077', 988000, N'cyperpunk.jpg', 10000, N'AD                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'7', N'COD : Black Ops Cold War', 1400000, N'codbo3.png', 400000, N'ST                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'DMC1', N'Devil May Cry 1', 75000, N'dmc1.png', 50000, N'ST                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'DMC2', N'Devil May Cry 2', 276000, N'dmc2.png', 0, N'ST                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'DMC3', N'Devil May Cry 3', 276000, N'dmc3.png', 0, N'ST                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'DMC4', N'Devil May Cry 4', 276000, N'dmc4.png', 0, N'ST                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'DMC5', N'Devil May Cry 5', 337000, N'dmc5.png', 0, N'ST                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'DS1', N'Dark Souls: REMASTERED', 850000, N'ds.png', 400000, N'GD                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'DS2', N'Dark Souls 2', 650000, N'ds2.png', 200000, N'GD                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'DS3', N'Dark Souls 3', 970000, N'ds3.png', 0, N'GD                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'FC3', N'Far Cry 3', 330000, N'farcry3..png', 100000, N'AD                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'FC4', N'Far Cry 4', 495000, N'farcry4.png', 0, N'AD                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'FC5', N'Far Cry 5', 990000, N'farcry5.png', 0, N'AD                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'FFXV', N'Final Fantasy XV', 1135000, N'ffxv.png', 400000, N'ST                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'FG', N'Fall Guys: Ultimate Knockout', 188000, N'fg.png', 0, N'GD                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'PUBG', N'PlayerUnknown''s Battlegrounds', 340000, N'pubg.png', 40000, N'AD                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'SR3', N'Saints Row 3', 120000, N'sr3.png', 30000, N'AD                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'SR4', N'Saints Row 4', 135000, N'sr4.png', 20000, N'AD                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'SRGOOH', N'Saints Row GAT OUT OF HELL', 165000, N'srgooh.png', 0, N'AD                                                ', 1)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'UK1', N'Unknown', 1000, N'unknown.png', 0, N'AD                                                ', 0)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'UK2', N'Unknown', 1000, N'unknown.png', 0, N'AD                                                ', 0)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'UK3', N'Unknown', 1000, N'unknown.png', 0, N'AD                                                ', 0)
INSERT [dbo].[HangHoa] ([MaHangHoa], [TenHangHoa], [DonGia], [Anh], [GiamGia], [MaLoai], [TinhTrang]) VALUES (N'UK4', N'Unknown', 1000, N'unknown.png', 0, N'AD                                                ', 0)
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayBan], [IDUser], [TinhTrang]) VALUES (11, CAST(N'2021-01-11' AS Date), N'5', 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayBan], [IDUser], [TinhTrang]) VALUES (12, CAST(N'2021-01-11' AS Date), N'5', 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayBan], [IDUser], [TinhTrang]) VALUES (41, CAST(N'2021-01-11' AS Date), N'8', 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayBan], [IDUser], [TinhTrang]) VALUES (80, CAST(N'2021-01-11' AS Date), N'8', 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayBan], [IDUser], [TinhTrang]) VALUES (89, CAST(N'2021-01-11' AS Date), N'8', 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayBan], [IDUser], [TinhTrang]) VALUES (91, CAST(N'2021-01-11' AS Date), N'7', 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayBan], [IDUser], [TinhTrang]) VALUES (92, CAST(N'2021-01-11' AS Date), N'7', 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayBan], [IDUser], [TinhTrang]) VALUES (102, CAST(N'2021-01-06' AS Date), N'7', 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayBan], [IDUser], [TinhTrang]) VALUES (104, CAST(N'2021-01-12' AS Date), N'7', 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayBan], [IDUser], [TinhTrang]) VALUES (115, CAST(N'2021-01-13' AS Date), N'7', 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayBan], [IDUser], [TinhTrang]) VALUES (117, CAST(N'2021-01-13' AS Date), N'7', 0)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'AD                                                ', N'Adventure')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'GD                                                ', N'GOD')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'SI                                                ', N'Simulation')
INSERT [dbo].[TheLoai] ([MaLoai], [TenLoai]) VALUES (N'ST                                                ', N'Strategy')
INSERT [dbo].[Users] ([IDUser], [Password], [UserName], [Type], [Email]) VALUES (N'1', N'admin', N'admin', 1, N'assistme026@gmail.com')
INSERT [dbo].[Users] ([IDUser], [Password], [UserName], [Type], [Email]) VALUES (N'10', N'10', N'10', 0, N'10@gmail.com')
INSERT [dbo].[Users] ([IDUser], [Password], [UserName], [Type], [Email]) VALUES (N'11', N'HoaNoKhongMau11', N'11', 0, N'assistme026@gmail.com')
INSERT [dbo].[Users] ([IDUser], [Password], [UserName], [Type], [Email]) VALUES (N'3', N'1DongMauNong', N'1', 0, N'assistme026@gmail.com')
INSERT [dbo].[Users] ([IDUser], [Password], [UserName], [Type], [Email]) VALUES (N'4', N'2CAYCAT', N'2', 0, N'assistme026@gmail.com')
INSERT [dbo].[Users] ([IDUser], [Password], [UserName], [Type], [Email]) VALUES (N'5', N'505', N'1555', 0, N'assistme026@gmail.com')
INSERT [dbo].[Users] ([IDUser], [Password], [UserName], [Type], [Email]) VALUES (N'6', N'6', N'6', 0, N'assistme026@gmail.com')
INSERT [dbo].[Users] ([IDUser], [Password], [UserName], [Type], [Email]) VALUES (N'7', N'7', N'7', 0, N'assistme026@gmail.com')
INSERT [dbo].[Users] ([IDUser], [Password], [UserName], [Type], [Email]) VALUES (N'8', N'888888', N'888888', 0, N'assistme026@gmail.com')
INSERT [dbo].[Users] ([IDUser], [Password], [UserName], [Type], [Email]) VALUES (N'9', N'9', N'888888', 0, N'assistme026@gmail.com')
INSERT [dbo].[Users] ([IDUser], [Password], [UserName], [Type], [Email]) VALUES (N'j', N'j', N'j', 0, N'j@gmail')
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CTHoaDon_HangHoa1] FOREIGN KEY([MaHangHoa])
REFERENCES [dbo].[HangHoa] ([MaHangHoa])
GO
ALTER TABLE [dbo].[CTHoaDon] CHECK CONSTRAINT [FK_CTHoaDon_HangHoa1]
GO
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CTHoaDon_HoaDon1] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[CTHoaDon] CHECK CONSTRAINT [FK_CTHoaDon_HoaDon1]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_TheLoai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[TheLoai] ([MaLoai])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_TheLoai]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Users] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Users] ([IDUser])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_Users]
GO
USE [master]
GO
ALTER DATABASE [WEB] SET  READ_WRITE 
GO
