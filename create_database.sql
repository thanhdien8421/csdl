USE master;
GO
CREATE DATABASE [csdl]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'csdl', FILENAME = N'D:\MSSQLServer\MSSQL16.SQLEXPRESS\MSSQL\DATA\csdl.mdf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'csdl_log', FILENAME = N'D:\MSSQLServer\MSSQL16.SQLEXPRESS\MSSQL\DATA\csdl_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 WITH LEDGER = OFF
ALTER DATABASE [csdl] SET COMPATIBILITY_LEVEL = 160
GO
ALTER DATABASE [csdl] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [csdl] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [csdl] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [csdl] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [csdl] SET ARITHABORT OFF 
GO
ALTER DATABASE [csdl] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [csdl] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [csdl] SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF)
GO
ALTER DATABASE [csdl] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [csdl] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [csdl] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [csdl] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [csdl] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [csdl] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [csdl] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [csdl] SET  DISABLE_BROKER 
GO
ALTER DATABASE [csdl] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [csdl] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [csdl] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [csdl] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [csdl] SET  READ_WRITE 
GO
ALTER DATABASE [csdl] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [csdl] SET  MULTI_USER 
GO
ALTER DATABASE [csdl] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [csdl] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [csdl] SET DELAYED_DURABILITY = DISABLED 
GO
USE [csdl]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = On;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = Primary;
GO
USE [csdl];
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [csdl] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO
-------------------------------------Tạo các bảng dữ liệu ban đầu--------------------------------------------------------------------------------
--create table 
CREATE TABLE [dbo].[NhanVien] (
    [id] INT NOT NULL IDENTITY(1,1),
    [name] NVARCHAR(50) NOT NULL,
    [birthday] DATETIME2 NOT NULL,
    [salary] MONEY,
    [startDate] DATETIME2 NOT NULL CONSTRAINT [NhanVien_startDate_df] DEFAULT CURRENT_TIMESTAMP,
    [phone] NVARCHAR(20),
    [role] NVARCHAR(50),
    [dayOff] INT NOT NULL CONSTRAINT [NhanVien_dayOff_df] DEFAULT 0,
    [storeId] INT,
	CONSTRAINT [NhanVien_age_df] CHECK (YEAR(GETDATE()) - YEAR([birthday]) >= 18),
    CONSTRAINT [NhanVien_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[QuanLy] (
    [id] INT NOT NULL,
    [degree] NVARCHAR(500),
    CONSTRAINT [QuanLy_id_key] UNIQUE NONCLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[BanHang] (
    [id] INT NOT NULL,
    [trainingTime] INT NOT NULL CONSTRAINT [BanHang_trainingTime_df] DEFAULT 0,
    CONSTRAINT [BanHang_id_key] UNIQUE NONCLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[CheBien] (
    [id] INT NOT NULL,
    [kinhNghiem] INT,
    [vaiTro] NVARCHAR(100),
    CONSTRAINT [CheBien_id_key] UNIQUE NONCLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[CuaHang] (
    [id] INT NOT NULL IDENTITY(1,1),
    [name] NVARCHAR(50),
    [address] NVARCHAR(1000),
    [managerId] INT,
    [startTime] TIME(0) NOT NULL CONSTRAINT [CuaHang_startTime_df] DEFAULT '07:00:00',
    [endTime] TIME(0) NOT NULL CONSTRAINT [CuaHang_endTime_df] DEFAULT '22:00:00',
    [monitorStoreId] INT,
    CONSTRAINT [CuaHang_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[SoDienThoaiCuaHang] (
    [id] INT NOT NULL,
    [privateNumber] NVARCHAR(20) NOT NULL,
    [hotline] NVARCHAR(20) NOT NULL,
    CONSTRAINT [SoDienThoaiCuaHang_pkey] PRIMARY KEY CLUSTERED ([id],[privateNumber],[hotline]),
    --CONSTRAINT [SoDienThoaiCuaHang_id_key] UNIQUE NONCLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[ThietBi] (
    [id] INT NOT NULL,
    [type] NVARCHAR(100) NOT NULL,
    [endDate] DATETIME2,
    [startDate] DATETIME2 NOT NULL CONSTRAINT [ThietBi_startDate_df] DEFAULT CURRENT_TIMESTAMP,
    [number] INT NOT NULL CONSTRAINT [ThietBi_number_df] DEFAULT 0,
    [cost] MONEY NOT NULL CONSTRAINT [ThietBi_cost_df] DEFAULT 0,
    CONSTRAINT [ThietBi_pkey] PRIMARY KEY CLUSTERED ([id],[type]),
    --CONSTRAINT [ThietBi_id_key] UNIQUE NONCLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[SanPham] (
    [id] INT NOT NULL IDENTITY(1,1),
    [name] NVARCHAR(50),
    [price] MONEY NOT NULL CONSTRAINT [SanPham_price_df] DEFAULT 0,
    [description] NVARCHAR(1000),
    [type] NVARCHAR(100) NOT NULL,
    CONSTRAINT [SanPham_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[MonAn] (
    [id] INT NOT NULL,
    [size] NVARCHAR(20),
    CONSTRAINT [MonAn_id_key] UNIQUE NONCLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[DoUong] (
    [id] INT NOT NULL,
    [buyDate] DATETIME2 NOT NULL CONSTRAINT [DoUong_buyDate_df] DEFAULT CURRENT_TIMESTAMP,
    [endDate] DATETIME2 NOT NULL CONSTRAINT [DoUong_endDate_df] DEFAULT CURRENT_TIMESTAMP,
    [cost] MONEY NOT NULL CONSTRAINT [DoUong_cost_df] DEFAULT 0,
    [supplierId] INT,
    CONSTRAINT [DoUong_id_key] UNIQUE NONCLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[DonHang] (
    [id] INT NOT NULL IDENTITY(1,1),
    [orderTime] DATETIME2 NOT NULL CONSTRAINT [DonHang_orderTime_df] DEFAULT CURRENT_TIMESTAMP,
    [paymentMethod] NVARCHAR(100) NOT NULL,
    CONSTRAINT [DonHang_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[NguyenLieu] (
    [id] INT NOT NULL IDENTITY(1,1),
    [name] NVARCHAR(1000) NOT NULL,
    [type] NVARCHAR(500) NOT NULL,
    [buyDate] DATETIME2 NOT NULL CONSTRAINT [NguyenLieu_buyDate_df] DEFAULT CURRENT_TIMESTAMP,
    [endDate] DATETIME2 NOT NULL CONSTRAINT [NguyenLieu_endDate_df] DEFAULT CURRENT_TIMESTAMP,
    [number] DECIMAL(5,2) NOT NULL CONSTRAINT [NguyenLieu_number_df] DEFAULT 0,
    [unit] NVARCHAR(20) NOT NULL,
    [cost] MONEY NOT NULL CONSTRAINT [NguyenLieu_cost_df] DEFAULT 0,
    CONSTRAINT [NguyenLieu_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[NhaCungCap] (
    [id] INT NOT NULL IDENTITY(1,1),
    [name] NVARCHAR(500) NOT NULL,
    [address] NVARCHAR(500),
    [email] NVARCHAR(100),
    CONSTRAINT [NhaCungCap_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[SoDienThoaiNhaCungCap] (
    [id] INT NOT NULL,
    [number] NVARCHAR(20) NOT NULL,
    CONSTRAINT [SoDienThoaiNhaCungCap_pkey] PRIMARY KEY CLUSTERED ([id],[number]),
    --CONSTRAINT [SoDienThoaiNhaCungCap_id_key] UNIQUE NONCLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[sanPham_Tai_CuaHang] (
    [storeId] INT NOT NULL,
    [productId] INT NOT NULL,
    [number] INT NOT NULL,
    CONSTRAINT [sanPham_Tai_CuaHang_pkey] PRIMARY KEY CLUSTERED ([storeId],[productId])
);

-- CreateTable
CREATE TABLE [dbo].[sanPham_Tren_DonHang] (
    [orderId] INT NOT NULL,
    [productId] INT NOT NULL,
    [number] INT NOT NULL,
    [cost] MONEY NOT NULL,
    CONSTRAINT [sanPham_Tren_DonHang_pkey] PRIMARY KEY CLUSTERED ([orderId],[productId])
);

-- CreateTable
CREATE TABLE [dbo].[donHang_SaleTai_CuaHang] (
    [salerId] INT NOT NULL,
    [orderId] INT NOT NULL,
    [storeId] INT NOT NULL,
    CONSTRAINT [donHang_SaleTai_CuaHang_pkey] PRIMARY KEY CLUSTERED ([orderId])
);

-- CreateTable
CREATE TABLE [dbo].[nhaCungCap_NguyenLieu_CuaHang] (
    [storeId] INT NOT NULL,
    [supplierId] INT NOT NULL,
    [ingredientId] INT NOT NULL,
    CONSTRAINT [nhaCungCap_NguyenLieu_CuaHang_pkey] PRIMARY KEY CLUSTERED ([storeId],[supplierId],[ingredientId])
);

-- CreateTable
CREATE TABLE [dbo].[Auth] (
    [id] INT NOT NULL IDENTITY(1,1),
    [email] NVARCHAR(100) NOT NULL,
    [password] NVARCHAR(255) NOT NULL,
    [storeId] INT,
	[role] NVARCHAR(50) NOT NULL DEFAULT 'User',
    CONSTRAINT [Auth_pkey] PRIMARY KEY CLUSTERED ([id])
);

--create table 
CREATE TABLE [dbo].[LichSuCapNhatNguyenLieu] (
    [id] VARCHAR(7) NOT NULL DEFAULT '0',
    [name] NVARCHAR(1000) NOT NULL,
    [type] NVARCHAR(500) NOT NULL,
    [buyDate] DATETIME2 NOT NULL CONSTRAINT [LichSuCapNhatNguyenLieu_buyDate_df] DEFAULT CURRENT_TIMESTAMP,
    [endDate] DATETIME2 NOT NULL CONSTRAINT [LichSuCapNhatNguyenLieu_endDate_df] DEFAULT CURRENT_TIMESTAMP,
    [number] DECIMAL(5,2) NOT NULL CONSTRAINT [LichSuCapNhatNguyenLieu_number_df] DEFAULT 0,
    [unit] NVARCHAR(20) NOT NULL,
    [cost] MONEY NOT NULL CONSTRAINT [LichSuCapNhatNguyenLieu_cost_df] DEFAULT 0,
	[storeId] INT NOT NULL,
	[managerId] INT NOT NULL,
	[action] VARCHAR(6) NOT NULL,
	[updateTime] DATETIME2 DEFAULT GETDATE()
    CONSTRAINT [LichSuCapNhatNguyenLieu_pkey] PRIMARY KEY CLUSTERED ([id])
);

--create table
CREATE TABLE [dbo].[HistorySequence]
(
  id INT NOT NULL IDENTITY(1,1) PRIMARY KEY
);


---------------------------------------------------------Thêm dữ liệu vào trước khi tạo khóa ngoại và các proc/func---------------------------------
USE csdl;
GO

-- Thêm dữ liệu vào bảng NhanVien
-- DBCC CHECKIDENT ('NhanVien', RESEED, 0);

INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Quách Thanh Điền', '1978-10-05T00:00:00.000Z', 16000000, GETDATE(), N'0123456789', N'Quản lý');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Trần Văn Hoàng', '1965-10-05T00:00:00.000Z', 15000000, GETDATE(), N'0933333333', N'Quản lý');

INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Nguyễn Trung Kiên', '1990-10-05T00:00:00.000Z', 6999999, GETDATE(), N'0888888888', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Lê Minh Trí', '1987-10-05T00:00:00.000Z', 8000000, GETDATE(), N'0909090909', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Đỗ Ngọc Hạnh', '1962-10-05T00:00:00.000Z', 17000000, GETDATE(), N'0944444444', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Nguyễn Minh Quang', '1995-10-05T00:00:00.000Z', 6000000, GETDATE(), N'0931234567', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Phan Hồng Anh', '1984-10-05T00:00:00.000Z', 6500000, GETDATE(), N'0942345678', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Võ Thị Lan', '1971-10-05T00:00:00.000Z', 5600000, GETDATE(), N'0953456789', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Đỗ Tiến Dũng', '1988-10-05T00:00:00.000Z', 6200000, GETDATE(), N'0964567890', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Nguyễn Thị Thanh', '1992-10-05T00:00:00.000Z', 5800000, GETDATE(), N'0975678901', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Phạm Tấn Thành', '1980-10-05T00:00:00.000Z', 7000000, GETDATE(), N'0986789012', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Lê Ngọc Linh', '1982-10-05T00:00:00.000Z', 5200000, GETDATE(), N'0997890123', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Trần Hoàng Nam', '1993-10-05T00:00:00.000Z', 6700000, GETDATE(), N'0918901234', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Bùi Thị Hương', '1968-10-05T00:00:00.000Z', 6000000, GETDATE(), N'0929012345', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Nguyễn Tuấn Anh', '1990-10-05T00:00:00.000Z', 7500000, GETDATE(), N'0930123456', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Lý Thiện Thành', '1959-10-05T00:00:00.000Z', 5800000, GETDATE(), N'0912345678', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Hồ Thi Ngọc', '1984-10-05T00:00:00.000Z', 6400000, GETDATE(), N'0923456789', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Nguyễn Hoàng Nam', '1973-10-05T00:00:00.000Z', 7000000, GETDATE(), N'0934567890', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Đoàn Thị Hồng', '1966-10-05T00:00:00.000Z', 6000000, GETDATE(), N'0945678901', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Phan Ngọc Lan', '1974-10-05T00:00:00.000Z', 5900000, GETDATE(), N'0956789012', N'Đầu bếp');

INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Nguyễn Chí Thiết', '1985-10-05T00:00:00.000Z', 7345678, GETDATE(), N'0987654321', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Phạm Nhật Huy', '1994-10-05T00:00:00.000Z', 8000000, GETDATE(), N'0966666666', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Võ Hoàng Anh', '1977-10-05T00:00:00.000Z', 7000000, GETDATE(), N'0912345678', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Hoàng Hải Đăng', '1958-10-05T00:00:00.000Z', 5000000, GETDATE(), N'0907777777', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Ngô Thanh Hương', '1989-10-05T00:00:00.000Z', 4500000, GETDATE(), N'0922222222', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Ngô Thanh Hương', '1990-10-05T00:00:00.000Z', 4500000, GETDATE(), N'0922222222', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Vũ Thị Mai', '1964-10-05T00:00:00.000Z', 4800000, GETDATE(), N'0933333333', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Phan Tiến Dũng', '1971-10-05T00:00:00.000Z', 5000000, GETDATE(), N'0944444444', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Lê Quang Hieu', '1969-10-05T00:00:00.000Z', 5200000, GETDATE(), N'0955555555', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Trần Minh Phúc', '1979-10-05T00:00:00.000Z', 5300000, GETDATE(), N'0966666666', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Nguyễn Hải Đăng', '1983-10-05T00:00:00.000Z', 5500000, GETDATE(), N'0977777777', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Bùi Trọng Hải', '1993-10-05T00:00:00.000Z', 4900000, GETDATE(), N'0988888888', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Võ Tấn Lực', '1976-10-05T00:00:00.000Z', 5100000, GETDATE(), N'0999999999', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Hoàng Trí Quân', '1957-10-05T00:00:00.000Z', 5400000, GETDATE(), N'0911111111', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Nguyễn Minh Tú', '1981-05-22T00:00:00.000Z', 5600000, GETDATE(), N'0922222222', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Vũ Minh Hoàng', '1996-03-14T00:00:00.000Z', 4700000, GETDATE(), N'0967890123', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Nguyễn Hà Thanh', '1995-07-30T00:00:00.000Z', 4900000, GETDATE(), N'0978901234', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [birthday], [salary], [startDate], [phone], [role])
VALUES(N'Trần Hữu Tài', '1996-08-19T00:00:00.000Z', 4800000, GETDATE(), N'0989012345', N'Bán hàng');

GO

-- Insert data for QuanLy
INSERT INTO [dbo].[QuanLy] ([id], [degree])
VALUES
(1, N'Cử nhân Quản trị Kinh doanh'),
(2, N'Thạc sĩ Quản lý Doanh nghiệp');

-- Insert data for BanHang
INSERT INTO [dbo].[BanHang] ([id], [trainingTime])
SELECT [id], FLOOR(RAND(CHECKSUM(NEWID())) * (100 - 10 + 1) + 10) -- Tạo số ngẫu nhiên trong phạm vi từ 10 đến 100
FROM [dbo].[NhanVien]
WHERE [role] = N'Bán hàng';

-- Insert data for CheBien
INSERT INTO [dbo].[CheBien] ([id], [kinhNghiem], [vaiTro])
SELECT [id], FLOOR(RAND(CHECKSUM(NEWID())) * (10 - 1 + 1) + 1), N'Đầu bếp' -- Tạo số ngẫu nhiên từ 1 đến 10 cho kinh nghiệm
FROM [dbo].[NhanVien]
WHERE [role] = N'Đầu bếp';

-- DBCC CHECKIDENT ('CuaHang', RESEED, 0);
-- Thêm dữ liệu cho bảng Cửa Hàng
INSERT INTO [dbo].[CuaHang] ([name], [address], [managerId], [startTime], [endTime], [monitorStoreId])
VALUES 
(N'Cửa Hàng Pizza Quận 1', N'Số 10, Đường Lê Lợi, Quận 1, TP.HCM', 1, '07:00:00', '22:00:00', NULL),-- Cửa hàng quản lý
(N'Cửa Hàng Pizza Quận 3', N'Số 22, Đường Nguyễn Thị Minh Khai, Quận 3, TP.HCM', 1, '07:00:00', '22:00:00', 1),  -- Quản lý bởi Quận 1
(N'Cửa Hàng Pizza Quận 5', N'Số 30, Đường Võ Văn Kiệt, Quận 5, TP.HCM', 1, '07:00:00', '22:00:00', 1),  -- Quản lý bởi Quận 1
(N'Cửa Hàng Pizza Quận 7', N'Số 15, Đường Nguyễn Lương Bằng, Quận 7, TP.HCM', 2, '07:00:00', '22:00:00', NULL),  -- Cửa hàng quản lý
(N'Cửa Hàng Pizza Quận 10', N'Số 40, Đường Tân Phước, Quận 10, TP.HCM', 2, '07:00:00', '22:00:00', 4),  -- Quản lý bởi Quận 7
(N'Cửa Hàng Pizza Quận 12', N'Số 25, Đường Tân Thới Nhất, Quận 12, TP.HCM', 2, '07:00:00', '22:00:00', 4);  -- Quản lý bởi Quận 7
GO
-- Thêm số điện thoại
INSERT INTO [dbo].[SoDienThoaiCuaHang] ([id], [privateNumber], [hotline])
VALUES 
(1, N'0123456734', N'19001567'),  -- Cửa hàng ID = 1, Số điện thoại riêng tư 1 và công cộng 1
(1, N'0123456745', N'19001678'),  -- Cửa hàng ID = 1, Số điện thoại riêng tư 2 và công cộng 2
(2, N'0123456746', N'19001568'),  -- Cửa hàng ID = 2, Số điện thoại riêng tư 1 và công cộng 1
(2, N'0123456757', N'19001679'),  -- Cửa hàng ID = 2, Số điện thoại riêng tư 2 và công cộng 2
(3, N'0123456758', N'19001569'),  -- Cửa hàng ID = 3, Số điện thoại riêng tư 1 và công cộng 1
(3, N'0123456769', N'19001680'),  -- Cửa hàng ID = 3, Số điện thoại riêng tư 2 và công cộng 2
(4, N'0123456770', N'19001570'),  -- Cửa hàng ID = 4, Số điện thoại riêng tư 1 và công cộng 1
(4, N'0123456781', N'19001681'),  -- Cửa hàng ID = 4, Số điện thoại riêng tư 2 và công cộng 2
(5, N'0123456782', N'19001571'),  -- Cửa hàng ID = 5, Số điện thoại riêng tư 1 và công cộng 1
(5, N'0123456793', N'19001682'),  -- Cửa hàng ID = 5, Số điện thoại riêng tư 2 và công cộng 2
(6, N'0123456794', N'19001572'),  -- Cửa hàng ID = 6, Số điện thoại riêng tư 1 và công cộng 1
(6, N'0123456805', N'19001683');  -- Cửa hàng ID = 6, Số điện thoại riêng tư 2 và công cộng 2

-- Cập nhật storeId cho nhân viên quản lý
UPDATE dbo.NhanVien
SET storeId = 1
WHERE id = 1;  -- Nhân viên quản lý đầu tiên có storeId = 1
GO
UPDATE dbo.NhanVien
SET storeId = 4
WHERE id = 2;  -- Nhân viên quản lý thứ hai có storeId = 4
GO
-- Cập nhật storeId cho các nhân viên đầu bếp (id từ 3 đến 20)
UPDATE dbo.NhanVien
SET storeId = CASE 
    WHEN id BETWEEN 3 AND 5 THEN 1
    WHEN id BETWEEN 6 AND 8 THEN 2
    WHEN id BETWEEN 9 AND 11 THEN 3
    WHEN id BETWEEN 12 AND 14 THEN 4
    WHEN id BETWEEN 15 AND 17 THEN 5
    WHEN id BETWEEN 18 AND 20 THEN 6
END
WHERE id BETWEEN 3 AND 20;
GO
-- Cập nhật storeId cho các nhân viên bán hàng (id từ 21 đến 38)
UPDATE dbo.NhanVien
SET storeId = CASE 
    WHEN id BETWEEN 21 AND 23 THEN 1
    WHEN id BETWEEN 24 AND 26 THEN 2
    WHEN id BETWEEN 27 AND 29 THEN 3
    WHEN id BETWEEN 30 AND 32 THEN 4
    WHEN id BETWEEN 33 AND 35 THEN 5
    WHEN id BETWEEN 36 AND 38 THEN 6
END
WHERE id BETWEEN 21 AND 38;
GO

---Insert data for NguyenLieu
INSERT INTO [dbo].[NguyenLieu] ([name], [type], [buyDate], [endDate], [number], [unit], [cost])
VALUES 
(N'Bột mì', N'Nguyên liệu chính', '2024-12-01', '2025-12-01', 100.00, 'kg', 50000),
(N'Đường', N'Nguyên liệu chính', '2024-12-05', '2025-12-05', 200.00, 'kg', 30000),
(N'Dầu ăn', N'Nguyên liệu chính', '2024-12-10', '2025-12-10', 150.00, N'lít', 60000),
(N'Gia vị', N'Nguyên liệu phụ', '2024-12-15', '2025-12-15', 50.00, 'kg', 40000),
(N'Phô mai', N'Nguyên liệu chính', '2024-12-05', '2025-12-05', 50.00, 'kg', 150000),  
(N'Tomato Sauce', N'Nguyên liệu chính', '2024-12-10', '2025-12-10', 100.00, 'kg', 70000),  
(N'Ớt chuông', N'Nguyên liệu phụ', '2024-12-15', '2025-12-15', 20.00, 'kg', 30000),  
(N'Thịt xông khói', N'Nguyên liệu phụ', '2024-12-20', '2025-12-20', 30.00, 'kg', 120000),  
(N'Oli olive', N'Nguyên liệu phụ', '2024-12-25', '2025-12-25', 40.00, 'lít', 200000);  
GO

INSERT INTO [dbo].[NguyenLieu] ([name], [type], [buyDate], [endDate], [number], [unit], [cost])
VALUES
(N'Bột mì', N'Nguyên liệu chính', '2024-12-01', '2025-12-01', 120.00, 'kg', 52000),
(N'Đường', N'Nguyên liệu chính', '2024-12-05', '2025-12-05', 220.00, 'kg', 31000),
(N'Dầu ăn', N'Nguyên liệu chính', '2024-12-10', '2025-12-10', 160.00, N'lít', 65000),
(N'Gia vị', N'Nguyên liệu phụ', '2024-12-15', '2025-12-15', 55.00, 'kg', 42000),
(N'Phô mai', N'Nguyên liệu chính', '2024-12-05', '2025-12-05', 55.00, 'kg', 155000),
(N'Tomato Sauce', N'Nguyên liệu chính', '2024-12-10', '2025-12-10', 110.00, 'kg', 72000),
(N'Ớt chuông', N'Nguyên liệu phụ', '2024-12-15', '2025-12-15', 25.00, 'kg', 32000),
(N'Thịt xông khói', N'Nguyên liệu phụ', '2024-12-20', '2025-12-20', 35.00, 'kg', 125000),
(N'Oli olive', N'Nguyên liệu phụ', '2024-12-25', '2025-12-25', 45.00, 'lít', 205000);
GO

INSERT INTO [dbo].[NguyenLieu] ([name], [type], [buyDate], [endDate], [number], [unit], [cost])
VALUES
(N'Bột mì', N'Nguyên liệu chính', '2024-12-01', '2025-12-01', 130.00, 'kg', 53000),
(N'Đường', N'Nguyên liệu chính', '2024-12-05', '2025-12-05', 230.00, 'kg', 32000),
(N'Dầu ăn', N'Nguyên liệu chính', '2024-12-10', '2025-12-10', 170.00, N'lít', 67000),
(N'Gia vị', N'Nguyên liệu phụ', '2024-12-15', '2025-12-15', 60.00, 'kg', 44000),
(N'Phô mai', N'Nguyên liệu chính', '2024-12-05', '2025-12-05', 60.00, 'kg', 160000),
(N'Tomato Sauce', N'Nguyên liệu chính', '2024-12-10', '2025-12-10', 120.00, 'kg', 74000),
(N'Ớt chuông', N'Nguyên liệu phụ', '2024-12-15', '2025-12-15', 30.00, 'kg', 34000),
(N'Thịt xông khói', N'Nguyên liệu phụ', '2024-12-20', '2025-12-20', 40.00, 'kg', 130000),
(N'Oli olive', N'Nguyên liệu phụ', '2024-12-25', '2025-12-25', 50.00, 'lít', 210000);
GO

INSERT INTO [dbo].[NguyenLieu] ([name], [type], [buyDate], [endDate], [number], [unit], [cost])
VALUES
(N'Bột mì', N'Nguyên liệu chính', '2024-12-01', '2025-12-01', 140.00, 'kg', 54000),
(N'Đường', N'Nguyên liệu chính', '2024-12-05', '2025-12-05', 240.00, 'kg', 33000),
(N'Dầu ăn', N'Nguyên liệu chính', '2024-12-10', '2025-12-10', 180.00, N'lít', 69000),
(N'Gia vị', N'Nguyên liệu phụ', '2024-12-15', '2025-12-15', 65.00, 'kg', 46000),
(N'Phô mai', N'Nguyên liệu chính', '2024-12-05', '2025-12-05', 65.00, 'kg', 165000),
(N'Tomato Sauce', N'Nguyên liệu chính', '2024-12-10', '2025-12-10', 130.00, 'kg', 76000),
(N'Ớt chuông', N'Nguyên liệu phụ', '2024-12-15', '2025-12-15', 35.00, 'kg', 35000),
(N'Thịt xông khói', N'Nguyên liệu phụ', '2024-12-20', '2025-12-20', 45.00, 'kg', 135000),
(N'Oli olive', N'Nguyên liệu phụ', '2024-12-25', '2025-12-25', 55.00, 'lít', 215000);
GO

INSERT INTO [dbo].[NguyenLieu] ([name], [type], [buyDate], [endDate], [number], [unit], [cost])
VALUES
(N'Bột mì', N'Nguyên liệu chính', '2024-12-01', '2025-12-01', 150.00, 'kg', 55000),
(N'Đường', N'Nguyên liệu chính', '2024-12-05', '2025-12-05', 250.00, 'kg', 34000),
(N'Dầu ăn', N'Nguyên liệu chính', '2024-12-10', '2025-12-10', 190.00, N'lít', 71000),
(N'Gia vị', N'Nguyên liệu phụ', '2024-12-15', '2025-12-15', 70.00, 'kg', 48000),
(N'Phô mai', N'Nguyên liệu chính', '2024-12-05', '2025-12-05', 70.00, 'kg', 170000),
(N'Tomato Sauce', N'Nguyên liệu chính', '2024-12-10', '2025-12-10', 140.00, 'kg', 78000),
(N'Ớt chuông', N'Nguyên liệu phụ', '2024-12-15', '2025-12-15', 40.00, 'kg', 36000),
(N'Thịt xông khói', N'Nguyên liệu phụ', '2024-12-20', '2025-12-20', 50.00, 'kg', 140000),
(N'Oli olive', N'Nguyên liệu phụ', '2024-12-25', '2025-12-25', 60.00, 'lít', 220000);
GO

INSERT INTO [dbo].[NguyenLieu] ([name], [type], [buyDate], [endDate], [number], [unit], [cost])
VALUES
(N'Bột mì', N'Nguyên liệu chính', '2024-12-01', '2025-12-01', 160.00, 'kg', 56000),
(N'Đường', N'Nguyên liệu chính', '2024-12-05', '2025-12-05', 260.00, 'kg', 35000),
(N'Dầu ăn', N'Nguyên liệu chính', '2024-12-10', '2025-12-10', 200.00, N'lít', 73000),
(N'Gia vị', N'Nguyên liệu phụ', '2024-12-15', '2025-12-15', 75.00, 'kg', 50000),
(N'Phô mai', N'Nguyên liệu chính', '2024-12-05', '2025-12-05', 75.00, 'kg', 175000),
(N'Tomato Sauce', N'Nguyên liệu chính', '2024-12-10', '2025-12-10', 150.00, 'kg', 80000),
(N'Ớt chuông', N'Nguyên liệu phụ', '2024-12-15', '2025-12-15', 45.00, 'kg', 37000),
(N'Thịt xông khói', N'Nguyên liệu phụ', '2024-12-20', '2025-12-20', 55.00, 'kg', 145000),
(N'Oli olive', N'Nguyên liệu phụ', '2024-12-25', '2025-12-25', 65.00, 'lít', 225000);
GO

--DBCC CHECKIDENT ('NguyenLieu', RESEED, 0);
--ALTER TABLE NhaCungCap AUTO_INCREMENT = 11;
-- Thêm dữ liệu cho bảng Nhà Cung Cấp
INSERT INTO [dbo].[NhaCungCap] ([name], [address], [email])
VALUES 
(N'Nhà Cung Cấp A', N'Số 12, Đường ABC, Quận 1, TP.HCM', N'nhacungcapa@example.com'),
(N'Nhà Cung Cấp B', N'Số 45, Đường XYZ, Quận 3, TP.HCM', N'nhacungcapb@example.com'),
(N'Nhà Cung Cấp C', N'Số 23, Đường DEF, Quận 5, TP.HCM', N'nhacungcapc@example.com'),
(N'Nhà Cung Cấp D', N'Số 10, Đường 1A, Quận 7, TP.HCM', N'nhacungcapd@example.com'),
(N'Nhà Cung Cấp E', N'Số 50, Đường Lý Thường Kiệt, Quận 10, TP.HCM', N'nhacungcape@example.com'),
(N'Nhà Cung Cấp F', N'Số 15, Đường Trần Phú, Quận 11, TP.HCM', N'nhacungcapf@example.com'),
(N'Nhà Cung Cấp G', N'Số 30, Đường Nguyễn Huệ, Quận 1, TP.HCM', N'nhacungcapg@example.com'),
(N'Nhà Cung Cấp H', N'Số 35, Đường Lê Thánh Tôn, Quận 3, TP.HCM', N'nhacungcaph@example.com'),
(N'Nhà Cung Cấp I', N'Số 60, Đường Phan Đình Phùng, Quận Phú Nhuận, TP.HCM', N'nhacungcapi@example.com'),
(N'Nhà Cung Cấp J', N'Số 100, Đường Trương Định, Quận Tân Bình, TP.HCM', N'nhacungcapj@example.com');
GO

-- Thêm dữ liệu cho bảng SĐT Nhà Cung Cấp
INSERT INTO [dbo].[SoDienThoaiNhaCungCap] ([id], [number])
VALUES 
    (1, N'0123456811'),  -- Nhà cung cấp 1
    (1, N'0123456812'),  -- Nhà cung cấp 1
    (2, N'0123456813'),  -- Nhà cung cấp 2
    (2, N'0123456814'),  -- Nhà cung cấp 2
    (3, N'0123456815'),  -- Nhà cung cấp 3
    (3, N'0123456816'),  -- Nhà cung cấp 3
    (4, N'0123456817'),  -- Nhà cung cấp 4
    (4, N'0123456818'),  -- Nhà cung cấp 4
    (5, N'0123456819'),  -- Nhà cung cấp 5
    (5, N'0123456820'),  -- Nhà cung cấp 5
    (6, N'0123456821'),  -- Nhà cung cấp 6
    (6, N'0123456822'),  -- Nhà cung cấp 6
    (7, N'0123456823'),  -- Nhà cung cấp 7
    (7, N'0123456824'),  -- Nhà cung cấp 7
    (8, N'0123456825'),  -- Nhà cung cấp 8
    (8, N'0123456826'),  -- Nhà cung cấp 8
    (9, N'0123456827'),  -- Nhà cung cấp 9
    (9, N'0123456828'),  -- Nhà cung cấp 9
    (10, N'0123456829'), -- Nhà cung cấp 10
    (10, N'0123456830'); -- Nhà cung cấp 10
GO
--Thêm dữ liệu 
--DBCC CHECKIDENT ('SanPham', RESEED, 0);
INSERT INTO [dbo].[SanPham] ([name], [price], [description], [type])
VALUES
    -- Pizza
    (N'Pizza Margherita', 150000, N'Pizza truyền thống với sốt cà chua, phô mai mozzarella và lá húng quế tươi.', N'Pizza'),
    (N'Pizza Pepperoni', 180000, N'Pizza với lớp phủ pepperoni, phô mai mozzarella, và sốt cà chua.', N'Pizza'),
    (N'Pizza Quattro Formaggi', 200000, N'Pizza với 4 loại phô mai: mozzarella, cheddar, parmesan và gorgonzola.', N'Pizza'),
    (N'Pizza Hải Sản', 220000, N'Pizza với hải sản tươi, phô mai mozzarella, và sốt cà chua.', N'Pizza'),
    (N'Pizza Thịt Xông Khói', 210000, N'Pizza với thịt xông khói, phô mai mozzarella, và sốt cà chua.', N'Pizza'),
    (N'Pizza BBQ', 230000, N'Pizza với thịt bò nướng BBQ, hành tây, phô mai mozzarella, và sốt BBQ.', N'Pizza'),
    
	(N'Pizza Margherita', 170000, N'Pizza truyền thống với sốt cà chua, phô mai mozzarella và lá húng quế tươi.', N'Pizza'),
    (N'Pizza Pepperoni', 200000, N'Pizza với lớp phủ pepperoni, phô mai mozzarella, và sốt cà chua.', N'Pizza'),
    (N'Pizza Quattro Formaggi', 220000, N'Pizza với 4 loại phô mai: mozzarella, cheddar, parmesan và gorgonzola.', N'Pizza'),
    (N'Pizza Hải Sản', 240000, N'Pizza với hải sản tươi, phô mai mozzarella, và sốt cà chua.', N'Pizza'),
    (N'Pizza Thịt Xông Khói', 230000, N'Pizza với thịt xông khói, phô mai mozzarella, và sốt cà chua.', N'Pizza'),
    (N'Pizza BBQ', 250000, N'Pizza với thịt bò nướng BBQ, hành tây, phô mai mozzarella, và sốt BBQ.', N'Pizza'),

	(N'Pizza Margherita', 190000, N'Pizza truyền thống với sốt cà chua, phô mai mozzarella và lá húng quế tươi.', N'Pizza'),
    (N'Pizza Pepperoni', 220000, N'Pizza với lớp phủ pepperoni, phô mai mozzarella, và sốt cà chua.', N'Pizza'),
    (N'Pizza Quattro Formaggi', 240000, N'Pizza với 4 loại phô mai: mozzarella, cheddar, parmesan và gorgonzola.', N'Pizza'),
    (N'Pizza Hải Sản', 260000, N'Pizza với hải sản tươi, phô mai mozzarella, và sốt cà chua.', N'Pizza'),
    (N'Pizza Thịt Xông Khói', 250000, N'Pizza với thịt xông khói, phô mai mozzarella, và sốt cà chua.', N'Pizza'),
    (N'Pizza BBQ', 250000, N'Pizza với thịt bò nướng BBQ, hành tây, phô mai mozzarella, và sốt BBQ.', N'Pizza'),
    
	-- Đồ ăn đi kèm
    (N'Khoai tây chiên', 35000, N'Khoai tây chiên giòn, phục vụ với sốt ketchup và sốt mayonnaise.', N'Đồ ăn đi kèm'),
    (N'Gà rán', 60000, N'Gà rán giòn, phục vụ với sốt mật ong hoặc sốt cay.', N'Đồ ăn đi kèm'),
    (N'Salad Caesar', 50000, N'Salad tươi với xà lách, phô mai, croutons và nước sốt Caesar.', N'Đồ ăn đi kèm'),
    (N'Súp Cà Chua', 45000, N'Súp cà chua nóng, được chế biến từ cà chua tươi và các gia vị tự nhiên.', N'Đồ ăn đi kèm'),
    
	(N'Khoai tây chiên', 4000, N'Khoai tây chiên giòn, phục vụ với sốt ketchup và sốt mayonnaise.', N'Đồ ăn đi kèm'),
    (N'Gà rán', 65000, N'Gà rán giòn, phục vụ với sốt mật ong hoặc sốt cay.', N'Đồ ăn đi kèm'),
    (N'Salad Caesar', 55000, N'Salad tươi với xà lách, phô mai, croutons và nước sốt Caesar.', N'Đồ ăn đi kèm'),
    (N'Súp Cà Chua', 50000, N'Súp cà chua nóng, được chế biến từ cà chua tươi và các gia vị tự nhiên.', N'Đồ ăn đi kèm'),

	(N'Khoai tây chiên', 45000, N'Khoai tây chiên giòn, phục vụ với sốt ketchup và sốt mayonnaise.', N'Đồ ăn đi kèm'),
    (N'Gà rán', 70000, N'Gà rán giòn, phục vụ với sốt mật ong hoặc sốt cay.', N'Đồ ăn đi kèm'),
    (N'Salad Caesar', 60000, N'Salad tươi với xà lách, phô mai, croutons và nước sốt Caesar.', N'Đồ ăn đi kèm'),
    (N'Súp Cà Chua', 55000, N'Súp cà chua nóng, được chế biến từ cà chua tươi và các gia vị tự nhiên.', N'Đồ ăn đi kèm'),

    -- Nước uống
    (N'Nước suối', 15000, N'Nước khoáng tinh khiết, đóng chai.', N'Đồ uống'),
    (N'Nước ngọt Coca-Cola', 20000, N'Nước ngọt Coca-Cola đóng chai.', N'Đồ uống'),
	(N'Nước ngọt Pepsi', 20000, N'Nước ngọt Pepsi đóng chai.', N'Đồ uống');

	-- Món ăn (Pizza)
INSERT INTO [dbo].[MonAn] ([id], [size])
VALUES
    (1, N'Nhỏ'),  -- Pizza Margherita
    (2, N'Nhỏ'),  -- Pizza Pepperoni
    (3, N'Nhỏ'),  -- Pizza Quattro Formaggi
    (4, N'Nhỏ'),  -- Pizza Hải Sản
    (5, N'Nhỏ'),  -- Pizza Thịt Xông Khói
    (6, N'Nhỏ'),  -- Pizza BBQ

    (7, N'Vừa'),  -- Pizza Margherita
    (8, N'Vừa'),  -- Pizza Pepperoni
    (9, N'Vừa'),  -- Pizza Quattro Formaggi
    (10, N'Vừa'), -- Pizza Hải Sản
    (11, N'Vừa'), -- Pizza Thịt Xông Khói
    (12, N'Vừa'), -- Pizza BBQ

    (13, N'Lớn'), -- Pizza Margherita
    (14, N'Lớn'), -- Pizza Pepperoni
    (15, N'Lớn'), -- Pizza Quattro Formaggi
    (16, N'Lớn'), -- Pizza Hải Sản
    (17, N'Lớn'), -- Pizza Thịt Xông Khói
    (18, N'Lớn'); -- Pizza BBQ

-- Đồ ăn đi kèm
INSERT INTO [dbo].[MonAn] ([id], [size])
VALUES
    (19, N'Nhỏ'),  -- Khoai tây chiên
    (20, N'Nhỏ'),  -- Gà rán
    (21, N'Nhỏ'),  -- Salad Caesar
    (22, N'Nhỏ'),  -- Súp Cà Chua

    (23, N'Vừa'),  -- Khoai tây chiên
    (24, N'Vừa'),  -- Gà rán
    (25, N'Vừa'),  -- Salad Caesar
    (26, N'Vừa'),  -- Súp Cà Chua

    (27, N'Lớn'),  -- Khoai tây chiên
    (28, N'Lớn'),  -- Gà rán
    (29, N'Lớn'),  -- Salad Caesar
    (30, N'Lớn');  -- Súp Cà Chua

	-- Đồ uống
INSERT INTO [dbo].[DoUong] ([id], [buyDate], [endDate], [cost], [supplierId])
VALUES
    (1, CURRENT_TIMESTAMP, DATEADD(MONTH, 6, CURRENT_TIMESTAMP), 15000, 1),  -- Nước suối
    (2, CURRENT_TIMESTAMP, DATEADD(MONTH, 6, CURRENT_TIMESTAMP), 20000, 2),  -- Nước ngọt Coca-Cola
    (3, CURRENT_TIMESTAMP, DATEADD(MONTH, 6, CURRENT_TIMESTAMP), 20000, 3);  -- Nước ngọt Pepsi
GO
-- Cửa hàng lớn (storeId 1 và 4) bán tất cả các sản phẩm
INSERT INTO [dbo].[sanPham_Tai_CuaHang] ([storeId], [productId], [number])
VALUES
    -- Pizza
    (1, 1, 100), (1, 2, 100), (1, 3, 100), (1, 4, 100), (1, 5, 100), (1, 6, 100),
    (1, 7, 100), (1, 8, 100), (1, 9, 100), (1, 10, 100), (1, 11, 100), (1, 12, 100),
    (1, 13, 100), (1, 14, 100), (1, 15, 100), (1, 16, 100), (1, 17, 100), (1, 18, 100),
    
    -- Đồ ăn đi kèm
    (1, 19, 50), (1, 20, 50), (1, 21, 50), (1, 22, 50), (1, 23, 50), (1, 24, 50),
    (1, 25, 50), (1, 26, 50), (1, 27, 50), (1, 28, 50), (1, 29, 50), (1, 30, 50),
    
    -- Nước uống
    (1, 31, 100), (1, 32, 100), (1, 33, 100),

    -- Cửa hàng 4 bán tất cả các sản phẩm
    (4, 1, 100), (4, 2, 100), (4, 3, 100), (4, 4, 100), (4, 5, 100), (4, 6, 100),
    (4, 7, 100), (4, 8, 100), (4, 9, 100), (4, 10, 100), (4, 11, 100), (4, 12, 100),
    (4, 13, 100), (4, 14, 100), (4, 15, 100), (4, 16, 100), (4, 17, 100), (4, 18, 100),
    (4, 19, 50), (4, 20, 50), (4, 21, 50), (4, 22, 50), (4, 23, 50), (4, 24, 50),
    (4, 25, 50), (4, 26, 50), (4, 27, 50), (4, 28, 50), (4, 29, 50), (4, 30, 50),
    (4, 31, 100), (4, 32, 100), (4, 33, 100);

-- Cửa hàng 2
INSERT INTO [dbo].[sanPham_Tai_CuaHang] ([storeId], [productId], [number])
VALUES
    -- Pizza (3 loại)
    (2, 1, 50), (2, 2, 50), (2, 3, 50), -- 3 kích thước của pizza Margherita, Pepperoni, Quattro Formaggi
    (2, 7, 50), (2, 8, 50), (2, 9, 50),
	(2, 13, 50), (2, 14, 50), (2, 15, 50),
    -- Món ăn kèm (đầy đủ)
    (2, 19, 30), (2, 20, 30), (2, 21, 30), (2, 22, 30), (2, 23, 30), (2, 24, 30),
    (2, 25, 30), (2, 26, 30), (2, 27, 30), (2, 28, 30), (2, 29, 30), (2, 30, 30),

    -- Nước uống (đầy đủ)
    (2, 31, 100), (2, 32, 100), (2, 33, 100);

-- Cửa hàng 3
INSERT INTO [dbo].[sanPham_Tai_CuaHang] ([storeId], [productId], [number])
VALUES
    -- Pizza (4 loại)
    (3, 4, 50), (3, 5, 50), (3, 6, 50),
	(3, 10, 50), (3, 11, 50), (3, 12, 50),
    (3, 16, 50), (3, 17, 50), (3, 18, 50),

    -- Món ăn kèm (đầy đủ)
    (3, 19, 30), (3, 20, 30), (3, 21, 30), (3, 22, 30), (3, 23, 30), (3, 24, 30),
    (3, 25, 30), (3, 26, 30), (3, 27, 30), (3, 28, 30), (3, 29, 30), (3, 30, 30),

    -- Nước uống (đầy đủ)
    (3, 31, 100), (3, 32, 100), (3, 33, 100);

-- Cửa hàng 5
INSERT INTO [dbo].[sanPham_Tai_CuaHang] ([storeId], [productId], [number])
VALUES
    -- Pizza (3 loại)
    (5, 1, 50), (5, 5, 50), (5, 6, 50), -- 3 kích thước của pizza Margherita, Pepperoni, Quattro Formaggi
    (5, 7, 50), (5, 11, 50), (5, 12, 50),
	(5, 13, 50), (5, 17, 50), (5, 18, 50),
    -- Món ăn kèm (đầy đủ)
    (5, 19, 30), (5, 20, 30), (5, 21, 30), (5, 22, 30), (5, 23, 30), (5, 24, 30),
    (5, 25, 30), (5, 26, 30), (5, 27, 30), (5, 28, 30), (5, 29, 30), (5, 30, 30),

    -- Nước uống (đầy đủ)
    (5, 31, 100), (5, 32, 100), (5, 33, 100);

-- Cửa hàng 6
INSERT INTO [dbo].[sanPham_Tai_CuaHang] ([storeId], [productId], [number])
VALUES
    -- Pizza (3 loại)
    (6, 2, 50), (6, 3, 50), (6, 4, 50), -- 3 kích thước của pizza Margherita, Pepperoni, Quattro Formaggi
    (6, 8, 50), (6, 9, 50), (6, 10, 50),
	(6, 14, 50), (6, 15, 50), (6, 16, 50),
    -- Món ăn kèm (đầy đủ)
    (6, 19, 30), (6, 20, 30), (6, 21, 30), (6, 22, 30), (6, 23, 30), (6, 24, 30),
    (6, 25, 30), (6, 26, 30), (6, 27, 30), (6, 28, 30), (6, 29, 30), (6, 30, 30),

    -- Nước uống (đầy đủ)
    (6, 31, 100), (6, 32, 100), (6, 33, 100);
GO

-- Thêm dữ liệu cho bảng nhaCungCap_NguyenLieu_CuaHang
-- Cửa hàng 1 (nguyên liệu từ 1 đến 9)
INSERT INTO [dbo].[nhaCungCap_NguyenLieu_CuaHang] ([storeId], [supplierId], [ingredientId])
VALUES
    (1, 1, 1), (1, 1, 2), (1, 2, 3), (1, 2, 4), (1, 3, 5),
    (1, 3, 6), (1, 4, 7), (1, 4, 8), (1, 5, 9);

-- Cửa hàng 2 (nguyên liệu từ 10 đến 18)
INSERT INTO [dbo].[nhaCungCap_NguyenLieu_CuaHang] ([storeId], [supplierId], [ingredientId])
VALUES
    (2, 6, 10), (2, 6, 11), (2, 7, 12), (2, 7, 13), (2, 8, 14),
    (2, 8, 15), (2, 9, 16), (2, 9, 17), (2, 10, 18);

-- Cửa hàng 3 (nguyên liệu từ 19 đến 27)
INSERT INTO [dbo].[nhaCungCap_NguyenLieu_CuaHang] ([storeId], [supplierId], [ingredientId])
VALUES
    (3, 1, 19), (3, 1, 20), (3, 2, 21), (3, 2, 22), (3, 3, 23),
    (3, 3, 24), (3, 4, 25), (3, 4, 26), (3, 5, 27);

-- Cửa hàng 4 (nguyên liệu từ 28 đến 36)
INSERT INTO [dbo].[nhaCungCap_NguyenLieu_CuaHang] ([storeId], [supplierId], [ingredientId])
VALUES
    (4, 6, 28), (4, 6, 29), (4, 7, 30), (4, 7, 31), (4, 8, 32),
    (4, 8, 33), (4, 9, 34), (4, 9, 35), (4, 10, 36);

-- Cửa hàng 5 (nguyên liệu từ 37 đến 45)
INSERT INTO [dbo].[nhaCungCap_NguyenLieu_CuaHang] ([storeId], [supplierId], [ingredientId])
VALUES
    (5, 1, 37), (5, 1, 38), (5, 2, 39), (5, 2, 40), (5, 3, 41),
    (5, 3, 42), (5, 4, 43), (5, 4, 44), (5, 5, 45);

-- Cửa hàng 6 (nguyên liệu từ 46 đến 54)
INSERT INTO [dbo].[nhaCungCap_NguyenLieu_CuaHang] ([storeId], [supplierId], [ingredientId])
VALUES
    (6, 6, 46), (6, 6, 47), (6, 7, 48), (6, 7, 49), (6, 8, 50),
    (6, 8, 51), (6, 9, 52), (6, 9, 53), (6, 10, 54);
GO

-- Thêm dữ liệu cho bảng đơn hàng
INSERT INTO [dbo].[DonHang] ([orderTime], [paymentMethod])
VALUES
    ('2024-12-11 08:30:00', N'Trả tiền mặt'),
    ('2024-12-11 09:00:00', N'Trả qua thẻ tín dụng'),
    ('2024-12-11 09:30:00', N'Trả tiền mặt'),
    ('2024-12-11 10:00:00', N'Trả qua ví điện tử'),
    ('2024-12-11 10:30:00', N'Trả qua thẻ tín dụng'),
    ('2024-12-11 11:00:00', N'Trả tiền mặt'),
    ('2024-12-11 11:30:00', N'Trả qua ví điện tử'),
    ('2024-12-11 12:00:00', N'Trả tiền mặt'),
    ('2024-12-11 12:30:00', N'Trả qua thẻ tín dụng'),
    ('2024-12-11 13:00:00', N'Trả qua ví điện tử');
GO

-- Tạo dữ liệu cho bảng sanPham_Tren_DonHang
INSERT INTO [dbo].[sanPham_Tren_DonHang] ([orderId], [productId], [number], [cost])
VALUES
    -- Đơn hàng 1
    (1, 1, 2, 150000),   -- Pizza Margherita x 2
    (1, 27, 1, 45000),   -- Khoai tây chiên x 1

    -- Đơn hàng 2
    (2, 2, 1, 180000),   -- Pizza Pepperoni x 1
    (2, 20, 1, 60000),   -- Gà rán x 1
    (2, 32, 1, 20000),   -- Nước ngọt Coca-Cola x 1

    -- Đơn hàng 3
    (3, 3, 2, 200000),   -- Pizza Quattro Formaggi x 2
    (3, 26, 1, 50000),   -- Súp Cà Chua x 1

    -- Đơn hàng 4
    (4, 10, 1, 240000),   -- Pizza Hải Sản x 1
    (4, 25, 1, 55000),   -- Salad Caesar x 1

    -- Đơn hàng 5
    (5, 5, 2, 210000),   -- Pizza Thịt Xông Khói x 2
    (5, 27, 1, 45000),   -- Khoai tây chiên x 1
	
    -- Đơn hàng 6
    (6, 12, 1, 250000),   -- Pizza BBQ x 1
    (6, 20, 1, 60000),   -- Gà rán x 1
    (6, 31, 1, 15000),   -- Nước suối x 1

    -- Đơn hàng 7
    (7, 7, 3, 170000),   -- Pizza Margherita x 3
    (7, 21, 1, 50000),   -- Salad Caesar x 1

    -- Đơn hàng 8
    (8, 8, 2, 200000),   -- Pizza Pepperoni x 2
    (8, 26, 1, 50000),   -- Súp Cà Chua x 1

    -- Đơn hàng 9
    (9, 9, 1, 220000),   -- Pizza Quattro Formaggi x 1
    (9, 25, 1, 55000),   -- Salad Caesar x 1
    (9, 33, 1, 20000),   -- Nước ngọt Pepsi x 1

    -- Đơn hàng 10
    (10, 16, 2, 260000),  -- Pizza Hải Sản x 2
    (10, 28, 1, 70000),   -- Gà rán x 1
    (10, 32, 1, 20000);   -- Nước ngọt Coca-Cola x 1
GO


INSERT INTO [dbo].[donHang_SaleTai_CuaHang] ([salerId], [orderId], [storeId])
VALUES
    -- Cửa hàng 1
    (21, 1, 1),   -- Nhân viên bán hàng 21 bán đơn hàng 1 tại cửa hàng 1
    (22, 2, 1),   -- Nhân viên bán hàng 22 bán đơn hàng 2 tại cửa hàng 1
    (23, 3, 1),   -- Nhân viên bán hàng 23 bán đơn hàng 3 tại cửa hàng 1
    -- Cửa hàng 2
    (24, 7, 2),   -- Nhân viên bán hàng 24 bán đơn hàng 7 tại cửa hàng 2
    -- Cửa hàng 3
    (27, 10, 3),   -- Nhân viên bán hàng 27 bán đơn hàng 10 tại cửa hàng 3
    -- Cửa hàng 4
    (30, 4, 4),   -- Nhân viên bán hàng 36 bán đơn hàng 4 tại cửa hàng 4
    (31, 6, 4),   -- Nhân viên bán hàng 37 bán đơn hàng 6 tại cửa hàng 4
    -- Cửa hàng 5
    (34, 5, 5),   -- Nhân viên bán hàng 34 bán đơn hàng 5 tại cửa hàng 5
    -- Cửa hàng 6
	(37, 8, 6),   -- Nhân viên bán hàng 37 bán đơn hàng 8 tại cửa hàng 6
    (38, 9, 6);  -- Nhân viên bán hàng 38 bán đơn hàng 9 tại cửa hàng 6
GO


-- Thêm dữ liệu cho bảng ThietBi với thiết bị bếp, bàn ghế, máy tính và đèn
INSERT INTO [dbo].[ThietBi] ([id], [type], [startDate], [endDate], [number], [cost])
VALUES
    -- Cửa hàng 1 (nhiều thiết bị hơn)
    (1, N'Máy xay sinh tố', '2023-01-01', '2025-01-01', 5, 1500000),   -- Máy xay sinh tố x 5
    (1, N'Bàn ăn', '2023-01-01', '2027-01-01', 10, 5000000),           -- Bàn ăn x 10
    (1, N'Máy nướng bánh', '2023-02-01', '2026-02-01', 3, 12000000),    -- Máy nướng bánh x 3
    (1, N'Tủ lạnh', '2023-03-01', '2026-03-01', 7, 10000000),          -- Tủ lạnh x 7
    (1, N'Đèn chiếu sáng', '2023-04-01', '2025-04-01', 15, 2000000),    -- Đèn chiếu sáng x 15
    (1, N'Máy tính', '2023-05-01', '2026-05-01', 4, 8000000),           -- Máy tính x 4
    (1, N'Máy rửa bát', '2023-06-01', '2025-06-01', 3, 5000000),        -- Máy rửa bát x 3
    (1, N'Kệ đựng bát', '2023-07-01', '2026-07-01', 8, 1500000),        -- Kệ đựng bát x 8

    -- Cửa hàng 2 (đầy đủ thiết bị)
    (2, N'Máy xay sinh tố', '2023-06-01', '2025-06-01', 6, 1700000),    -- Máy xay sinh tố x 6
    (2, N'Bàn ăn', '2023-07-01', '2027-07-01', 12, 4500000),           -- Bàn ăn x 12
    (2, N'Máy nướng bánh', '2023-08-01', '2026-08-01', 4, 13000000),    -- Máy nướng bánh x 4
    (2, N'Tủ lạnh', '2023-09-01', '2026-09-01', 5, 9000000),           -- Tủ lạnh x 5
    (2, N'Máy tính', '2023-10-01', '2026-10-01', 4, 8000000),           -- Máy tính x 4
    (2, N'Đèn chiếu sáng', '2023-11-01', '2026-11-01', 10, 2200000),    -- Đèn chiếu sáng x 10

    -- Cửa hàng 3 (đầy đủ thiết bị)
    (3, N'Máy xay sinh tố', '2023-10-01', '2025-10-01', 7, 1600000),    -- Máy xay sinh tố x 7
    (3, N'Bàn ăn', '2023-11-01', '2027-11-01', 8, 5500000),           -- Bàn ăn x 8
    (3, N'Máy nướng bánh', '2023-12-01', '2026-12-01', 5, 11000000),   -- Máy nướng bánh x 5
    (3, N'Đèn chiếu sáng', '2024-01-01', '2026-01-01', 18, 2200000),   -- Đèn chiếu sáng x 18
    (3, N'Máy tính', '2024-02-01', '2026-02-01', 4, 8500000),           -- Máy tính x 4
    (3, N'Máy rửa bát', '2024-03-01', '2025-03-01', 4, 6000000),        -- Máy rửa bát x 4

    -- Cửa hàng 4 (nhiều thiết bị hơn)
    (4, N'Máy xay sinh tố', '2024-02-01', '2026-02-01', 4, 1400000),    -- Máy xay sinh tố x 4
    (4, N'Bàn ăn', '2024-03-01', '2027-03-01', 9, 6000000),            -- Bàn ăn x 9
    (4, N'Máy nướng bánh', '2024-04-01', '2026-04-01', 6, 12500000),    -- Máy nướng bánh x 6
    (4, N'Tủ lạnh', '2024-05-01', '2026-05-01', 8, 11000000),          -- Tủ lạnh x 8
    (4, N'Máy tính', '2024-06-01', '2026-06-01', 5, 8500000),           -- Máy tính x 5
    (4, N'Đèn chiếu sáng', '2024-07-01', '2026-07-01', 20, 2200000),    -- Đèn chiếu sáng x 20
    (4, N'Máy rửa bát', '2024-08-01', '2025-08-01', 4, 5500000),        -- Máy rửa bát x 4
    (4, N'Kệ đựng bát', '2024-09-01', '2027-09-01', 7, 1800000),        -- Kệ đựng bát x 7

    -- Cửa hàng 5 (đầy đủ thiết bị)
    (5, N'Máy xay sinh tố', '2024-06-01', '2025-06-01', 5, 1500000),    -- Máy xay sinh tố x 5
    (5, N'Bàn ăn', '2024-07-01', '2027-07-01', 10, 5200000),           -- Bàn ăn x 10
    (5, N'Máy nướng bánh', '2024-08-01', '2026-08-01', 3, 13500000),    -- Máy nướng bánh x 3
    (5, N'Đèn chiếu sáng', '2024-09-01', '2025-09-01', 12, 2500000),    -- Đèn chiếu sáng x 12
    (5, N'Máy tính', '2024-10-01', '2026-10-01', 4, 7500000),           -- Máy tính x 4

    -- Cửa hàng 6 (đầy đủ thiết bị)
    (6, N'Máy xay sinh tố', '2024-10-01', '2026-10-01', 6, 1600000),    -- Máy xay sinh tố x 6
    (6, N'Bàn ăn', '2024-11-01', '2027-11-01', 14, 4500000),           -- Bàn ăn x 14
    (6, N'Máy nướng bánh', '2024-12-01', '2026-12-01', 8, 13000000),    -- Máy nướng bánh x 8
    (6, N'Tủ lạnh', '2025-01-01', '2027-01-01', 5, 9500000),           -- Tủ lạnh x 5
    (6, N'Đèn chiếu sáng', '2025-02-01', '2027-02-01', 10, 2200000),   -- Đèn chiếu sáng x 10
	(6, N'Máy tính', '2024-10-01', '2026-10-01', 4, 7500000);           -- Máy tính x 4
GO

-------------------------------------------------------------------------------------------------------------------------------------------------
--Thêm các ràng buộc khóa ngoại

-- AddForeignKey
ALTER TABLE [dbo].[NhanVien] ADD CONSTRAINT [NhanVien_storeId_fkey] FOREIGN KEY ([storeId]) REFERENCES [dbo].[CuaHang]([id]) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[QuanLy] ADD CONSTRAINT [QuanLy_id_fkey] FOREIGN KEY ([id]) REFERENCES [dbo].[NhanVien]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[BanHang] ADD CONSTRAINT [BanHang_id_fkey] FOREIGN KEY ([id]) REFERENCES [dbo].[NhanVien]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[CheBien] ADD CONSTRAINT [CheBien_id_fkey] FOREIGN KEY ([id]) REFERENCES [dbo].[NhanVien]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[CuaHang] ADD CONSTRAINT [CuaHang_managerId_fkey] FOREIGN KEY ([managerId]) REFERENCES [dbo].[QuanLy]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[CuaHang] ADD CONSTRAINT [CuaHang_monitorStoreId_fkey] FOREIGN KEY ([monitorStoreId]) REFERENCES [dbo].[CuaHang]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[SoDienThoaiCuaHang] ADD CONSTRAINT [SoDienThoaiCuaHang_id_fkey] FOREIGN KEY ([id]) REFERENCES [dbo].[CuaHang]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[ThietBi] ADD CONSTRAINT [ThietBi_id_fkey] FOREIGN KEY ([id]) REFERENCES [dbo].[CuaHang]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[MonAn] ADD CONSTRAINT [MonAn_id_fkey] FOREIGN KEY ([id]) REFERENCES [dbo].[SanPham]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[DoUong] ADD CONSTRAINT [DoUong_id_fkey] FOREIGN KEY ([id]) REFERENCES [dbo].[SanPham]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[DoUong] ADD CONSTRAINT [DoUong_supplierId_fkey] FOREIGN KEY ([supplierId]) REFERENCES [dbo].[NhaCungCap]([id]) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[SoDienThoaiNhaCungCap] ADD CONSTRAINT [SoDienThoaiNhaCungCap_id_fkey] FOREIGN KEY ([id]) REFERENCES [dbo].[NhaCungCap]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[sanPham_Tai_CuaHang] ADD CONSTRAINT [sanPham_Tai_CuaHang_storeId_fkey] FOREIGN KEY ([storeId]) REFERENCES [dbo].[CuaHang]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[sanPham_Tai_CuaHang] ADD CONSTRAINT [sanPham_Tai_CuaHang_productId_fkey] FOREIGN KEY ([productId]) REFERENCES [dbo].[SanPham]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[sanPham_Tren_DonHang] ADD CONSTRAINT [sanPham_Tren_DonHang_orderId_fkey] FOREIGN KEY ([orderId]) REFERENCES [dbo].[DonHang]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[sanPham_Tren_DonHang] ADD CONSTRAINT [sanPham_Tren_DonHang_productId_fkey] FOREIGN KEY ([productId]) REFERENCES [dbo].[SanPham]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[donHang_SaleTai_CuaHang] ADD CONSTRAINT [donHang_SaleTai_CuaHang_salerId_fkey] FOREIGN KEY ([salerId]) REFERENCES [dbo].[BanHang]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[donHang_SaleTai_CuaHang] ADD CONSTRAINT [donHang_SaleTai_CuaHang_orderId_fkey] FOREIGN KEY ([orderId]) REFERENCES [dbo].[DonHang]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[donHang_SaleTai_CuaHang] ADD CONSTRAINT [donHang_SaleTai_CuaHang_storeId_fkey] FOREIGN KEY ([storeId]) REFERENCES [dbo].[CuaHang]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE [dbo].[nhaCungCap_NguyenLieu_CuaHang] ADD CONSTRAINT [nhaCungCap_NguyenLieu_CuaHang_storeId_fkey] FOREIGN KEY ([storeId]) REFERENCES [dbo].[CuaHang]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[nhaCungCap_NguyenLieu_CuaHang] ADD CONSTRAINT [nhaCungCap_NguyenLieu_CuaHang_supplierId_fkey] FOREIGN KEY ([supplierId]) REFERENCES [dbo].[NhaCungCap]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[nhaCungCap_NguyenLieu_CuaHang] ADD CONSTRAINT [nhaCungCap_NguyenLieu_CuaHang_ingredientId_fkey] FOREIGN KEY ([ingredientId]) REFERENCES [dbo].[NguyenLieu]([id]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Auth] ADD CONSTRAINT [Auth_storeId_fkey] FOREIGN KEY ([storeId]) REFERENCES [dbo].[CuaHang]([id]) ON DELETE SET NULL ON UPDATE CASCADE;
GO

--create Function ở đây
CREATE FUNCTION [dbo].[Example]()
RETURNS Table 
AS
	RETURN 
	SELECT * FROM [dbo].[NhanVien];
GO
CREATE FUNCTION dbo.GetNguyenLieuNhaCungCapByStoreId (@storeId INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        nl.id AS NguyenLieuId,
        nl.name AS NguyenLieuName,
        nl.type AS NguyenLieuType,
        nl.buyDate AS NguyenLieuBuyDate,
        nl.endDate AS NguyenLieuEndDate,
        nl.number AS NguyenLieuNumber,
        nl.unit AS NguyenLieuUnit,
        nl.cost AS NguyenLieuCost,
        ncc.name AS NhaCungCapName
    FROM 
        dbo.NguyenLieu nl
    JOIN 
        dbo.nhaCungCap_NguyenLieu_CuaHang ncc_nl ON nl.id = ncc_nl.ingredientId
    JOIN 
        dbo.NhaCungCap ncc ON ncc.id = ncc_nl.supplierId
    WHERE 
        ncc_nl.storeId = @storeId
);
GO

CREATE FUNCTION [dbo].[GetProductsInStore] (@storeId INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        sp.id AS product_id,
        sp.name AS product_name,
        sp.price AS product_price,
		sp.type AS product_type,
        spc.number AS available_quantity
    FROM 
        dbo.SanPham sp
    JOIN 
        dbo.sanPham_Tai_CuaHang spc ON sp.id = spc.productId
    WHERE 
        spc.storeId = @storeId
);
GO

CREATE FUNCTION [dbo].[GetEmployeeInfo] 
(
    @employeeId INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        nv.id AS EmployeeId,
        nv.name AS EmployeeName,
        nv.birthday AS EmployeeBirthday,
        nv.salary AS EmployeeSalary,
        nv.startDate AS EmployeeStartDate,
        nv.phone AS EmployeePhone,
        nv.role AS EmployeeRole,
        nv.dayOff AS EmployeeDayOff,
        ql.degree AS Degree,
        bh.trainingTime AS TrainingTime,
        cb.kinhNghiem AS Experience,
        cb.vaiTro AS RoleInCooking
    FROM 
        dbo.NhanVien nv
    LEFT JOIN 
        dbo.QuanLy ql ON nv.id = ql.id
    LEFT JOIN 
        dbo.BanHang bh ON nv.id = bh.id
    LEFT JOIN 
        dbo.CheBien cb ON nv.id = cb.id
    WHERE 
        nv.id = @employeeId
);
--SELECT * FROM dbo.GetEmployeeInfo(1);
GO
CREATE FUNCTION [dbo].[GetEmployeesByStore]
(
    @storeId INT -- ID của cửa hàng
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        nv.id AS EmployeeId,
        nv.name AS EmployeeName,
        nv.birthday AS EmployeeBirthday,
        nv.salary AS EmployeeSalary,
        nv.startDate AS EmployeeStartDate,
        nv.phone AS EmployeePhone,
        nv.role AS EmployeeRole,
        nv.dayOff AS EmployeeDayOff,
        ql.degree AS Degree,
        bh.trainingTime AS TrainingTime,
        cb.kinhNghiem AS Experience,
        cb.vaiTro AS RoleInCooking
    FROM 
        dbo.NhanVien nv
    LEFT JOIN 
        dbo.QuanLy ql ON nv.id = ql.id
    LEFT JOIN 
        dbo.BanHang bh ON nv.id = bh.id
    LEFT JOIN 
        dbo.CheBien cb ON nv.id = cb.id
    WHERE 
        nv.storeId = @storeId -- Lọc theo cửa hàng
);
GO

--create Store Procedure ở đây
--------------------------------------------------
--Thủ tục cập nhật dữ liệu của nguyên liệu có ID
CREATE PROCEDURE dbo.UpdateNguyenLieuAndNhaCungCap
    @id INT,                      -- ID của nguyên vật liệu
    @name NVARCHAR(1000),          -- Tên nguyên vật liệu
    @type NVARCHAR(500),           -- Loại nguyên vật liệu
    @buyDate DATETIME2,            -- Ngày mua
    @endDate DATETIME2,            -- Ngày hết hạn
    @number DECIMAL(5,2),          -- Số lượng
    @unit NVARCHAR(20),            -- Đơn vị
    @cost MONEY,                   -- Giá
    @supplierName NVARCHAR(500),    -- Tên nhà cung cấp
	@managerId INT,
    @storeId INT
AS
BEGIN
    -- Kiểm tra xem tên nhà cung cấp có thay đổi hay không
	EXEC [sys].[sp_set_session_context] @key = N'managerId', @value = @managerId;
    EXEC [sys].[sp_set_session_context] @key = N'storeId', @value = @storeId;
    DECLARE @currentSupplierName NVARCHAR(500);
    DECLARE @supplierId INT;

    -- Lấy tên nhà cung cấp hiện tại của nguyên vật liệu từ bảng nhaCungCap_NguyenLieu_CuaHang
    SELECT @currentSupplierName = NhaCungCap.name
    FROM dbo.nhaCungCap_NguyenLieu_CuaHang
    INNER JOIN dbo.NhaCungCap ON NhaCungCap.id = nhaCungCap_NguyenLieu_CuaHang.supplierId
    WHERE nhaCungCap_NguyenLieu_CuaHang.ingredientId = @id;

    -- Nếu tên nhà cung cấp không thay đổi, bỏ qua việc kiểm tra
    IF @currentSupplierName = @supplierName
    BEGIN
        -- Cập nhật thông tin trong bảng NguyenLieu mà không cần kiểm tra nhà cung cấp
        UPDATE dbo.NguyenLieu
        SET 
            name = @name,
            type = @type,
            buyDate = @buyDate,
            endDate = @endDate,
            number = @number,
            unit = @unit,
            cost = @cost
        WHERE id = @id;
        
        -- Không cần cập nhật nhà cung cấp trong bảng nhaCungCap_NguyenLieu_CuaHang nếu tên nhà cung cấp không thay đổi
        RETURN;
    END

    -- Kiểm tra xem nhà cung cấp có tồn tại hay không nếu tên nhà cung cấp thay đổi
    SELECT @supplierId = id 
    FROM dbo.NhaCungCap
    WHERE name = @supplierName;

    -- Nếu không tìm thấy nhà cung cấp, trả về lỗi
    IF @supplierId IS NULL
    BEGIN
        RAISERROR('Nhà cung cấp "%s" không tồn tại.', 16, 1, @supplierName);
        RETURN;
    END

    -- Cập nhật thông tin trong bảng NguyenLieu
    UPDATE dbo.NguyenLieu
    SET 
        name = @name,
        type = @type,
        buyDate = @buyDate,
        endDate = @endDate,
        number = @number,
        unit = @unit,
        cost = @cost
    WHERE id = @id;

    -- Cập nhật lại ID nhà cung cấp trong bảng nhaCungCap_NguyenLieu_CuaHang
    UPDATE dbo.nhaCungCap_NguyenLieu_CuaHang
    SET supplierId = @supplierId
    WHERE ingredientId = @id;
END;
GO
--------------------------------------------------
--Thủ tục thêm mới nguyên liệu
CREATE PROCEDURE dbo.AddNguyenLieuAndNhaCungCap
    @storeId INT,                  -- ID cửa hàng
    @name NVARCHAR(1000),          -- Tên nguyên vật liệu
    @type NVARCHAR(500),           -- Loại nguyên vật liệu
    @buyDate DATETIME2,            -- Ngày mua
    @endDate DATETIME2,            -- Ngày hết hạn
    @number DECIMAL(5,2),          -- Số lượng
    @unit NVARCHAR(20),            -- Đơn vị
    @cost MONEY,                   -- Giá
    @supplierName NVARCHAR(500),    -- Tên nhà cung cấp
	@managerId INT
AS
BEGIN
	EXEC [sys].[sp_set_session_context] @key = N'managerId', @value = @managerId;
    EXEC [sys].[sp_set_session_context] @key = N'storeId', @value = @storeId;
    DECLARE @supplierId INT;

    -- Kiểm tra xem nhà cung cấp đã tồn tại trong bảng NhaCungCap chưa
    SELECT @supplierId = id
    FROM dbo.NhaCungCap
    WHERE name = @supplierName;

    -- Nếu không tìm thấy nhà cung cấp, ném lỗi
    IF @supplierId IS NULL
    BEGIN
        RAISERROR('Nhà cung cấp "%s" không tồn tại.', 16, 1, @supplierName);
        RETURN;
    END

    -- Thêm mới nguyên vật liệu vào bảng NguyenLieu
    INSERT INTO dbo.NguyenLieu (name, type, buyDate, endDate, number, unit, cost)
    VALUES (@name, @type, @buyDate, @endDate, @number, @unit, @cost);

    -- Lấy ID của nguyên vật liệu vừa thêm vào
    DECLARE @ingredientId INT = SCOPE_IDENTITY();

    -- Liên kết nguyên vật liệu với nhà cung cấp và cửa hàng trong bảng nhaCungCap_NguyenLieu_CuaHang
    INSERT INTO dbo.nhaCungCap_NguyenLieu_CuaHang (storeId, supplierId, ingredientId)
    VALUES (@storeId, @supplierId, @ingredientId);  -- Sử dụng storeId được truyền 

	-- Trả về ID của nguyên liệu vừa thêm
    SELECT @ingredientId AS ingredientId;
END;
GO

---------------------------------------------------------
--Thủ tục delete nguyên liệu có id là x
CREATE PROCEDURE dbo.DeleteNguyenLieu
    @id INT, -- ID của nguyên liệu cần xóa
	@managerId INT,
    @storeId INT
AS
BEGIN
    -- Khởi tạo transaction
	EXEC [sys].[sp_set_session_context] @key = N'managerId', @value = @managerId;
    EXEC [sys].[sp_set_session_context] @key = N'storeId', @value = @storeId;
    BEGIN TRY
        BEGIN TRANSACTION;

        -- Kiểm tra xem nguyên liệu có tồn tại trong bảng NguyenLieu không
        IF NOT EXISTS (SELECT 1 FROM dbo.NguyenLieu WHERE id = @id)
        BEGIN
            -- Nếu nguyên liệu không tồn tại, trả về lỗi
			RAISERROR('Nguyên liệu không tồn tại.', 16, 1);
			RETURN;
        END

        -- Xóa liên kết nguyên liệu với nhà cung cấp và cửa hàng trong bảng nhaCungCap_NguyenLieu_CuaHang
        DELETE FROM dbo.nhaCungCap_NguyenLieu_CuaHang
        WHERE ingredientId = @id;

        -- Xóa nguyên liệu trong bảng NguyenLieu
        DELETE FROM dbo.NguyenLieu
        WHERE id = @id;

        -- Nếu tất cả các thao tác thành công, commit transaction
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Nếu có lỗi xảy ra, rollback transaction
        ROLLBACK TRANSACTION;

        -- Ném lỗi lại cho người gọi
        THROW;
    END CATCH
END;
GO

--thủ tục lấy doanh thu theo năm/ tháng của 1 cửa hàng
CREATE PROCEDURE GetMonthlyRevenueByStore
    @storeId INT
AS
BEGIN
    SELECT
        YEAR(DH.orderTime) AS Year,
        MONTH(DH.orderTime) AS Month,
        SUM(SPD.cost * SPD.number) AS TotalRevenue
    FROM
        DonHang DH
    INNER JOIN
        donHang_SaleTai_CuaHang DSC ON DH.id = DSC.orderId
    INNER JOIN
        sanPham_Tren_DonHang SPD ON DH.id = SPD.orderId
    WHERE
        DSC.storeId = @storeId
    GROUP BY
        YEAR(DH.orderTime),
        MONTH(DH.orderTime)
    ORDER BY
        Year DESC, Month DESC;
END
GO
--EXEC GetMonthlyRevenueByStore @storeId = 1;

-- Tạo hàm thêm tài khoản vào bảng Auth

CREATE PROCEDURE AddAccount
    @Email NVARCHAR(100),
    @Password NVARCHAR(255),
    @StoreId INT,
    @Role NVARCHAR(50) = 'User' -- Mặc định là 'User' nếu không chỉ định
AS
BEGIN
    DECLARE @HashedPassword NVARCHAR(255);

    -- Băm mật khẩu trước khi lưu vào cơ sở dữ liệu
    SET @HashedPassword = CONVERT(NVARCHAR(255), HASHBYTES('SHA2_256', CONVERT(NVARCHAR(255), @Password)), 2);

    -- Thêm tài khoản vào bảng Auth với role
    INSERT INTO [dbo].[Auth] (email, password, storeId, role)
    VALUES (@Email, @HashedPassword, @StoreId, @Role);
END
GO
EXEC AddAccount @Email = 'user@example.com', @Password = 'password123', @StoreId = 1, @Role= 'User';
EXEC AddAccount @Email = 'admin@example.com', @Password = 'password', @StoreId = 1, @Role= 'Admin';
GO

CREATE PROCEDURE GetPasswordAndStoreIdByEmail
    @Email NVARCHAR(100),
    @Password NVARCHAR(255) -- Mật khẩu người dùng nhập vào
AS
BEGIN
    -- Tạo băm SHA-256 cho mật khẩu người dùng nhập vào
    DECLARE @HashedPassword NVARCHAR(255);
    
    SET @HashedPassword = CONVERT(NVARCHAR(255), HASHBYTES('SHA2_256', CONVERT(NVARCHAR(255), @Password)), 2);

    -- Kiểm tra nếu mật khẩu đã băm trùng khớp với mật khẩu trong cơ sở dữ liệu
    SELECT 
        password, 
        storeId, 
        role
    FROM [dbo].[Auth]
    WHERE email = @Email AND password = @HashedPassword;
END
GO

-----------------------------------------thêm đơn hàng
CREATE PROCEDURE [dbo].[ThemDonHang]
    @salerId INT,
    @storeId INT,
    @paymentMethod NVARCHAR(100),
    @orderTime DATETIME2 = NULL, -- Thời gian đặt hàng, mặc định là NULL sẽ sử dụng thời gian hiện tại
    @productIds NVARCHAR(MAX),   -- Danh sách các productId, cách nhau bởi dấu phẩy, ví dụ 1,2,3,4, (cần có dấu phẩy cuối)
    @quantities NVARCHAR(MAX)    -- Danh sách các số lượng tương ứng, cách nhau bởi dấu phẩy, ví dụ 13,21,34,45, (cần có dấu phẩy cuối)
AS
BEGIN
    -- Nếu không truyền thời gian, mặc định là thời gian hiện tại
    IF @orderTime IS NULL
        SET @orderTime = CURRENT_TIMESTAMP;

    -- Tạo một ID đơn hàng mới
    DECLARE @orderId INT;

    -- Thêm đơn hàng vào bảng DonHang
    INSERT INTO [dbo].[DonHang] ([orderTime], [paymentMethod])
    VALUES (@orderTime, @paymentMethod);

    -- Lấy ID của đơn hàng vừa tạo
    SET @orderId = SCOPE_IDENTITY();

    -- Thêm thông tin của sản phẩm vào bảng sanPham_Tren_DonHang
    DECLARE @productId INT, @quantity INT;
    DECLARE @productIdList NVARCHAR(MAX) = @productIds;
    DECLARE @quantityList NVARCHAR(MAX) = @quantities;

    -- Tạo bảng tạm để chứa thông tin sản phẩm và số lượng
    WHILE CHARINDEX(',', @productIdList) > 0
    BEGIN
        -- Lấy productId
        SET @productId = CAST(SUBSTRING(@productIdList, 1, CHARINDEX(',', @productIdList) - 1) AS INT);
        SET @productIdList = SUBSTRING(@productIdList, CHARINDEX(',', @productIdList) + 1, LEN(@productIdList));

        -- Lấy quantity
        SET @quantity = CAST(SUBSTRING(@quantityList, 1, CHARINDEX(',', @quantityList) - 1) AS INT);
        SET @quantityList = SUBSTRING(@quantityList, CHARINDEX(',', @quantityList) + 1, LEN(@quantityList));

        -- Lấy giá của sản phẩm từ bảng SanPham
        DECLARE @cost MONEY;
        SELECT @cost = [price] FROM [dbo].[SanPham] WHERE [id] = @productId;

        -- Thêm sản phẩm vào bảng sanPham_Tren_DonHang (bao gồm orderId)
        INSERT INTO [dbo].[sanPham_Tren_DonHang] ([orderId], [productId], [number], [cost])
        VALUES (@orderId, @productId, @quantity, @cost);

        -- Cập nhật số lượng sản phẩm trong bảng sanPham_Tai_CuaHang
        UPDATE [dbo].[sanPham_Tai_CuaHang]
        SET [number] = [number] - @quantity
        WHERE [storeId] = @storeId AND [productId] = @productId;
    END

    -- Thêm thông tin nhân viên bán hàng và cửa hàng vào bảng donHang_SaleTai_CuaHang
    INSERT INTO [dbo].[donHang_SaleTai_CuaHang] ([orderId], [salerId], [storeId])
    VALUES (@orderId, @salerId, @storeId);

    -- Trả về ID của đơn hàng vừa tạo
    SELECT @orderId AS NewOrderId;
END
GO

--create procedure
CREATE PROC [dbo].[CapNhatNguyenLieu] (
    @id INT,
    @name NVARCHAR(1000),
    @type NVARCHAR(500),
    @buyDate DATETIME2,
    @endDate DATETIME2,
    @number DECIMAL(10, 2), -- Tăng độ chính xác nếu cần số lượng lớn hơn
    @unit NVARCHAR(20),
    @cost MONEY,
    @managerId INT,
    @storeId INT
)
AS
BEGIN
    -- Set session context for managerId and storeId
    EXEC [sys].[sp_set_session_context] @key = N'managerId', @value = @managerId;
    EXEC [sys].[sp_set_session_context] @key = N'storeId', @value = @storeId;

    -- Insert data into the NguyenLieu table
    INSERT INTO [dbo].[NguyenLieu] (
        [name],
        [type],
        [buyDate],
        [endDate],
        [number],
        [unit],
        [cost]
    )
    VALUES (
        @name,
        @type,
        @buyDate,
        @endDate,
        @number,
        @unit,
        @cost
    );
END
GO
GO

/*CREATE PROC [dbo].[UpdateEmployee]
(
    @employeeId INT,
    @name NVARCHAR(255),
    @birthday DATE,
    @salary DECIMAL(18, 2),
    @startDate DATE,
    @phone NVARCHAR(15),
    @role NVARCHAR(50),
    @dayOff INT,
    @degree NVARCHAR(255), -- Dành cho quản lý
    @trainingTime INT,     -- Dành cho bán hàng
    @experience NVARCHAR(255), -- Dành cho chế biến
    @roleInCooking NVARCHAR(255) -- Vai trò trong chế biến
)
RETURNS NVARCHAR(50)
AS
BEGIN
    -- Sửa thông tin trong bảng NhanVien
    UPDATE dbo.NhanVien
    SET 
        name = @name,
        birthday = @birthday,
        salary = @salary,
        startDate = @startDate,
        phone = @phone,
        role = @role,
        dayOff = @dayOff
    WHERE id = @employeeId;

    -- Sửa thông tin trong bảng Quản Lý nếu có degree
    IF @degree IS NOT NULL 
    BEGIN
        IF EXISTS (SELECT 1 FROM dbo.QuanLy WHERE id = @employeeId)
            UPDATE dbo.QuanLy SET degree = @degree WHERE id = @employeeId;
        ELSE
            INSERT INTO dbo.QuanLy (id, degree) VALUES (@employeeId, @degree);
    END

    -- Sửa thông tin trong bảng Bán Hàng nếu có trainingTime
    IF @trainingTime IS NOT NULL 
    BEGIN
        IF EXISTS (SELECT 1 FROM dbo.BanHang WHERE id = @employeeId)
            UPDATE dbo.BanHang SET trainingTime = @trainingTime WHERE id = @employeeId;
        ELSE
            INSERT INTO dbo.BanHang (id, trainingTime) VALUES (@employeeId, @trainingTime);
    END

    -- Sửa thông tin trong bảng Chế Biến nếu có kinh nghiệm hoặc vai trò
    IF @experience IS NOT NULL OR @roleInCooking IS NOT NULL
    BEGIN
        IF EXISTS (SELECT 1 FROM dbo.CheBien WHERE id = @employeeId)
            UPDATE dbo.CheBien 
            SET kinhNghiem = @experience, vaiTro = @roleInCooking 
            WHERE id = @employeeId;
        ELSE
            INSERT INTO dbo.CheBien (id, kinhNghiem, vaiTro) VALUES (@employeeId, @experience, @roleInCooking);
    END

    RETURN N'Employee updated successfully';
END;
GO*/
CREATE PROC [dbo].[AddEmployee]
(
    @name NVARCHAR(255),
    @birthday DATE,
    @salary DECIMAL(18, 2),
    @startDate DATE,
    @phone NVARCHAR(15),
    @role NVARCHAR(50),
    @dayOff INT,
    @degree NVARCHAR(255), -- Dành cho quản lý
    @trainingTime INT,     -- Dành cho bán hàng
    @experience NVARCHAR(255), -- Dành cho chế biến
    @roleInCooking NVARCHAR(255), -- Vai trò trong chế biến
    @storeID INT, -- Added storeID parameter
    @employeeId INT OUTPUT -- OUTPUT parameter to return the employee's ID
)
AS
BEGIN
    -- Thêm vào bảng NhanVien, bao gồm storeID
    INSERT INTO dbo.NhanVien (name, birthday, salary, startDate, phone, role, dayOff, storeID)
    VALUES (@name, @birthday, @salary, @startDate, @phone, @role, @dayOff, @storeID);

    SET @employeeId = SCOPE_IDENTITY(); -- Lấy ID nhân viên vừa thêm

    -- Kiểm tra và thêm vào từng bộ phận
    IF @degree IS NOT NULL 
        INSERT INTO dbo.QuanLy (id, degree) VALUES (@employeeId, @degree);

    IF @trainingTime IS NOT NULL 
        INSERT INTO dbo.BanHang (id, trainingTime) VALUES (@employeeId, @trainingTime);

    IF @experience IS NOT NULL OR @roleInCooking IS NOT NULL
        INSERT INTO dbo.CheBien (id, kinhNghiem, vaiTro) VALUES (@employeeId, @experience, @roleInCooking);
END;
GO
DECLARE @newEmployeeId INT;
GO
-- Call the stored procedure and get the new employee ID
/*EXEC [dbo].[AddEmployee] 
    @name = 'John Doe',
    @birthday = '1990-01-01',
    @salary = 50000.00,
    @startDate = '2024-01-01',
    @phone = '1234567890',
    @role = 'Bán hàng',
    @dayOff = 2,
    @degree = NULL,
    @trainingTime = 10,
    @experience = NULL,
    @roleInCooking = NULL,
    @storeID = 1, -- Specify the storeID
    @employeeId = @newEmployeeId OUTPUT;

-- Output the new employee's ID
SELECT @newEmployeeId AS NewEmployeeId;*/


--Tạo trigger ở đây
--create trigger
--Trigger tạo id tăng dần có prefix tùy chọn, fire sau khi thêm hàng mới vào [dbo].[LichSuCapNhatNguyenLieu]
CREATE TRIGGER [dbo].[UpdateId]
ON [dbo].[LichSuCapNhatNguyenLieu]
AFTER INSERT
AS
BEGIN
    -- Declare variables to hold the new ID
    DECLARE @sequence_id INT;
    DECLARE @generated_id VARCHAR(7);

    -- Insert into table1_seq to generate a new sequence ID
    INSERT INTO [dbo].[HistorySequence] DEFAULT VALUES;

    -- Get the generated sequence ID
    SET @sequence_id = SCOPE_IDENTITY();

    -- Generate the custom ID
    SET @generated_id = 'LS' + RIGHT('0000' + CAST(@sequence_id AS VARCHAR), 3);

    -- Update the new row in table1 with the generated ID
    UPDATE t
    SET t.id = @generated_id
    FROM [dbo].[LichSuCapNhatNguyenLieu] t
    INNER JOIN inserted i
    ON t.id = i.id AND t.id = '0'; -- Default value before ID assignment
END;

GO
--create trigger
--Fire sau khi thực hiện thao tác thêm sửa xóa trên [dbo].[NguyenLieu] thành công
CREATE TRIGGER [dbo].[UpdateMaterialHistory]
ON [dbo].[NguyenLieu]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Get the session context values for managerId and storeId
    DECLARE @managerId INT;
    SET @managerId = CAST(SESSION_CONTEXT(N'managerId') AS INT);

    DECLARE @storeId INT;
    SET @storeId = CAST(SESSION_CONTEXT(N'storeId') AS INT);

    DECLARE @event_type NVARCHAR(42);

	IF EXISTS(SELECT 1 FROM deleted) AND EXISTS(SELECT 1 FROM inserted)
		SET @event_type = 'UPDATE'
	ELSE IF EXISTS(SELECT 1 FROM deleted)
	    SET @event_type = 'DELETE'
		ELSE SET @event_type = 'CREATE'

	-- Handle DELETE (records in `deleted`)
    IF @event_type = 'DELETE'
    BEGIN
        -- Insert records into UpdateMaterialHistory from deleted
        INSERT INTO [dbo].[LichSuCapNhatNguyenLieu]([name], [type], [buyDate], [endDate], [number], [unit], [cost], [managerId], [storeId], [action], [updateTime])
        SELECT 
            [name], [type], [buyDate], [endDate], [number], [unit], [cost], 
            @managerId, @storeId, 
            @event_type, 
            GETDATE()
        FROM deleted;
    END

    -- Handle INSERT or UPDATE (records in `inserted`)
    IF @event_type <> 'DELETE'
    BEGIN
        -- Insert records into UpdateMaterialHistory from inserted
        INSERT INTO [dbo].[LichSuCapNhatNguyenLieu]([name], [type], [buyDate], [endDate], [number], [unit], [cost], [managerId], [storeId], [action], [updateTime])
        SELECT 
            [name], [type], [buyDate], [endDate], [number], [unit], [cost], 
            @managerId, @storeId, 
            @event_type, 
            GETDATE()
        FROM inserted;
    END
END;
GO
