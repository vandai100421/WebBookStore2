CREATE DATABASE WebBookStore2
GO

-- CLIENT --
USE WebBookStore2
GO

CREATE TABLE DONHANG 
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	DiaChi NVARCHAR(100),
	SoLuong INT,
	MoTa NTEXT,
	NgayDatHang DATETIME,
	NgayNhanHang DATETIME,
	EmailNguoiNhan VARCHAR(50),
	TinhTrang INT,
	MaVanDon VARCHAR(10) NOT NULL,
	MaKhachHang INT,
	TongTien FLOAT
)
GO

CREATE TABLE CHITIETDONHANG 
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	KhuyenMai FLOAT,
	MaDonHang INT,
	MaSanPham INT,
	SoLuong INT,
	DonGia BIGINT
)
GO

CREATE TABLE SANPHAM 
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	TinhTrang BIT,
	MoTa NTEXT,
	KhuyenMai FLOAT,
	Anh VARCHAR(100),
	TenSanPham NVARCHAR(100),
	GiaSanPham BIGINT NOT NULL,
	NgaySanXuat DATETIME,
	SoLuong INT NOT NULL,
	Moi BIT,
	DacBiet BIT,
	LuotXem INT,
	MaTacGia INT,
	MaDMSach INT,
	MaNXB INT
)
GO

CREATE TABLE NGUOIDUNG 
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	HoVaTen NVARCHAR(100),
	DiaChi NVARCHAR(100),
	SDT VARCHAR(10),
	Email VARCHAR(50),
	MatKhau VARCHAR(50),
	TrangThai INT,
	MaNhom VARCHAR(20)
)
GO

CREATE TABLE DANHGIA 
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	BinhLuan NTEXT,
	SoSao INT,
	MaSanPham INT,
	MaKhachHang INT
)
GO

CREATE TABLE DANHMUCSACH 
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	TenDMSach NVARCHAR(100)
)
GO

CREATE TABLE NHAXUATBAN 
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	TenNXB NVARCHAR(100),
	DiaChi NVARCHAR(100),
	SDT VARCHAR(10),
	Email VARCHAR(50),
)
GO

CREATE TABLE TACGIA 
(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	HoVaTen NVARCHAR(100),
	SDT VARCHAR(10),
	Email VARCHAR(50),
)
GO

ALTER TABLE CHITIETDONHANG ADD FOREIGN KEY (MaDonHang) REFERENCES dbo.DONHANG (ID)
ALTER TABLE CHITIETDONHANG ADD FOREIGN KEY (MaSanPham) REFERENCES dbo.SANPHAM (ID)
ALTER TABLE DONHANG ADD FOREIGN KEY (MaKhachHang) REFERENCES dbo.NGUOIDUNG (ID)

ALTER TABLE SANPHAM ADD FOREIGN KEY (MaTacGia) REFERENCES dbo.TACGIA (ID)
ALTER TABLE SANPHAM ADD FOREIGN KEY (MaDMSach) REFERENCES dbo.DanhMucSach (ID)
ALTER TABLE SANPHAM ADD FOREIGN KEY (MaNXB) REFERENCES dbo.NHAXUATBAN (ID)

ALTER TABLE DANHGIA ADD FOREIGN KEY (MaSanPham) REFERENCES dbo.SANPHAM (ID)
ALTER TABLE DANHGIA ADD FOREIGN KEY (MaKhachHang) REFERENCES dbo.NGUOIDUNG (ID)
GO

-- SERVER --
USE WebBookStore2
GO

CREATE TABLE QUYEN 
(
	ID VARCHAR(20),
	TenQuyen NVARCHAR(100),
	PRIMARY KEY (ID)
)
GO

CREATE TABLE NHOMND 
(
	ID VARCHAR(20),
	TenNhom NVARCHAR(100),
	PRIMARY KEY (ID)
)
GO

CREATE TABLE PHANQUYEN 
(
	MaNhomND VARCHAR(20),
	MaQuyen VARCHAR(20),
	TenPQ NVARCHAR(100),
	PRIMARY KEY (MaNhomND, MaQuyen)
)
GO

ALTER TABLE dbo.NGUOIDUNG ADD FOREIGN KEY (MaNhom) REFERENCES dbo.NHOMND (ID)
ALTER TABLE dbo.PHANQUYEN ADD FOREIGN KEY (MaNhomND) REFERENCES dbo.NHOMND (ID)
ALTER TABLE dbo.PHANQUYEN ADD FOREIGN KEY (MaQuyen) REFERENCES dbo.QUYEN (ID)

GO
