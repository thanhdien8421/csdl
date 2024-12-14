USE csdl;
GO

-- Thêm dữ liệu vào bảng NhanVien
-- DBCC CHECKIDENT ('NhanVien', RESEED, 0);

INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Quách Thanh Điền', 20, 16000000, GETDATE(), N'0123456789', N'Quản lý');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Trần Văn Hoàng', 25, 15000000, GETDATE(), N'0933333333', N'Quản lý');

INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Nguyễn Trung Kiên', 21, 6999999, GETDATE(), N'0888888888', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Lê Minh Trí', 22, 8000000, GETDATE(), N'0909090909', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Đỗ Ngọc Hạnh', 28, 17000000, GETDATE(), N'0944444444', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Nguyễn Minh Quang', 24, 6000000, GETDATE(), N'0931234567', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Phan Hồng Anh', 27, 6500000, GETDATE(), N'0942345678', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Võ Thị Lan', 23, 5600000, GETDATE(), N'0953456789', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Đỗ Tiến Dũng', 26, 6200000, GETDATE(), N'0964567890', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Nguyễn Thị Thanh', 25, 5800000, GETDATE(), N'0975678901', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Phạm Tấn Thành', 29, 7000000, GETDATE(), N'0986789012', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Lê Ngọc Linh', 22, 5200000, GETDATE(), N'0997890123', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Trần Hoàng Nam', 28, 6700000, GETDATE(), N'0918901234', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Bùi Thị Hương', 24, 6000000, GETDATE(), N'0929012345', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Nguyễn Tuấn Anh', 30, 7500000, GETDATE(), N'0930123456', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Lý Thiện Thành', 22, 5800000, GETDATE(), N'0912345678', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Hồ Thi Ngọc', 26, 6400000, GETDATE(), N'0923456789', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Nguyễn Hoàng Nam', 28, 7000000, GETDATE(), N'0934567890', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Đoàn Thị Hồng', 24, 6000000, GETDATE(), N'0945678901', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Phan Ngọc Lan', 25, 5900000, GETDATE(), N'0956789012', N'Đầu bếp');

INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Nguyễn Chí Thiết', 19, 7345678, GETDATE(), N'0987654321', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Phạm Nhật Huy', 23, 8000000, GETDATE(), N'0966666666', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Võ Hoàng Anh', 24, 7000000, GETDATE(), N'0912345678', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Hoàng Hải Đăng', 20, 5000000, GETDATE(), N'0907777777', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Ngô Thanh Hương', 18, 4500000, GETDATE(), N'0922222222', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Ngô Thanh Hương', 18, 4500000, GETDATE(), N'0922222222', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Vũ Thị Mai', 20, 4800000, GETDATE(), N'0933333333', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Phan Tiến Dũng', 22, 5000000, GETDATE(), N'0944444444', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Lê Quang Hieu', 23, 5200000, GETDATE(), N'0955555555', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Trần Minh Phúc', 24, 5300000, GETDATE(), N'0966666666', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Nguyễn Hải Đăng', 26, 5500000, GETDATE(), N'0977777777', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Bùi Trọng Hải', 21, 4900000, GETDATE(), N'0988888888', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Võ Tấn Lực', 23, 5100000, GETDATE(), N'0999999999', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Hoàng Trí Quân', 25, 5400000, GETDATE(), N'0911111111', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Nguyễn Minh Tú', 27, 5600000, GETDATE(), N'0922222222', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Vũ Minh Hoàng', 22, 4700000, GETDATE(), N'0967890123', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Nguyễn Hà Thanh', 23, 4900000, GETDATE(), N'0978901234', N'Bán hàng');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
VALUES(N'Trần Hữu Tài', 21, 4800000, GETDATE(), N'0989012345', N'Bán hàng');
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
INSERT INTO [dbo].[DonHang] ([id], [orderTime], [paymentMethod])
VALUES
    (1, '2024-12-11 08:30:00', N'Trả tiền mặt'),
    (2, '2024-12-11 09:00:00', N'Trả qua thẻ tín dụng'),
    (3, '2024-12-11 09:30:00', N'Trả tiền mặt'),
    (4, '2024-12-11 10:00:00', N'Trả qua ví điện tử'),
    (5, '2024-12-11 10:30:00', N'Trả qua thẻ tín dụng'),
    (6, '2024-12-11 11:00:00', N'Trả tiền mặt'),
    (7, '2024-12-11 11:30:00', N'Trả qua ví điện tử'),
    (8, '2024-12-11 12:00:00', N'Trả tiền mặt'),
    (9, '2024-12-11 12:30:00', N'Trả qua thẻ tín dụng'),
    (10, '2024-12-11 13:00:00', N'Trả qua ví điện tử');
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
