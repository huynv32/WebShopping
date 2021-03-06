USE [master]
GO
/****** Object:  Database [Shoping]    Script Date: 5/12/2021 2:14:36 PM ******/
CREATE DATABASE [Shoping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shoping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Shoping.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Shoping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Shoping_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Shoping] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shoping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shoping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shoping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shoping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shoping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shoping] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shoping] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Shoping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shoping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shoping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shoping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shoping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shoping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shoping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shoping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shoping] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Shoping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shoping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shoping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shoping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shoping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shoping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shoping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shoping] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Shoping] SET  MULTI_USER 
GO
ALTER DATABASE [Shoping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shoping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shoping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shoping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shoping] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shoping] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Shoping] SET QUERY_STORE = OFF
GO
USE [Shoping]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/12/2021 2:14:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoriesId] [int] IDENTITY(1,1) NOT NULL,
	[categoriesName] [nvarchar](50) NOT NULL,
	[categoriesType] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoriesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 5/12/2021 2:14:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[productid] [int] NOT NULL,
	[color1] [nvarchar](50) NULL,
	[color2] [nvarchar](50) NULL,
	[color3] [nvarchar](50) NULL,
	[color4] [nvarchar](50) NULL,
	[color5] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 5/12/2021 2:14:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NOT NULL,
	[pid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[content] [nvarchar](350) NULL,
	[like] [int] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/12/2021 2:14:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[phone] [varchar](100) NOT NULL,
	[role] [bit] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 5/12/2021 2:14:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[productId] [int] NOT NULL,
	[img1] [nvarchar](250) NULL,
	[img2] [nvarchar](250) NULL,
	[img3] [nvarchar](250) NULL,
	[img4] [nvarchar](250) NULL,
	[img5] [nvarchar](250) NULL,
	[img6] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/12/2021 2:14:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[username] [varchar](100) NOT NULL,
	[totalmoney] [money] NULL,
	[address] [nvarchar](350) NULL,
	[numberPhone] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLine]    Script Date: 5/12/2021 2:14:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLine](
	[oid] [int] NOT NULL,
	[pid] [int] NOT NULL,
	[quantity] [float] NOT NULL,
	[price] [float] NOT NULL,
	[color] [nvarchar](50) NULL,
	[size] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/12/2021 2:14:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productIdType] [nvarchar](50) NOT NULL,
	[categoriesId] [int] NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[image] [text] NOT NULL,
	[status] [bit] NOT NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 5/12/2021 2:14:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[productId] [int] NOT NULL,
	[saleId] [varchar](50) NOT NULL,
	[salePrice] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[saleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([categoriesId], [categoriesName], [categoriesType]) VALUES (1, N'Sơ Mi', N'Áo')
INSERT [dbo].[Categories] ([categoriesId], [categoriesName], [categoriesType]) VALUES (2, N'Ao Phông', N'Áo')
INSERT [dbo].[Categories] ([categoriesId], [categoriesName], [categoriesType]) VALUES (3, N'Ao Phao', N'Áo')
INSERT [dbo].[Categories] ([categoriesId], [categoriesName], [categoriesType]) VALUES (4, N'Quần Âu', N'Quần')
INSERT [dbo].[Categories] ([categoriesId], [categoriesName], [categoriesType]) VALUES (5, N'Quần Bò', N'Quần')
INSERT [dbo].[Categories] ([categoriesId], [categoriesName], [categoriesType]) VALUES (6, N'Quần Joger', N'Quần')
INSERT [dbo].[Categories] ([categoriesId], [categoriesName], [categoriesType]) VALUES (7, N'Giày Thể Thao', N'Giày')
INSERT [dbo].[Categories] ([categoriesId], [categoriesName], [categoriesType]) VALUES (8, N'Giày Da', N'Giày')
INSERT [dbo].[Categories] ([categoriesId], [categoriesName], [categoriesType]) VALUES (10, N'Giày Convert', N'Giày')
INSERT [dbo].[Categories] ([categoriesId], [categoriesName], [categoriesType]) VALUES (11, N'Ví Da', N'Phụ Kiện')
INSERT [dbo].[Categories] ([categoriesId], [categoriesName], [categoriesType]) VALUES (12, N'Thắt Lưng', N'Phụ Kiện')
INSERT [dbo].[Categories] ([categoriesId], [categoriesName], [categoriesType]) VALUES (13, N'Đồng Hồ', N'Phụ Kiện')
INSERT [dbo].[Categories] ([categoriesId], [categoriesName], [categoriesType]) VALUES (14, N'Ao Thể Thao', N'Áo')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Color] ([productid], [color1], [color2], [color3], [color4], [color5]) VALUES (1034, NULL, N'Đỏ', N'Trắng', N'Đen', NULL)
INSERT [dbo].[Color] ([productid], [color1], [color2], [color3], [color4], [color5]) VALUES (27, N'Xanh', NULL, NULL, N'Đen', N'Xám')
INSERT [dbo].[Color] ([productid], [color1], [color2], [color3], [color4], [color5]) VALUES (28, N'xanh', N'Đỏ', N'Trắng', N'Đen', N'Xám')
INSERT [dbo].[Color] ([productid], [color1], [color2], [color3], [color4], [color5]) VALUES (29, N'xanh', N'Đỏ', N'Trắng', N'Đen', N'Xám')
INSERT [dbo].[Color] ([productid], [color1], [color2], [color3], [color4], [color5]) VALUES (30, N'Xanh', N'Đỏ', NULL, NULL, N'Xám')
INSERT [dbo].[Color] ([productid], [color1], [color2], [color3], [color4], [color5]) VALUES (31, N'Xanh', N'Đỏ', N'Trắng', N'Đen', N'Xám')
INSERT [dbo].[Color] ([productid], [color1], [color2], [color3], [color4], [color5]) VALUES (32, N'xanh', N'Đỏ', N'Trắng', N'Đen', N'Xám')
INSERT [dbo].[Color] ([productid], [color1], [color2], [color3], [color4], [color5]) VALUES (33, N'xanh', N'Đỏ', N'Trắng', N'Đen', N'Xám')
INSERT [dbo].[Color] ([productid], [color1], [color2], [color3], [color4], [color5]) VALUES (34, N'xanh', N'Đỏ', N'Trắng', N'Đen', N'Xám')
INSERT [dbo].[Color] ([productid], [color1], [color2], [color3], [color4], [color5]) VALUES (1035, N'xanh', N'Đỏ', N'Trắng', N'Đen', N'Xám')
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([id], [username], [pid], [date], [content], [like]) VALUES (2, N'huy', 27, CAST(N'2021-05-03' AS Date), N'sản phẩm rất đẹp', 0)
INSERT [dbo].[Comment] ([id], [username], [pid], [date], [content], [like]) VALUES (3, N'huy', 30, CAST(N'2021-05-10' AS Date), N'như lol', 0)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([userId], [username], [password], [phone], [role]) VALUES (2, N'anh', N'16082000', N'0365642632', 1)
INSERT [dbo].[Customer] ([userId], [username], [password], [phone], [role]) VALUES (4, N'huy', N'1', N'1111', 1)
INSERT [dbo].[Customer] ([userId], [username], [password], [phone], [role]) VALUES (1, N'huynv', N'03022000', N'0943189438', 1)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
INSERT [dbo].[Image] ([productId], [img1], [img2], [img3], [img4], [img5], [img6]) VALUES (1034, N'img/ao/a1.jpg', N'img/ao/a2.jpg', N'img/ao/', N'img/ao/', N'img/ao/', N'img/ao/')
INSERT [dbo].[Image] ([productId], [img1], [img2], [img3], [img4], [img5], [img6]) VALUES (1035, N'img/ao/sm2.jpg', N'img/ao/sm3.jpg', N'img/ao/sm4.jpg', N'img/ao/sm17.jpg', N'', N'')
INSERT [dbo].[Image] ([productId], [img1], [img2], [img3], [img4], [img5], [img6]) VALUES (27, N'img/ao/sm18.jpg', N'img/ao/sm19.jpg', N'img/ao/sm20.jpg', N'', N'', N'')
INSERT [dbo].[Image] ([productId], [img1], [img2], [img3], [img4], [img5], [img6]) VALUES (28, N'img/ao/h16.jpg', N'img/ao/h15.jpg', N'img/ao/h14.jpg', N'img/ao/null', N'img/ao/h16.jpg', N'img/ao/null')
INSERT [dbo].[Image] ([productId], [img1], [img2], [img3], [img4], [img5], [img6]) VALUES (29, N'img/Phukien/dh1.jpg', N'img/Phukien/dh2.jpg', N'img/Phukien/dh2.jpg', N'img/Phukien/dh6.jpg', N'img/Phukien/dh1.jpg', N'img/Phukien/dh2.jpg')
INSERT [dbo].[Image] ([productId], [img1], [img2], [img3], [img4], [img5], [img6]) VALUES (30, N'img/Phukien/dh2.jpg', N'img/Phukien/dh1.jpg', N'img/Phukien/dh6.jpg', N'img/Phukien/dv3.jpg', N'img/Phukien/dv5.jpg', NULL)
INSERT [dbo].[Image] ([productId], [img1], [img2], [img3], [img4], [img5], [img6]) VALUES (31, N'img/giay/gd13.jpg', N'img/giay/gd11.jpg', N'img/giay/gd13.jpg', N'img/giay/gd14.jpg', N'img/giay/gd14.jpg', N'img/giay/gd12.jpg')
INSERT [dbo].[Image] ([productId], [img1], [img2], [img3], [img4], [img5], [img6]) VALUES (32, N'img/giay/gd12.jpg', N'img/giay/gd11.jpg', N'img/giay/gd13.jpg', N'img/giay/gd14.jpg', N'img/giay/gd14.jpg', N'img/giay/gd12.jpg')
INSERT [dbo].[Image] ([productId], [img1], [img2], [img3], [img4], [img5], [img6]) VALUES (33, N'img/giay/dg22.jpg', N'img/giay/dg23.jpg', N'img/giay/dg24.jpg', N'img/giay/dg26.jpg', N'img/giay/dg25.jpg', N'img/giay/gd21.jpg')
INSERT [dbo].[Image] ([productId], [img1], [img2], [img3], [img4], [img5], [img6]) VALUES (34, N'img/giay/dg22.jpg', N'img/giay/dg23.jpg', N'img/giay/gd21.jpg', N'img/giay/dg24.jpg', N'img/giay/dg25.jpg', N'img/giay/dg26.jpg')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [date], [username], [totalmoney], [address], [numberPhone], [status]) VALUES (1, CAST(N'2021-05-03' AS Date), N'huy', 530000.0000, N'xã Hạ Mỗ - huyện Đan Phượng - tp Hà Nội', N'0943189438', 0)
INSERT [dbo].[Order] ([id], [date], [username], [totalmoney], [address], [numberPhone], [status]) VALUES (2, CAST(N'2021-05-03' AS Date), N'huy', 230000.0000, N'Liên Trung -Đan Phượng', N'0943189438', 0)
INSERT [dbo].[Order] ([id], [date], [username], [totalmoney], [address], [numberPhone], [status]) VALUES (3, CAST(N'2021-05-03' AS Date), N'huy', 300000.0000, N'Liên Trung -Đan Phượng', N'0943189439', 1)
INSERT [dbo].[Order] ([id], [date], [username], [totalmoney], [address], [numberPhone], [status]) VALUES (4, CAST(N'2021-05-03' AS Date), N'huy', 350000.0000, N'Liên Trung -Đan Phượng', N'0943189438', 1)
INSERT [dbo].[Order] ([id], [date], [username], [totalmoney], [address], [numberPhone], [status]) VALUES (5, CAST(N'2021-05-04' AS Date), N'huy', 580000.0000, N' hạ Mỗ -Đan Phượng', N'0943189438', 1)
INSERT [dbo].[Order] ([id], [date], [username], [totalmoney], [address], [numberPhone], [status]) VALUES (6, CAST(N'2021-05-04' AS Date), N'huy', 2400000.0000, N'Liên Trung -Đan Phượng', N'0943189438', 1)
INSERT [dbo].[Order] ([id], [date], [username], [totalmoney], [address], [numberPhone], [status]) VALUES (7, CAST(N'2021-05-10' AS Date), N'huy', 2240000.0000, N'Liên Trung -Đan Phượng', N'0943189439', 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [color], [size]) VALUES (1, 30, 1, 300000, N'Đỏ', N'm')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [color], [size]) VALUES (1, 27, 1, 230000, N'Äá»', N'm')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [color], [size]) VALUES (3, 30, 1, 300000, N'Đỏ', N's')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [color], [size]) VALUES (4, 31, 1, 350000, N'', N'm')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [color], [size]) VALUES (5, 28, 1, 280000, N'Trắng', N'm')
INSERT [dbo].[OrderLine] ([oid], [pid], [quantity], [price], [color], [size]) VALUES (7, 28, 3, 280000, N'Đỏ', N'm')
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productId], [productIdType], [categoriesId], [productName], [price], [Description], [image], [status], [quantity]) VALUES (4, N'sm3', 1, N'Sơ Mi', 300000, N'Sơ Mi ', N'img/ao/sm3.jpg', 1, 100)
INSERT [dbo].[Product] ([productId], [productIdType], [categoriesId], [productName], [price], [Description], [image], [status], [quantity]) VALUES (5, N'sm5', 1, N'Sơ mi', 280000, N'Sơ Mi ', N'img/ao/sm5.jpg', 1, 100)
INSERT [dbo].[Product] ([productId], [productIdType], [categoriesId], [productName], [price], [Description], [image], [status], [quantity]) VALUES (23, N'sm6', 1, N'Sơ mi Nam', 300000, N'Hàng chính hãng', N'img/ao/sm6.jpg', 1, 100)
INSERT [dbo].[Product] ([productId], [productIdType], [categoriesId], [productName], [price], [Description], [image], [status], [quantity]) VALUES (24, N'sm6', 1, N'Sơ mi nam', 300000, N'HÃ ng chÃ­nh hÃ£ng', N'img/ao/sm6.jpg', 1, 100)
INSERT [dbo].[Product] ([productId], [productIdType], [categoriesId], [productName], [price], [Description], [image], [status], [quantity]) VALUES (25, N'sm6', 1, N'Sơ mi Nam', 300000, N'HÃ ng chÃ­nh hÃ£ng', N'img/ao/sm6.jpg', 1, 100)
INSERT [dbo].[Product] ([productId], [productIdType], [categoriesId], [productName], [price], [Description], [image], [status], [quantity]) VALUES (26, N'sm10', 1, N'Sơ mi đẹp', 350000, N'Đẹp', N'img/ao/sm17.jpg', 1, 121)
INSERT [dbo].[Product] ([productId], [productIdType], [categoriesId], [productName], [price], [Description], [image], [status], [quantity]) VALUES (27, N'sm11', 1, N'Sơ mi đẹp', 230000, N'  Hàng chất', N'img/ao/sm18.jpg', 1, 23)
INSERT [dbo].[Product] ([productId], [productIdType], [categoriesId], [productName], [price], [Description], [image], [status], [quantity]) VALUES (28, N'p1', 2, N'Áo Phông có cổ', 280000, N'đẹp ', N'img/ao/h16.jpg', 1, 54)
INSERT [dbo].[Product] ([productId], [productIdType], [categoriesId], [productName], [price], [Description], [image], [status], [quantity]) VALUES (29, N'dh1', 13, N'Đồng hồ nam', 1500000, N'Đồng Hồ nhập khẩu', N'img/Phukien/dh1.jpg', 1, 121)
INSERT [dbo].[Product] ([productId], [productIdType], [categoriesId], [productName], [price], [Description], [image], [status], [quantity]) VALUES (30, N'dh2', 13, N'Đồng hồ nam', 1500001, N'    Đồng Hồ nhập khẩu đẹp đẹp', N'img/Phukien/dh2.jpg', 1, 120)
INSERT [dbo].[Product] ([productId], [productIdType], [categoriesId], [productName], [price], [Description], [image], [status], [quantity]) VALUES (31, N'gd1', 8, N'Giày da chính hãng', 600000, N'     Giày chính hãng 100 % ', N'img/giay/gd13.jpg', 1, 100)
INSERT [dbo].[Product] ([productId], [productIdType], [categoriesId], [productName], [price], [Description], [image], [status], [quantity]) VALUES (32, N'gd3', 8, N'Giày da chính hãng', 600000, N'Giày chính hãng 100 %', N'img/giay/gd12.jpg', 1, 100)
INSERT [dbo].[Product] ([productId], [productIdType], [categoriesId], [productName], [price], [Description], [image], [status], [quantity]) VALUES (33, N'gd2', 8, N'Giày da chính hãng', 700000, N'Giày 100%  da thật', N'img/giay/dg22.jpg', 1, 100)
INSERT [dbo].[Product] ([productId], [productIdType], [categoriesId], [productName], [price], [Description], [image], [status], [quantity]) VALUES (34, N'gd3', 8, N'Giày da chính hãng', 111111, N'đẹp', N'img/giay/dg22.jpg', 1, 100)
INSERT [dbo].[Product] ([productId], [productIdType], [categoriesId], [productName], [price], [Description], [image], [status], [quantity]) VALUES (1034, N'ATT35', 14, N'Áo Thể Thao', 500000, N' Áo thể thao đjep', N'img/ao/a1.jpg', 1, 100)
INSERT [dbo].[Product] ([productId], [productIdType], [categoriesId], [productName], [price], [Description], [image], [status], [quantity]) VALUES (1035, N'SM1035', 1, N'sơ mi đẹp ', 1400000, N'Sơ mi', N'img/ao/sm2.jpg', 1, 100)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Color]  WITH CHECK ADD  CONSTRAINT [FK_Color_Product] FOREIGN KEY([productid])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[Color] CHECK CONSTRAINT [FK_Color_Product]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Customer] FOREIGN KEY([username])
REFERENCES [dbo].[Customer] ([username])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Customer]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Product]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_Order] FOREIGN KEY([oid])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Order]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_Product] FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__categor__5CD6CB2B] FOREIGN KEY([categoriesId])
REFERENCES [dbo].[Categories] ([categoriesId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__categor__5CD6CB2B]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Product]
GO
USE [master]
GO
ALTER DATABASE [Shoping] SET  READ_WRITE 
GO
