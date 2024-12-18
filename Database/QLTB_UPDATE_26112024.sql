USE [QuanLyThietBi]
GO
/****** Object:  Table [dbo].[BanKiemKe]    Script Date: 11/26/2024 5:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanKiemKe](
	[MaBanKiemKe] [int] IDENTITY(1,1) NOT NULL,
	[MaPhieu] [int] NOT NULL,
	[MaDV] [int] NOT NULL,
	[HoVaTen] [nvarchar](100) NULL,
	[ChucVu] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](300) NULL,
	[TrangThai] [smallint] NULL,
	[NgayCapNhat] [smalldatetime] NULL,
	[NgayTao] [smalldatetime] NULL,
 CONSTRAINT [PK_BanKiemKe] PRIMARY KEY CLUSTERED 
(
	[MaBanKiemKe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuKiemKe]    Script Date: 11/26/2024 5:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuKiemKe](
	[MaCTPKK] [int] IDENTITY(1,1) NOT NULL,
	[MaPhieu] [int] NOT NULL,
	[MaTS] [int] NULL,
	[TenTS] [nvarchar](200) NOT NULL,
	[TenNhomTS] [nvarchar](200) NOT NULL,
	[GiaTri] [int] NULL,
	[SoLuong] [int] NULL,
	[SoLuongThucTe] [int] NULL,
	[ConTot] [int] NULL,
	[KemPC] [int] NULL,
	[MatPC] [int] NULL,
	[HangSanXuat] [nvarchar](200) NULL,
	[NamSanXuat] [date] NULL,
	[NuocSanXuat] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](300) NULL,
	[NgayCapNhat] [datetime] NULL,
	[NgayTao] [datetime] NULL,
 CONSTRAINT [PK_ChiTietPhieuKiemKe] PRIMARY KEY CLUSTERED 
(
	[MaCTPKK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonVi]    Script Date: 11/26/2024 5:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonVi](
	[MaDV] [int] IDENTITY(1,1) NOT NULL,
	[TenDV] [nvarchar](200) NULL,
	[MoTa] [nvarchar](300) NULL,
	[NgayCapNhat] [datetime] NULL,
	[NgayTao] [datetime] NULL,
 CONSTRAINT [PK_DonVi] PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuVucPhong]    Script Date: 11/26/2024 5:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuVucPhong](
	[MaKV] [int] IDENTITY(1,1) NOT NULL,
	[TenKV] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](300) NULL,
	[NgayCapNhat] [datetime] NULL,
	[NgayTao] [datetime] NULL,
 CONSTRAINT [PK_KhuVucPhong] PRIMARY KEY CLUSTERED 
(
	[MaKV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiPhong]    Script Date: 11/26/2024 5:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiPhong](
	[MaLP] [int] IDENTITY(1,1) NOT NULL,
	[TenLP] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](300) NULL,
	[NgayCapNhat] [datetime] NULL,
	[NgayTao] [datetime] NULL,
 CONSTRAINT [PK_LoaiPhong] PRIMARY KEY CLUSTERED 
(
	[MaLP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiTaiSan]    Script Date: 11/26/2024 5:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTaiSan](
	[MaLoaiTS] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiTS] [nvarchar](200) NOT NULL,
	[GhiChu] [nvarchar](300) NULL,
	[NgayCapNhat] [datetime] NULL,
	[NgayTao] [datetime] NULL,
 CONSTRAINT [PK_LoaiTS] PRIMARY KEY CLUSTERED 
(
	[MaLoaiTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 11/26/2024 5:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaND] [int] IDENTITY(1,1) NOT NULL,
	[MaDV] [int] NOT NULL,
	[TenDangNhap] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[HoVaTen] [nvarchar](100) NOT NULL,
	[ChucDanh] [nvarchar](100) NOT NULL,
	[PhanQuyen] [smallint] NULL,
	[SoDienThoai] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[DiaChi] [nvarchar](300) NULL,
	[NgayCapNhat] [datetime] NOT NULL,
	[NgayTao] [datetime] NOT NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[MaND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhatKyHoatDong]    Script Date: 11/26/2024 5:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhatKyHoatDong](
	[MaNKHD] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [nvarchar](50) NULL,
	[HoatDong] [nvarchar](100) NULL,
	[ChiTietHoatDong] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](300) NULL,
	[NgayHoatDong] [datetime] NULL,
 CONSTRAINT [PK_NhatKyHoatDong] PRIMARY KEY CLUSTERED 
(
	[MaNKHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomTaiSan]    Script Date: 11/26/2024 5:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomTaiSan](
	[MaNhomTS] [int] IDENTITY(1,1) NOT NULL,
	[MaLoaiTS] [int] NOT NULL,
	[TenNhomTS] [nvarchar](200) NULL,
	[GhiChu] [nvarchar](300) NULL,
	[NgayCapNhat] [datetime] NULL,
	[NgayTao] [datetime] NULL,
 CONSTRAINT [PK_NhomTaiSan] PRIMARY KEY CLUSTERED 
(
	[MaNhomTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanBo]    Script Date: 11/26/2024 5:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanBo](
	[MaPB] [int] IDENTITY(1,1) NOT NULL,
	[MaTS] [int] NOT NULL,
	[MaND] [int] NULL,
	[MaPhong] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DvTinh] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](300) NULL,
	[NgayCapNhat] [datetime] NOT NULL,
	[NgayTao] [datetime] NOT NULL,
	[SoLuongHong] [int] NULL,
 CONSTRAINT [PK_PhanBo] PRIMARY KEY CLUSTERED 
(
	[MaPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuKiemKe]    Script Date: 11/26/2024 5:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuKiemKe](
	[MaPhieu] [int] IDENTITY(1,1) NOT NULL,
	[MaPhong] [int] NOT NULL,
	[GhiChu] [nvarchar](300) NULL,
	[TrangThai] [smallint] NOT NULL,
	[NgayCapNhat] [datetime] NULL,
	[NgayTao] [datetime] NULL,
 CONSTRAINT [PK_PhieuKiemKe] PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 11/26/2024 5:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[MaPhong] [int] IDENTITY(1,1) NOT NULL,
	[MaLP] [int] NOT NULL,
	[MaKV] [int] NOT NULL,
	[TenPhong] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](300) NULL,
	[NgayCapNhat] [datetime] NOT NULL,
	[NgayTao] [datetime] NULL,
 CONSTRAINT [PK_Phong_1] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiSan]    Script Date: 11/26/2024 5:03:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiSan](
	[MaTS] [int] IDENTITY(1,1) NOT NULL,
	[MaNhomTS] [int] NOT NULL,
	[TenTS] [nvarchar](200) NOT NULL,
	[GiaTri] [int] NULL,
	[SoLuongChinh] [int] NULL,
	[SoLuong] [int] NULL,
	[HangSanXuat] [nvarchar](200) NULL,
	[NamSanXuat] [date] NULL,
	[NuocSanXuat] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](300) NULL,
	[NgayCapNhat] [datetime] NOT NULL,
	[NgayTao] [datetime] NOT NULL,
	[HinhAnh] [nvarchar](300) NULL,
 CONSTRAINT [PK_TaiSan] PRIMARY KEY CLUSTERED 
(
	[MaTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NguoiDung] ADD  CONSTRAINT [DF_NguoiDung_ChucDanh]  DEFAULT ('0') FOR [ChucDanh]
GO
ALTER TABLE [dbo].[NhomTaiSan] ADD  CONSTRAINT [DF_NhomTaiSan_GhiChu]  DEFAULT (N'Không có') FOR [GhiChu]
GO
ALTER TABLE [dbo].[PhanBo] ADD  CONSTRAINT [DF_PhanBo_SoLuong]  DEFAULT ((1)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[Phong] ADD  CONSTRAINT [DF_Phong_GhiChu]  DEFAULT (N'Không có') FOR [GhiChu]
GO
ALTER TABLE [dbo].[TaiSan] ADD  CONSTRAINT [DF_TaiSan_GiaTri]  DEFAULT ((0)) FOR [GiaTri]
GO
ALTER TABLE [dbo].[TaiSan] ADD  CONSTRAINT [DF_TaiSan_SoLuongChinh]  DEFAULT ((0)) FOR [SoLuongChinh]
GO
ALTER TABLE [dbo].[TaiSan] ADD  CONSTRAINT [DF_TaiSan_SoLuong]  DEFAULT ((0)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[TaiSan] ADD  CONSTRAINT [DF_TaiSan_HangSanXuat]  DEFAULT (N'Không có') FOR [HangSanXuat]
GO
ALTER TABLE [dbo].[TaiSan] ADD  CONSTRAINT [DF_TaiSan_NuocSanXuat]  DEFAULT (N'Không có') FOR [NuocSanXuat]
GO
ALTER TABLE [dbo].[TaiSan] ADD  CONSTRAINT [DF_TaiSan_GhiChu]  DEFAULT (N'Không có') FOR [GhiChu]
GO
ALTER TABLE [dbo].[BanKiemKe]  WITH CHECK ADD  CONSTRAINT [FK_BanKiemKe_PhieuKiemKe] FOREIGN KEY([MaPhieu])
REFERENCES [dbo].[PhieuKiemKe] ([MaPhieu])
GO
ALTER TABLE [dbo].[BanKiemKe] CHECK CONSTRAINT [FK_BanKiemKe_PhieuKiemKe]
GO
ALTER TABLE [dbo].[ChiTietPhieuKiemKe]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuKiemKe_PhieuKiemKe] FOREIGN KEY([MaPhieu])
REFERENCES [dbo].[PhieuKiemKe] ([MaPhieu])
GO
ALTER TABLE [dbo].[ChiTietPhieuKiemKe] CHECK CONSTRAINT [FK_ChiTietPhieuKiemKe_PhieuKiemKe]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_DonVi] FOREIGN KEY([MaDV])
REFERENCES [dbo].[DonVi] ([MaDV])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_DonVi]
GO
ALTER TABLE [dbo].[NhomTaiSan]  WITH CHECK ADD  CONSTRAINT [FK_NhomTaiSan_LoaiTaiSan] FOREIGN KEY([MaLoaiTS])
REFERENCES [dbo].[LoaiTaiSan] ([MaLoaiTS])
GO
ALTER TABLE [dbo].[NhomTaiSan] CHECK CONSTRAINT [FK_NhomTaiSan_LoaiTaiSan]
GO
ALTER TABLE [dbo].[PhanBo]  WITH CHECK ADD  CONSTRAINT [FK_PhanBo_TaiSan] FOREIGN KEY([MaTS])
REFERENCES [dbo].[TaiSan] ([MaTS])
GO
ALTER TABLE [dbo].[PhanBo] CHECK CONSTRAINT [FK_PhanBo_TaiSan]
GO
ALTER TABLE [dbo].[PhieuKiemKe]  WITH CHECK ADD  CONSTRAINT [FK_PhieuKiemKe_Phong] FOREIGN KEY([MaPhong])
REFERENCES [dbo].[Phong] ([MaPhong])
GO
ALTER TABLE [dbo].[PhieuKiemKe] CHECK CONSTRAINT [FK_PhieuKiemKe_Phong]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_Phong_KhuVucPhong] FOREIGN KEY([MaKV])
REFERENCES [dbo].[KhuVucPhong] ([MaKV])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_Phong_KhuVucPhong]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_Phong_LoaiPhong] FOREIGN KEY([MaLP])
REFERENCES [dbo].[LoaiPhong] ([MaLP])
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_Phong_LoaiPhong]
GO
ALTER TABLE [dbo].[TaiSan]  WITH CHECK ADD  CONSTRAINT [FK_TaiSan_NhomTaiSan] FOREIGN KEY([MaNhomTS])
REFERENCES [dbo].[NhomTaiSan] ([MaNhomTS])
GO
ALTER TABLE [dbo].[TaiSan] CHECK CONSTRAINT [FK_TaiSan_NhomTaiSan]
GO
