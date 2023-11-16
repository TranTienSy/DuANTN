USE drop database [J6StoreVC]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 11/16/2023 10:10:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Token] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 11/16/2023 10:10:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TINH] [nvarchar](100) NULL,
	[HUYEN] [nvarchar](100) NULL,
	[XA] [nvarchar](100) NULL,
	[CHITIET] [nvarchar](100) NULL,
	[IDAccounts] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 11/16/2023 10:10:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/16/2023 10:10:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Note] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/16/2023 10:10:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Quality] [int] NULL,
	[Size] [nvarchar](50) NULL,
	[color] [nvarchar](50) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/16/2023 10:10:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [varchar](30) NULL,
	[Tinh] [nvarchar](100) NULL,
	[Huyen] [nvarchar](100) NULL,
	[Xa] [nvarchar](100) NULL,
	[chitiet] [nvarchar](100) NULL,
	[Phone] [varchar](30) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/16/2023 10:10:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [char](4) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productvariants]    Script Date: 11/16/2023 10:10:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productvariants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Productid] [int] NOT NULL,
	[Color] [nvarchar](20) NOT NULL,
	[Size] [nvarchar](20) NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/16/2023 10:10:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 11/16/2023 10:10:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[email] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[marks] [float] NOT NULL,
	[gender] [bit] NOT NULL,
	[country] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'admin', N'12345', N'DTAA', N'anh7112002@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'anhtien', N'123', N'DTA', N'tienanhlv5@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'sunshet', N'123', N'sunshet', N'sunshet06@gmail.com', N'user.png', N'token')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'sy', N'123', N'Sỹ', N'trantiensy21112003@gmail.com', N'user.png', N'j8NAKa950pa2i3llHhBE4LlTUbA4bbXZm5Q1OxxIhe2M2MJC24')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Token]) VALUES (N'tienanh', N'1234', N'TIenanh', N'tienanhlv5@gmail.com', N'user.png', N'token')
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([ID], [TINH], [HUYEN], [XA], [CHITIET], [IDAccounts]) VALUES (3, N'Điện Biên', N'Huyện Mường Ảng', N'Xã Nặm Lịch', N'sssssss', N'SY')
INSERT [dbo].[Address] ([ID], [TINH], [HUYEN], [XA], [CHITIET], [IDAccounts]) VALUES (4, N'Bình Thuận', N'Huyện Hàm Thuận Bắc', N'Xã Hàm Đức', N'dâdadadad', N'SY')
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (98, N'admin', N'DIRE')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (101, N'admin', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (114, N'sunshet', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (118, N'sunshet', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (119, N'sunshet', N'DIRE')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (136, N'admin', N'CUST')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
INSERT [dbo].[Categories] ([Id], [Name], [Note], [Description]) VALUES (N'001 ', N'Áo', N'Áo', N'Áo')
INSERT [dbo].[Categories] ([Id], [Name], [Note], [Description]) VALUES (N'002 ', N'Quần', N'Quần', N'Quần')
INSERT [dbo].[Categories] ([Id], [Name], [Note], [Description]) VALUES (N'003 ', N'Áo khoác', N'Áo khoác', N'Áo khoác')
INSERT [dbo].[Categories] ([Id], [Name], [Note], [Description]) VALUES (N'004 ', N'Phụ kiện', N'Phụ kiện', N'Phụ kiện')
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212558, 121265, 1110, 45.5, 1, NULL, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212560, 121266, 1110, 45.5, 2, NULL, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212561, 121267, 1110, 45.5, 1, NULL, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212562, 121268, 1110, 45.5, 1, NULL, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212564, 121269, 1110, 45.5, 1, NULL, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212566, 121270, 1110, 45.5, 1, NULL, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212578, 121278, 1110, 45.5, 2, NULL, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212579, 121280, 1110, 45.5, 3, NULL, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212580, 121281, 1110, 45.5, 1, NULL, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212581, 121282, 1115, 50, 1, 1331313, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212582, 121282, 1110, 45.5, 1, 34234123, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212583, 121284, 1110, 45.5, 1, 34234123, N'M', N'Đỏ')
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212584, 121284, 1115, 50, 1, 1331313, N'L', N'Đỏ')
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212585, 121285, 1110, 45.5, 2, 34234123, N'L', N'Đen')
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212586, 121285, 1115, 50, 1, 1331313, N'L', N'Đen')
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212587, 121286, 1110, 45.5, 1, 34234123, N'XS', N'Xanh')
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212588, 121287, 1110, 45.5, 1, 34234123, N'XS', N'Xanh')
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212589, 121288, 1110, 45.5, 1, 34234123, N'M', N'Đỏ')
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212590, 121288, 1110, 45.5, 1, 34234123, N'XS', N'Xanh')
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212591, 121291, 1110, 45.5, 1, 34234123, N'XS', N'Xanh')
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212592, 121292, 1110, 45.5, 1, 34234123, N'XS', N'Xanh')
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212593, 121293, 1110, 45.5, 2, 34234123, N'XS', N'Xanh')
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Quality], [Size], [color]) VALUES (212594, 121294, 1110, 45.5, 1, 34234123, N'XS', N'Xanh')
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121265, N'admin', CAST(N'2023-11-12T10:00:00.000' AS DateTime), N'DANGXULY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121266, N'admin', CAST(N'2023-11-12T14:36:38.837' AS DateTime), N'CHOXULY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121267, N'admin', CAST(N'2023-11-12T15:58:33.043' AS DateTime), N'CHOXULY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121268, N'admin', CAST(N'2023-11-12T15:59:05.610' AS DateTime), N'CHOXULY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121269, N'admin', CAST(N'2023-11-12T16:18:30.783' AS DateTime), N'CHOXULY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121270, N'admin', CAST(N'2023-11-12T16:28:41.507' AS DateTime), N'CHOXULY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121271, N'admin', CAST(N'2023-11-12T16:29:14.443' AS DateTime), N'CHOXULY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121275, N'admin', CAST(N'2023-11-13T14:23:13.953' AS DateTime), N'CHOXULY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121278, N'admin', CAST(N'2023-11-15T21:40:15.367' AS DateTime), N'CHOXULY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121280, N'sy', CAST(N'2023-11-15T22:40:37.150' AS DateTime), N'CHOXULY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121281, N'sy', CAST(N'2023-11-15T22:43:35.200' AS DateTime), N'CHOXULY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121282, N'sy', CAST(N'2023-11-16T18:54:58.507' AS DateTime), N'CHOXULY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121283, N'sy', CAST(N'2023-11-16T19:04:32.750' AS DateTime), N'CHOXULY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121284, N'sy', CAST(N'2023-11-16T19:09:03.073' AS DateTime), N'CHOXULY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121285, N'sy', CAST(N'2023-11-16T19:14:30.617' AS DateTime), N'CHOXULY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121286, N'sy', CAST(N'2023-11-16T19:31:18.077' AS DateTime), N'CHOXULY', NULL, N'', N'', N'', N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121287, N'sy', CAST(N'2023-11-16T19:32:37.530' AS DateTime), N'CHOXULY', NULL, N'', N'', N'', N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121288, N'sy', CAST(N'2023-11-16T20:27:42.007' AS DateTime), N'CHOXULY', N'265', N'', N'', N'', N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121291, N'sy', CAST(N'2023-11-16T20:35:20.957' AS DateTime), N'CHOXULY', N'Bình Thuận', N'Huyện Hàm Thuận Bắc', N'Xã Hàm Đức', N'dâdadadad', N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121292, N'sy', CAST(N'2023-11-16T20:48:42.317' AS DateTime), N'CHOXULY', N'Điện Biên', N'Huyện Mường Ảng', N'Xã Nặm Lịch', N'sssssss', N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121293, N'sy', CAST(N'2023-11-16T20:52:53.117' AS DateTime), N'CHOXULY', N'Bình Thuận', N'Huyện Hàm Thuận Bắc', N'Xã Hàm Đức', N'SsSsS', N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Status], [Tinh], [Huyen], [Xa], [chitiet], [Phone]) VALUES (121294, N'sy', CAST(N'2023-11-16T20:59:58.243' AS DateTime), N'CHOXULY', N'Điện Biên', N'Huyện Mường Ảng', N'Xã Nặm Lịch', N'sssssss', N'')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1110, N'LEVENTS® MINI POPULAR LOGO', N'f29ba252.jpeg', 45.5, CAST(N'2023-08-01' AS Date), 1, N'001 ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1115, N'LEVENTS® BASIC REGULARFIT TEE', N'872f4ec5.jpg', 50, CAST(N'2023-08-01' AS Date), 1, N'001 ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1145, N'Levents Spooky Tee', N'4dbca513.jpg', 200000, CAST(N'2023-11-17' AS Date), 1, N'003 ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1147, N'AB', N'54e08e0f.jpg', 290000, CAST(N'2023-11-16' AS Date), 1, N'002 ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1148, N'SY', N'e903f43.jfif', 112222, CAST(N'2023-11-16' AS Date), 1, N'001 ')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1149, N'ABC', N'bbcdf1a1.jpg', 1000, CAST(N'2023-11-17' AS Date), 1, N'002 ')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Productvariants] ON 

INSERT [dbo].[Productvariants] ([Id], [Productid], [Color], [Size], [Quantity]) VALUES (38, 1115, N'Đen', N'L', 5)
INSERT [dbo].[Productvariants] ([Id], [Productid], [Color], [Size], [Quantity]) VALUES (39, 1115, N'Đỏ', N'L', 5)
INSERT [dbo].[Productvariants] ([Id], [Productid], [Color], [Size], [Quantity]) VALUES (40, 1115, N'Tím', N'L', 5)
INSERT [dbo].[Productvariants] ([Id], [Productid], [Color], [Size], [Quantity]) VALUES (48, 1110, N'Xanh', N'XS', 5)
INSERT [dbo].[Productvariants] ([Id], [Productid], [Color], [Size], [Quantity]) VALUES (49, 1110, N'Đỏ', N'M', 5)
INSERT [dbo].[Productvariants] ([Id], [Productid], [Color], [Size], [Quantity]) VALUES (50, 1110, N'Đỏ', N'XL', 3)
INSERT [dbo].[Productvariants] ([Id], [Productid], [Color], [Size], [Quantity]) VALUES (51, 1110, N'Xanh', N'XL', 2)
INSERT [dbo].[Productvariants] ([Id], [Productid], [Color], [Size], [Quantity]) VALUES (52, 1145, N'Đen', N'XL', 5)
INSERT [dbo].[Productvariants] ([Id], [Productid], [Color], [Size], [Quantity]) VALUES (53, 1145, N'Đen', N'M', 442424)
INSERT [dbo].[Productvariants] ([Id], [Productid], [Color], [Size], [Quantity]) VALUES (54, 1147, N'Đen', N'XL', 2)
INSERT [dbo].[Productvariants] ([Id], [Productid], [Color], [Size], [Quantity]) VALUES (55, 1148, N'BLUE', N'XL', 5)
INSERT [dbo].[Productvariants] ([Id], [Productid], [Color], [Size], [Quantity]) VALUES (56, 1149, N'Xanh', N'XL', 5)
INSERT [dbo].[Productvariants] ([Id], [Productid], [Color], [Size], [Quantity]) VALUES (57, 1149, N'Tím', N'XL', 44)
SET IDENTITY_INSERT [dbo].[Productvariants] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STAF', N'Staffs')
GO
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'chaulnnps10835@fpt.edu.vn', N'Lê Nguyễn Ngọc Châu', 7, 0, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'cuonglcps10817@fpt.edu.vn', N'Lý Chí Cường', 6, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'datnvps10930@fpt.edu.vn', N'Nguyễn Vũ Đạt', 6, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'dobps10723@fpt.edu.vn', N'Bùi Đỏ', 10, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'ducnpps10800@fpt.edu.vn', N'Nguyễn Phúc Đức', 7, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'duynhps18293@fpt.edu.vn', N'Nguyễn Hoàng Duy', 10, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'duytkps10303@fpt.edu.vn', N'Trần Khánh Duy', 6, 1, N'US')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'huyntps10808@fpt.edu.vn', N'Nguyễn Thanh Huy', 4, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'khaihcps10763@fpt.edu.vn', N'Hoàng Cao Khải', 5, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'luudpps10344@fpt.edu.vn', N'Đào Phong Lưu', 8, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'manhbdps09585@fpt.edu.vn', N'Bùi Đức Mạnh', 5, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'phatltps10691@fpt.edu.vn', N'Lê Tấn Phát', 9, 1, N'US')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'phucpbps10710@fpt.edu.vn', N'Phạm Bá Phúc', 6, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'phuongntdps09013@fpt.edu.vn', N'Nguyễn Thị Diễm Phương', 8, 0, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'quangnmps10741@fpt.edu.vn', N'Nguyễn Minh Quang', 6, 1, N'US')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'quangvvtps09851@fpt.edu.vn', N'Võ Văn Thanh Quang', 5, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'sangntps10356@fpt.edu.vn', N'Nguyễn Tống Sang', 5, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'sonntps10858@fpt.edu.vn', N'Nguyễn Thanh Sơn', 9, 1, N'US')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'suotlvmps10970@fpt.edu.vn', N'Lê Vương Minh Suốt', 7, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'thachnhps10818@fpt.edu.vn', N'Nguyễn Hữu Thạch', 8, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'thangtvps10394@fpt.edu.vn', N'Trằn Văn Thắng', 9, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'trangntpps10956@fpt.edu.vn', N'Nguyễn Thị Phương Trang', 4, 0, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'trungdvps10716@fpt.edu.vn', N'Đặng Văn Trung', 6, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'tuanncqps10850@fpt.edu.vn', N'Nguyễn Cửu Quang Tuấn', 6, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'tuannnps10819@fpt.edu.vn', N'Nguyễn Ngọc Tuấn', 10, 1, N'VN')
INSERT [dbo].[Students] ([email], [fullname], [marks], [gender], [country]) VALUES (N'vinhptps09842@fpt.edu.vn', N'Phạm Thế Vinh', 10, 1, N'VN')
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Photo]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Image]  DEFAULT (N'Product.gif') FOR [Image]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[Students] ADD  CONSTRAINT [DF_Students_gender]  DEFAULT ((1)) FOR [gender]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Accounts] FOREIGN KEY([IDAccounts])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Accounts]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorities_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorities_Accounts]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorities_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorities_Roles]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Productvariants]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariants_Product] FOREIGN KEY([Productid])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Productvariants] CHECK CONSTRAINT [FK_ProductVariants_Product]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu đăng nhập' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ và tên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tiếng Việt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã chi tiết' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'ProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá bán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng mua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày đặt hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sản xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đang kinh doanh ?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Available'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
