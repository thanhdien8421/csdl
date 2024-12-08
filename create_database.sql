USE master;
GO
CREATE DATABASE [csdl]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'csdl', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\csdl.mdf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'csdl_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\csdl_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 WITH LEDGER = OFF
GO
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
--create table 
CREATE TABLE [dbo].[NhanVien] (
    [id] INT NOT NULL IDENTITY(1,1),
    [name] NVARCHAR(50) NOT NULL,
    [age] INT NOT NULL CONSTRAINT [NhanVien_age_df] DEFAULT 18,
    [salary] MONEY,
    [startDate] DATETIME2 NOT NULL CONSTRAINT [NhanVien_startDate_df] DEFAULT CURRENT_TIMESTAMP,
    [phone] NVARCHAR(20),
    [role] NVARCHAR(50),
    [dayOff] INT NOT NULL CONSTRAINT [NhanVien_dayOff_df] DEFAULT 0,
    [storeId] INT,
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
    CONSTRAINT [SoDienThoaiCuaHang_id_key] UNIQUE NONCLUSTERED ([id])
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
    CONSTRAINT [ThietBi_id_key] UNIQUE NONCLUSTERED ([id])
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
    [id] INT NOT NULL,
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
    CONSTRAINT [SoDienThoaiNhaCungCap_id_key] UNIQUE NONCLUSTERED ([id])
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
    [number] INT NOT NULL,
    [cost] MONEY NOT NULL,
    CONSTRAINT [donHang_SaleTai_CuaHang_pkey] PRIMARY KEY CLUSTERED ([orderId])
);

-- CreateTable
CREATE TABLE [dbo].[nhaCungCap_NguyenLieu_CuaHang] (
    [storeId] INT NOT NULL,
    [supplierId] INT NOT NULL,
    [ingredientId] INT NOT NULL,
    CONSTRAINT [nhaCungCap_NguyenLieu_CuaHang_pkey] PRIMARY KEY CLUSTERED ([storeId],[supplierId],[ingredientId])
);

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
GO
--create Function ở đây
CREATE FUNCTION [dbo].[Example]()
RETURNS Table 
AS
	RETURN 
	SELECT * FROM [dbo].[NhanVien];
GO
--create Store Procedure ở đây
CREATE PROC GetEmployeeData 
AS 
	BEGIN
	SELECT * FROM [dbo].[Example]()
	END
GO
