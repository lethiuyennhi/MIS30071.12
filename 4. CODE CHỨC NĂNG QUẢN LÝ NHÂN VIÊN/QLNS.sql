CREATE DATABASE QuanLyNhanSu
GO
USE [QuanLyNhanSu]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanSu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[GioiTinh] [nchar](10) NULL,
	[NgaySinh] [date] NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
 CONSTRAINT [PK_NhanSu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
--Xoa nhan vien
create proc [dbo].[SP_XoaNhanVien]
@ID int
as
begin
	delete NhanSu where ID = @ID
end
go

--Them nhan vien
create proc [dbo].[SP_ThemNhanVien]
@HoTen nvarchar(50),
@GioiTinh nchar(10),
@NgaySinh date,
@Email nvarchar(50),
@DiaChi nvarchar(50),
@Phone nvarchar(20)
as
begin
	insert into NhanSu values (@HoTen, @GioiTinh, @NgaySinh, @Email, @DiaChi, @Phone)
end
go
--Sua nhan vien
create proc [dbo].[SP_SuaNhanVien]
@ID int,
@HoTen nvarchar(50),
@GioiTinh nchar(10),
@NgaySinh date,
@Email nvarchar(50),
@DiaChi nvarchar(50),
@Phone nvarchar(20)
as
begin
	update NhanSu set
	HoTen = @HoTen,
	GioiTinh = @GioiTinh,
	NgaySinh = @NgaySinh,
	Email = @Email,
	DiaChi = @DiaChi,
	Phone = @Phone
	where ID = @ID
end
go
--Lay DS nhan vien
create proc [dbo].[SP_LayDSNS]
as
begin
	select * from NhanSu
end
go

