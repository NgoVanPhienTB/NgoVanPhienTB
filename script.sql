USE [DB_ThucPhamSach]
GO
/****** Object:  StoredProcedure [dbo].[Test_Tran]    Script Date: 4/8/2020 7:06:38 PM ******/
DROP PROCEDURE [dbo].[Test_Tran]
GO
/****** Object:  StoredProcedure [dbo].[proc_Test]    Script Date: 4/8/2020 7:06:38 PM ******/
DROP PROCEDURE [dbo].[proc_Test]
GO
ALTER TABLE [dbo].[QuanTriVien] DROP CONSTRAINT [Check_GioiTinh_QuanTriVien]
GO
ALTER TABLE [dbo].[KhachHang] DROP CONSTRAINT [Check_GioiTinh]
GO
ALTER TABLE [dbo].[SanPham] DROP CONSTRAINT [FK_NSX_SanPham]
GO
ALTER TABLE [dbo].[SanPham] DROP CONSTRAINT [FK_LoaiSP_SanPham]
GO
ALTER TABLE [dbo].[HoaDon] DROP CONSTRAINT [FK_SanPham_HoaDon]
GO
ALTER TABLE [dbo].[HoaDon] DROP CONSTRAINT [FK_KhachHang_HoaDon]
GO
/****** Object:  Table [dbo].[ThongKe]    Script Date: 4/8/2020 7:06:38 PM ******/
DROP TABLE [dbo].[ThongKe]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 4/8/2020 7:06:38 PM ******/
DROP TABLE [dbo].[SanPham]
GO
/****** Object:  Table [dbo].[QuanTriVien]    Script Date: 4/8/2020 7:06:38 PM ******/
DROP TABLE [dbo].[QuanTriVien]
GO
/****** Object:  Table [dbo].[NSX]    Script Date: 4/8/2020 7:06:38 PM ******/
DROP TABLE [dbo].[NSX]
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 4/8/2020 7:06:38 PM ******/
DROP TABLE [dbo].[LoaiSP]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 4/8/2020 7:06:38 PM ******/
DROP TABLE [dbo].[KhachHang]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 4/8/2020 7:06:38 PM ******/
DROP TABLE [dbo].[HoaDon]
GO
/****** Object:  UserDefinedFunction [dbo].[FUNC_TEST]    Script Date: 4/8/2020 7:06:38 PM ******/
DROP FUNCTION [dbo].[FUNC_TEST]
GO
/****** Object:  UserDefinedFunction [dbo].[FUNC_TEST]    Script Date: 4/8/2020 7:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FUNC_TEST]( @A INTEGER , @B INTEGER ) RETURNS INTEGER
AS
BEGIN
	RETURN (@A+@B)
END

 
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 4/8/2020 7:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[KhachHang] [int] NOT NULL,
	[SanPham] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DiaChi] [nvarchar](max) NOT NULL,
	[SDT] [varchar](20) NOT NULL,
	[HoTen] [nvarchar](max) NOT NULL,
	[NgayTao] [date] NULL,
 CONSTRAINT [PK_HoaDon_KhachHang] PRIMARY KEY CLUSTERED 
(
	[KhachHang] ASC,
	[SanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 4/8/2020 7:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachHang] [nvarchar](max) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[DiaChi] [nvarchar](max) NOT NULL,
	[SDT] [varchar](20) NOT NULL,
	[TenTaiKhoan] [varchar](max) NOT NULL,
	[MatKhau] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 4/8/2020 7:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoaiSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NSX]    Script Date: 4/8/2020 7:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NSX](
	[MaNSX] [int] IDENTITY(1,1) NOT NULL,
	[TenNSX] [nvarchar](max) NOT NULL,
	[DiaChi] [nvarchar](max) NOT NULL,
	[SDT] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuanTriVien]    Script Date: 4/8/2020 7:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuanTriVien](
	[MaQuanTriVien] [int] IDENTITY(1,1) NOT NULL,
	[TenTaiKhoan] [varchar](max) NOT NULL,
	[MatKhau] [varchar](max) NOT NULL,
	[HoTen] [nvarchar](max) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuanTriVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 4/8/2020 7:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](max) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[Gia] [int] NOT NULL,
	[HinhAnh] [varchar](max) NOT NULL,
	[LoaiSP] [int] NOT NULL,
	[NSX] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThongKe]    Script Date: 4/8/2020 7:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongKe](
	[SanPham] [int] IDENTITY(1,1) NOT NULL,
	[NgayThang] [date] NOT NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_HoaDon] FOREIGN KEY([KhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_KhachHang_HoaDon]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_HoaDon] FOREIGN KEY([SanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_SanPham_HoaDon]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_LoaiSP_SanPham] FOREIGN KEY([LoaiSP])
REFERENCES [dbo].[LoaiSP] ([MaLoaiSanPham])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_LoaiSP_SanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_NSX_SanPham] FOREIGN KEY([NSX])
REFERENCES [dbo].[NSX] ([MaNSX])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_NSX_SanPham]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [Check_GioiTinh] CHECK  (([GioiTinh]=(1) OR [GioiTinh]=(0)))
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [Check_GioiTinh]
GO
ALTER TABLE [dbo].[QuanTriVien]  WITH CHECK ADD  CONSTRAINT [Check_GioiTinh_QuanTriVien] CHECK  (([GioiTinh]=(1) OR [GioiTinh]=(0)))
GO
ALTER TABLE [dbo].[QuanTriVien] CHECK CONSTRAINT [Check_GioiTinh_QuanTriVien]
GO
/****** Object:  StoredProcedure [dbo].[proc_Test]    Script Date: 4/8/2020 7:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_Test] 
AS
BEGIN
DECLARE @SoLuong INTEGER,@TenKhachHang NVARCHAR(MAX)
SELECT TOP 1 @SoLuong=COUNT(SanPham) , @TenKhachHang = dbo.KhachHang.TenKhachHang
FROM dbo.HoaDon INNER JOIN dbo.KhachHang 
ON dbo.HoaDon.KhachHang=dbo.KhachHang.MaKhachHang
GROUP BY dbo.KhachHang.TenKhachHang

PRINT 'So Luong : ' + CAST(@SoLuong AS NVARCHAR(10))
PRINT 'Ten Khach Hang : ' + CAST(@TenKhachHang AS NVARCHAR(MAX))
END

 

GO
/****** Object:  StoredProcedure [dbo].[Test_Tran]    Script Date: 4/8/2020 7:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Test_Tran] (@a int , @b int)
AS
BEGIN
	BEGIN TRAN

	BEGIN TRY
	INSERT INTO dbo.HeSoPT_Bac2
	        ( a, b, c )
	VALUES  ( 9, -- a - int
	          9, -- b - int
	          9  -- c - int
	          )
		DECLARE @KQ FLOAT
		 SET @KQ = @a/@b 
	INSERT INTO dbo.HeSoPT_Bac2
	        ( a, b, c )
	VALUES  ( 9, -- a - int
	          9, -- b - int
	          9  -- c - int
	          )

		IF @@TRANCOUNT > 0
		PRINT 'OKIeee : ' +CAST(@KQ AS VARCHAR(100))
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		PRINT 'NOT OKiee'
		ROLLBACK TRAN
	END CATCH
END

GO
