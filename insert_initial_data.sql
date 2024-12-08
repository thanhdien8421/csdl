USE csdl;
GO
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
	VALUES(N'Quách Thanh Điền', 20, 1000000, GETDATE(), N'0123456789', N'Quản lý');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
	VALUES(N'Nguyễn Trung Kiên', 21, 9999999, GETDATE(), '0888888888', N'Đầu bếp');
INSERT INTO [dbo].[NhanVien]([name], [age], [salary], [startDate], [phone], [role])
	VALUES(N'Nguyễn Chí Thiết', 19, 12345678, GETDATE(), '0987654321', N'Bán hàng');
GO