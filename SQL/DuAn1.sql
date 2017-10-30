use master
go
drop database TNTDuAn1
go
create database TNTDuAn1
go
use TNTDuAn1
go
--1
create table Quyen(
MaQuyen int primary key not null Identity(1,1),
TenQuyen nvarchar(20) not null,
GhiChu nvarchar(250) null,
)
--2
create table NhanVien(
MaNhanVien int primary key not null Identity(1,1),
TenNhanVien nvarchar(20) not null,
TenDangNhap varchar(20)not null,
MatKhau varchar(20) not null,
MaQuyen int not null,
Luong money not null,
NgaySinh Date not null,
NgayLam Date not null,
GioiTinh bit not null,
CMND Varchar(9) not null,
SoDienThoai varchar(11) not null,
DiaChi Nvarchar(255) not null,
GhiChu Nvarchar(255) null
)
--3
create table TheLoai(
MaTheLoai int primary key not null Identity(1,1),
TenTheLoai nvarchar(30) not null,
GhiChu nvarchar(250) null,
)
--4
create table Sach(
MaSach int primary key not null Identity(1,1),
TenSach nvarchar(250) not null,
SoLuongSach int not null,
TinhTrangSach nvarchar(250) not null,
GiaSach money not null,
GiaNhap money not null,
NhaXuatBan nvarchar(250) not null,
MoTa Nvarchar(250) not null,
)
--5
create table DocGia(
MaDocGia int primary key not null Identity(1,1),
TenDocGia nvarchar(50) not null,
MaLoaiDocGia int not null,
GioiTinh bit not null,
NgaySinh Date not null,
SDT varchar(11) not null,
DiaChi nvarchar(250) not null,
TrangThai nvarchar(250) not null,
MoTa nvarchar(250) null,
)
--6
create table LoaiDocGia(
MaLoaiDocGia int primary key not null Identity(1,1),
TenLoaiDocGia nvarchar(50) not null,
UuDai int not null,
MoTa nvarchar(250) null,
)
--7
create table TacGia(
MaTacGia int primary key not null Identity(1,1),
TenTacGia nvarchar(50) null,
butdanh nvarchar(50) null,
GioiTinh bit not null,
NgaySinh date null,
NoiSinh nvarchar(250) null,
GhiChu nvarchar(250) null
)
--8
create table PhieuThue(
MaPhieuThue int primary key not null Identity(1,1),
SoPhieuThue varchar(20) not null,
MaDocGia int not null,
MaNhanVien int not null,
NgayThue date not null,
NgayTra date not null,
TongTien money not null,
GhiChu nvarchar(250) null
)
--9
create table PhieuNhap(
MaPhieuNhap int primary key not null Identity(1,1),
SoPhieuNhap varchar(20) not null,
MaNhaCungCap int not null,
MaNhanVien int not null,
NgayNhap date not null,
TongTien money not null,
GhiChu nvarchar(250) null
)
--10
create table PhieuThanhLy(
MaPhieuThanhLy int primary key not null Identity(1,1),
SoPhieuThanhLy varchar(20) not null,
MaNhanVien int not null,
NgayThanhLy date not null,
TongTien money not null,
GhiChu nvarchar(250) null
)
--11
create table PhieuPhat(
MaPhieuPhat int primary key not null Identity(1,1),
SoPhieuPhat varchar(20) not null,
MaDocGia int not null,
MaNhanVien int not null,
NgayPhat date not null,
TongTien money not null,
GhiChu nvarchar(250) null
)

--12
create table ChiTietPhieuThue(
MaChiTietPhieuThue int primary key not null Identity(1,1),
MaPhieuThue int not null,
MaSach int not null,
GiaThue money not null,
SoLuong int not null,
ThanhTien money not null,
GhiChu nvarchar(250) null
)
--13
create table ChiTietPhieuNhap(
MaChiTietPhieuNhap int primary key not null Identity(1,1),
MaPhieuNhap int not null,
MaSach int not null,
GiaNhap money not null,
SoLuong int not null,
ThanhTien money not null,
GhiChu nvarchar(250) null
)
--14
create table ChiTietPhieuPhat(
MaChiTietPhieuPhat int primary key not null Identity(1,1),
MaPhieuPhat int not null,
MaSach int not null,
LoiPhat Nvarchar(250) not null,
TienPhat money not null,
SoLuong int not null,
ThanhTien money not null,
GhiChu nvarchar(250) null
)
--15
create table ChiTietPhieuThanhLy(
MaChiTietPhieuThanhLy int primary key not null Identity(1,1),
MaPhieuThanhLy int not null,
MaSach int not null,
GiaThanhLy money not null,
SoLuong int not null,
ThanhTien money not null,
GhiChu nvarchar(250) null
)
--16
create table ChiTietTacGia(
MaChiTietTacGia int primary key not null Identity(1,1),
MaSach int not null,
MaTacGia int not null,
GhiChu nvarchar(250) null
)
--17
create table ChiTietTheLoai(
MaChiTietTheLoai int primary key not null Identity(1,1),
MaSach int not null,
MaTheLoai int not null,
GhiChu nvarchar(250) null
)
--18
create table NhaCungCap(
MaNhaCungCap int primary key not null Identity(1,1),
TenNhaCungCao Nvarchar(100) not null,
DiaChi Nvarchar(250) not null,
SDT varchar(11) not null,
Gmail Nvarchar(100) not null,
GhiChu nvarchar(250) null
)
--19
create table KhuyenMai(
MaKhuyenMai int primary key not null Identity(1,1),
NgayBatDau Date not null,
NgayKetThuc Date not null,
SoTienHoaDon money null,
SoLuong int null,
MaSach int null,
GiaSach money null,
KhuyenMai nvarchar(50) null
)
--Table Nhân Viên
ALTER TABLE NhanVien ADD CONSTRAINT FK_NhanVien_Quyen FOREIGN KEY (MaQuyen) REFERENCES Quyen(MaQuyen)
-- Table Độc Giả
ALTER TABLE DocGia ADD CONSTRAINT FK_DocGia_LoaiDocGia FOREIGN KEY (MaDocGia) REFERENCES LoaiDocGia(MaLoaiDocGia)
-- Chi tiết tác giả
ALTER TABLE ChiTietTacGia ADD CONSTRAINT FK_ChiTietTacGia_Sach FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
ALTER TABLE ChiTietTacGia ADD CONSTRAINT FK_ChiTietTacGia_TacGia FOREIGN KEY (MaTacGia) REFERENCES TacGia(MaTacGia)
-- Chi Tiết Thể Loại
ALTER TABLE ChiTietTheLoai ADD CONSTRAINT FK_ChiTietTheLoai_Sach FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
ALTER TABLE ChiTietTheLoai ADD CONSTRAINT FK_ChiTietTheLoai_TheLoai FOREIGN KEY (MaTheLoai) REFERENCES TheLoai(MaTheLoai)
--Phiếu Thuê
ALTER TABLE PhieuThue ADD CONSTRAINT FK_PhieuThue_DocGia FOREIGN KEY (MaDocGia) REFERENCES DocGia(MaDocGia)
ALTER TABLE PhieuThue ADD CONSTRAINT FK_PhieuThue_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
--Phiếu Phạt
ALTER TABLE PhieuPhat ADD CONSTRAINT FK_PhieuPhat_DocGia FOREIGN KEY (MaDocGia) REFERENCES DocGia(MaDocGia)
ALTER TABLE PhieuPhat ADD CONSTRAINT FK_PhieuPhat_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
--Phiếu Nhập Kho
ALTER TABLE PhieuNhap ADD CONSTRAINT FK_PhieuNhap_NhaCungCap FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap(MaNhaCungCap)
ALTER TABLE PhieuNhap ADD CONSTRAINT FK_PhieuNhap_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
--Phiếu Thanh Lý
ALTER TABLE PhieuThanhLy ADD CONSTRAINT FK_PhieuThanhLy_NhanVien FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
-- chi tiết phiếu thuê
ALTER TABLE ChiTietPhieuThue ADD CONSTRAINT FK_ChiTietPhieuThue_PhieuThue FOREIGN KEY (MaPhieuThue) REFERENCES PhieuThue(MaPhieuThue)
ALTER TABLE ChiTietPhieuThue ADD CONSTRAINT FK_ChiTietPhieuThue_Sach FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
-- chi tiết phiếu phạt
ALTER TABLE ChiTietPhieuPhat ADD CONSTRAINT FK_ChiTietPhieuPhat_PhieuPhat FOREIGN KEY (MaPhieuPhat) REFERENCES PhieuPhat(MaPhieuPhat)
ALTER TABLE ChiTietPhieuPhat ADD CONSTRAINT FK_ChiTietPhieuPhat_Sach FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
-- chi tiết phiếu thanh lý
ALTER TABLE ChiTietPhieuThanhLy ADD CONSTRAINT FK_ChiTietPhieuThanhLy_PhieuThanhLy FOREIGN KEY (MaPhieuThanhLy) REFERENCES PhieuThanhLy(MaPhieuThanhLy)
ALTER TABLE ChiTietPhieuThanhLy ADD CONSTRAINT FK_ChiTietPhieuThanhLy_Sach FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
--chi tiết phiếu nhập kho
ALTER TABLE ChiTietPhieuNhap ADD CONSTRAINT FK_ChiTietPhieuNhap_PhieuNhap FOREIGN KEY (MaPhieuNhap) REFERENCES PhieuNhap(MaPhieuNhap)
ALTER TABLE ChiTietPhieuNhap ADD CONSTRAINT FK_ChiTietPhieuNhap_Sach FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)

	