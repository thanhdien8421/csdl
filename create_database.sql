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
--create Store Procedure ở đây
CREATE PROC GetEmployeeData 
AS 
	BEGIN
	SELECT * FROM [dbo].[Example]()
	END
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

--SELECT * FROM dbo.GetNguyenLieuNhaCungCapByStoreId(2);
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
    @supplierName NVARCHAR(500)    -- Tên nhà cung cấp
AS
BEGIN
    -- Kiểm tra xem tên nhà cung cấp có thay đổi hay không
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

--EXEC dbo.UpdateNguyenLieuAndNhaCungCap
    --@id = 56,                    -- ID của nguyên vật liệu cần cập nhật
    --@name = N'Bột mì',  -- Tên mới của nguyên vật liệu
    --@type = N'Nguyên liệu chính',         -- Loại mới của nguyên vật liệu
    --@buyDate = '2024-01-01',     -- Ngày mua mới
    --@endDate = '2025-01-01',     -- Ngày hết hạn mới
    --@number = 100.00,            -- Số lượng mới
    --@unit = 'kg',                -- Đơn vị mới
    --@cost = 50000,             -- Giá mới
    --@supplierName = N'Nhà Cung Cấp B';  -- Tên nhà cung cấp mới
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
    @supplierName NVARCHAR(500)    -- Tên nhà cung cấp
AS
BEGIN
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

--DBCC CHECKIDENT ('NguyenLieu', NORESEED);
--DBCC CHECKIDENT ('NguyenLieu', RESEED, 54);
--EXEC dbo.AddNguyenLieuAndNhaCungCap
    --@storeId = 1,                  -- ID cửa hàng
    --@name = N'Nguyên liệu mới',     -- Tên nguyên vật liệu
    --@type = N'Loại mới',            -- Loại nguyên vật liệu
    --@buyDate = '2024-01-01',        -- Ngày mua
    --@endDate = '2025-01-01',        -- Ngày hết hạn
    --@number = 100.00,               -- Số lượng
    --@unit = 'kg',                   -- Đơn vị
    --@cost = 5000.00,                -- Giá
    --@supplierName = N'Nhà cung cấp C'; -- Tên nhà cung cấp
---------------------------------------------------------
--Thủ tục delete nguyên liệu có id là x
CREATE PROCEDURE dbo.DeleteNguyenLieu
    @id INT -- ID của nguyên liệu cần xóa
AS
BEGIN
    -- Khởi tạo transaction
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

--EXEC dbo.DeleteNguyenLieu
    --@id = 55;  -- ID của nguyên liệu cần xóa

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

--EXEC GetMonthlyRevenueByStore @storeId = 1;

CREATE FUNCTION dbo.GetProductsInStore (@storeId INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        sp.id AS product_id,
        sp.name AS product_name,
        sp.price AS product_price,
        spc.number AS available_quantity
    FROM 
        dbo.SanPham sp
    JOIN 
        dbo.sanPham_Tai_CuaHang spc ON sp.id = spc.productId
    WHERE 
        spc.storeId = @storeId
);

--SELECT * FROM dbo.GetProductsInStore(1);

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
-- Thêm một tài khoản mới vào bảng Auth
--EXEC AddAccount @Email = 'user@example.com', @Password = 'password123', @StoreId = 1, @Role= 'User';
--EXEC AddAccount @Email = 'admin@example.com', @Password = 'password', @StoreId = 1, @Role= 'Admin';
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

--EXEC GetPasswordAndStoreIdByEmail @Email = 'admin@example.com', @Password = 'password';
-----------------------------------------thêm đơn hàng
CREATE PROCEDURE [dbo].[ThemDonHang]
    @salerId INT,
    @storeId INT,
    @paymentMethod NVARCHAR(100),
    @orderTime DATETIME2 = NULL, -- Thời gian đặt hàng, mặc định là NULL sẽ sử dụng thời gian hiện tại
    @productIds NVARCHAR(MAX),   -- Danh sách các productId, cách nhau bởi dấu phẩy
    @quantities NVARCHAR(MAX)    -- Danh sách các số lượng tương ứng, cách nhau bởi dấu phẩy
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
    DECLARE @productId INT, @quantity INT, @index INT = 1;
    DECLARE @productIdList NVARCHAR(MAX) = @productIds;
    DECLARE @quantityList NVARCHAR(MAX) = @quantities;

    -- Tạo bảng tạm để chứa thông tin sản phẩm và số lượng
    WHILE CHARINDEX(',', @productIdList) > 0
    BEGIN
        SET @productId = CAST(SUBSTRING(@productIdList, 1, CHARINDEX(',', @productIdList) - 1) AS INT);
        SET @productIdList = SUBSTRING(@productIdList, CHARINDEX(',', @productIdList) + 1, LEN(@productIdList));
        
        SET @quantity = CAST(SUBSTRING(@quantityList, 1, CHARINDEX(',', @quantityList) - 1) AS INT);
        SET @quantityList = SUBSTRING(@quantityList, CHARINDEX(',', @quantityList) + 1, LEN(@quantityList));

        -- Lấy giá của sản phẩm từ bảng SanPham
        DECLARE @cost MONEY;
        SELECT @cost = [price] FROM [dbo].[SanPham] WHERE [id] = @productId;

        -- Thêm sản phẩm vào bảng sanPham_Tren_DonHang
        INSERT INTO [dbo].[sanPham_Tren_DonHang] ([orderId], [productId], [number], [cost])
        VALUES (@orderId, @productId, @quantity, @cost);

        SET @index = @index + 1;
    END

    -- Thêm thông tin nhân viên bán hàng và cửa hàng vào bảng donHang_SaleTai_CuaHang
    INSERT INTO [dbo].[donHang_SaleTai_CuaHang] ([salerId], [orderId], [storeId])
    VALUES (@salerId, @orderId, @storeId);

    -- Trả về ID của đơn hàng vừa tạo
    SELECT @orderId AS NewOrderId;
END
EXEC [dbo].[ThemDonHang]
    @salerId = 1,
    @storeId = 2,
    @paymentMethod = 'Cash',
    @productIds = '1,2,3',
    @quantities = '2,3,1';