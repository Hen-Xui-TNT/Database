use master
go
--drop database TNTDuAn1
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
--8============================================================================================
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
--11========================================================================================
create table PhieuPhat(
MaPhieuPhat int primary key not null Identity(1,1),
SoPhieuPhat varchar(20) not null,
MaDocGia int not null,
MaNhanVien int not null,
NgayPhat date not null,
TongTien money not null,
GhiChu nvarchar(250) null
)

--12===============================================================================================
create table ChiTietPhieuThue(
MaChiTietPhieuThue int primary key not null Identity(1,1),
MaPhieuThue int not null,
MaSach int not null,
GiaThue money not null,
SoLuong int not null,
ThanhTien money not null,
GhiChu nvarchar(250) null
)
--13=======================================================================================
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
--15================================================================================
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
TenNhaCungCap Nvarchar(100) not null,
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
ALTER TABLE DocGia ADD CONSTRAINT FK_DocGia_LoaiDocGia FOREIGN KEY (MaLoaiDocGia) REFERENCES LoaiDocGia(MaLoaiDocGia)
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

-----------------------------------------1------------------------------------------
select *from LoaiDocGia
insert into LoaiDocGia values(N'VIP', 5, N'')
insert into LoaiDocGia values(N'Khách quen', 5, N'')
insert into LoaiDocGia values(N'Khách mới', 5, N'')
insert into LoaiDocGia values(N'Sinh viên', 5, N'')
-------------------------------------------2----------------------------------------
select *from DocGia
insert into DocGia values(N'Nguyễn Thị Minh Tâm', 1,1,'1998/05/26','01655730111',N'100/6 amakhe',N'chưa mượn',N'')
insert into DocGia values(N'Nguyễn Thị Thủy', 2,1,'1998/08/25','01243101767',N'Hà Huy Tập',N'chưa mượn',N'')
insert into DocGia values(N'Đỗ Huy Nhân', 2,0,'1998/02/15','0165545345',N'Trường Chinh',N'chưa mượn',N'')
insert into DocGia values(N'Đỗ Thị Chinh', 4,1,'1998/04/14','01287456321',N'100 Lê Duẩn',N'chưa mượn',N'')
insert into DocGia values(N'Sầm Thị Chinh', 1,1,'1998/04/15','0868545767',N'27 Nguyễn Tất Thành',N'chưa mượn',N'')
insert into DocGia values(N'Nguyễn Thị Lý', 1,1,'1998/02/24','0165876353',N'25 Nguyễn Chí Thanh',N'chưa mượn',N'')
insert into DocGia values(N'Đào Văn Nam', 3,0,'1998/03/12','01245456391',N'140 Hoàng Diệu',N'chưa mượn',N'')
insert into DocGia values(N'Lê Văn Dũng', 4,0,'1998/04/04','01287456756',N'120 Hùng Vương',N'chưa mượn',N'')
insert into DocGia values(N'Nguyễn Huy Hoàng', 1,0,'1998/05/02','01287459875',N'100/8 amakhe',N'chưa mượn',N'')
insert into DocGia values(N'Mai Quý Đôn', 2,0,'1998/04/12','01287412347',N'120/6 amakhe',N'chưa mượn',N'')
insert into DocGia values(N'Nguyễn Thái Minh', 2,0,'1998/06/12','01287458797',N'40 Trần Nhật Duật',N'chưa mượn',N'')
insert into DocGia values(N'Hoàng Văn Thắng', 3,0,'1998/07/11','01287413345',N'80 Trần Phú',N'chưa mượn',N'')
insert into DocGia values(N'Huỳnh Đặng Phương Trâm', 4,1,'1998/08/17','01287451287',N'08 Phan Bội Châu',N'chưa mượn',N'')
insert into DocGia values(N'Nguyễn Thị Thương Thương', 3,1,'1998/01/25','01287450112',N'50 Lê Thánh Tông',N'chưa mượn',N'')
insert into DocGia values(N'Nguyễn Trần Thanh Bình', 4,0,'1998/09/18','01287458779',N'48 Đinh Tiên Hoàng',N'chưa mượn',N'')

--------------------------------3-------------------------------------------------------------
select* from Quyen
insert into Quyen values(N'Nhân viên', N'')
insert into Quyen values(N'Quản Lý', N'')

-----------------------------------------4---------------------------------------------------
select *from NhanVien
insert into NhanVien values(N'Nguyễn Thị Thủy', N'thuynt',12345,1,4000000,'1998/08/25','2017/8/20',1,'KT123456','01243101767',N'Trần Quý Cáp',N'')
insert into NhanVien values(N'Nguyễn Thị Minh Tâm', N'tamntm',12345,2,6000000,'1998/05/26','2017/8/20',1,'KT123457','01655730111',N'100/6 amakhe',N'')
insert into NhanVien values(N'Đỗ Huy Nhân', N'nhandh',12345,2,5000000,'1998/08/25','2017/02/15',1,'KT123876','0165545345',N'Trường Chinh',N'')
insert into NhanVien values(N'Đỗ Thị Chinh', N'chinhdt',12345,1,5000000,'1998/08/25','2017/04/14',1,'KT123453','01287456321',N'100 Lê Duẩn',N'')

----------------------------------5--------------------------------------------
select * from PhieuThue
insert into PhieuThue values(1,1,1,'2017/02/12','2017/02/22',20000,N'' )
insert into PhieuThue values(2,2,2,'2017/03/22','2017/03/30',22000,N'' )
insert into PhieuThue values(3,4,1,'2017/05/03','2017/05/13',25000,N'' )
insert into PhieuThue values(4,1,2,'2017/07/05','2017/07/15',25000,N'' )
insert into PhieuThue values(5,3,1,'2017/08/20','2017/08/27',30000,N'' )
insert into PhieuThue values(6,2,2,'2017/01/21','2017/01/29',30000,N'' )
insert into PhieuThue values(7,1,1,'2017/09/17','2017/09/27',35000,N'' )
insert into PhieuThue values(8,1,2,'2017/03/14','2017/03/24',25000,N'' )
insert into PhieuThue values(9,4,2,'2017/02/15','2017/02/25',20000,N'' )
insert into PhieuThue values(10,3,1,'2017/02/13','2017/02/23',30000,N'' )

-----------------------------------6--------------------------------------------
select * from PhieuPhat
insert into PhieuPhat values('1',1,1,'2017/02/22',20000,N'' )
insert into PhieuPhat values('2',2,2,'2017/03/30',20000,N'' )
insert into PhieuPhat values('3',3,1,'2017/08/27',20000,N'' )
insert into PhieuPhat values('4',4,2,'2017/05/13',20000,N'' )
insert into PhieuPhat values('5',5,1,'2017/2/12',20000,N'' )
insert into PhieuPhat values('6',4,2,'2017/02/25',20000,N'' )
insert into PhieuPhat values('7',3,1,'2017/02/23',20000,N'' )
insert into PhieuPhat values('8',2,2,'2017/2/12',20000,N'' )
insert into PhieuPhat values('9',1,1,'2017/08/27',20000,N'' )
insert into PhieuPhat values('10',5,2,'2017/4/12',20000,N'' )
--------------------------------------------7---------------------------------------------
select * from Sach
insert into Sach values(N'Doreamon',150,N'Sách mới nhập',30000,25000,N'NXB Kim Đồng',N'')
insert into Sach values(N'Conan',150,N'Sách mới nhập',20000,15000,N'NXB Ánh Dương',N'')
insert into Sach values(N'Thần đồng đất Việt',100,N'Sách mới nhập',15000,18000,N'NXB Thủy Nguyễn',N'')
insert into Sach values(N'Sách giáo khoa',150,N'Sách mới nhập',220000,190000,N'NXB Minh Tâm',N'')
insert into Sach values(N'Giáo trình ',50,N'Sách mới nhập',150000,120000,N'NXB Hoa Sen',N'')
insert into Sach values(N'Truyện cười',30,N'Sách mới nhập',20000,15000,N'NXB Huy Nhân',N'')
insert into Sach values(N'Shelockhom',150,N'Sách mới nhập',35000,30000,N'NXB Kim Đồng',N'')
insert into Sach values(N'Hary Porter',160,N'Sách mới nhập',60000,50000,N'NXB Minh Tâm',N'')
insert into Sach values(N'Truyện cổ tích',180,N'Sách mới nhập',30000,25000,N'NXB Thủy Nguyễn',N'')
insert into Sach values(N'Tom & Jerry',150,N'Sách mới nhập',20000,15000,N'NXB Hoa Sen',N'')

-------------------------------------------------8-------------------------------------------
select* from PhieuThanhLy
insert into PhieuThanhLy values(1,1,'2017/02/14',500000,N'')
insert into PhieuThanhLy values(2,2,'2017/01/20',800000,N'')
insert into PhieuThanhLy values(3,1,'2017/03/22',200000,N'')
insert into PhieuThanhLy values(4,2,'2017/04/25',600000,N'')
insert into PhieuThanhLy values(5,1,'2017/05/13',400000,N'')
insert into PhieuThanhLy values(6,2,'2017/06/09',900000,N'')
insert into PhieuThanhLy values(7,1,'2017/07/27',1000000,N'')
insert into PhieuThanhLy values(8,2,'2017/08/06',900000,N'')
insert into PhieuThanhLy values(9,1,'2017/08/30',500000,N'')
insert into PhieuThanhLy values(10,2,'2017/09/18',1500000,N'')
insert into PhieuThanhLy values(1,1,'2017/02/14',500000,N'')
insert into PhieuThanhLy values(2,2,'2017/01/20',800000,N'')
insert into PhieuThanhLy values(3,1,'2017/03/22',200000,N'')
insert into PhieuThanhLy values(4,2,'2017/04/25',600000,N'')
insert into PhieuThanhLy values(5,1,'2017/05/13',400000,N'')
insert into PhieuThanhLy values(6,2,'2017/06/09',900000,N'')
insert into PhieuThanhLy values(7,1,'2017/07/27',1000000,N'')
insert into PhieuThanhLy values(8,2,'2017/08/06',900000,N'')
insert into PhieuThanhLy values(9,1,'2017/08/30',500000,N'')
insert into PhieuThanhLy values(10,2,'2017/09/18',1500000,N'')

-----------------------------------------9----------------------------------------
select * from ChiTietPhieuThanhLy
--select * from Sach
insert into ChiTietPhieuThanhLy values(1,2,10000,50,500000,N'')
insert into ChiTietPhieuThanhLy values(2,1,15000,50,750000,N'')
insert into ChiTietPhieuThanhLy values(3,3,9000,40,360000,N'')
insert into ChiTietPhieuThanhLy values(4,5,60000,30,1800000,N'')
insert into ChiTietPhieuThanhLy values(5,7,15000,40,600000,N'')
insert into ChiTietPhieuThanhLy values(6,9,12000,10,1200000,N'')
insert into ChiTietPhieuThanhLy values(7,4,110000,20,22000000,N'')
insert into ChiTietPhieuThanhLy values(8,6,7000,15,105000,N'')
insert into ChiTietPhieuThanhLy values(9,7,15000,55,825000,N'')
insert into ChiTietPhieuThanhLy values(10,8,25000,60,1500000,N'')
insert into ChiTietPhieuThanhLy values(11,1,15000,80,1200000,N'')
insert into ChiTietPhieuThanhLy values(12,2,10000,60,500000,N'')
insert into ChiTietPhieuThanhLy values(13,6,10000,5,50000,N'')
insert into ChiTietPhieuThanhLy values(14,10,7000,70,490000,N'')
insert into ChiTietPhieuThanhLy values(15,9,12000,50,600000,N'')
insert into ChiTietPhieuThanhLy values(16,5,60000,8,480000,N'')

----------------------------10-------------------------------------------
select *from NhaCungCap
insert into NhaCungCap values(N'Nhà cung cấp Hà Nội',N'Ba Đình - Hà Nội','01655730111',N'nccHN@gmail.com',N'')
insert into NhaCungCap values(N'Nhà cung cấp Sài Thành ',N'Nguyễn Chí Thanh_TP Hồ Chí Minh','01243101767',N'minhtamcp@gmail.com',N'')
insert into NhaCungCap values(N'Nhà cung cấp Phương Đông',N'Hòa Phú-Đà Nẵng','0935539808',N'nccPhuongDong@gmail.com',N'')
insert into NhaCungCap values(N'Nhà cung cấp Hoàn Thành',N'Nha Trang','01273568459',N'NhaTrang@gmail.com',N'')
insert into NhaCungCap values(N'Nhà cung cấp Tây Nguyên',N'27 Nguyễn Tất Thành - BMT','0976197097',N'fpoly@gmail.com',N'')

-------------------------------11-----------------------------------
select * from PhieuNhap
select * from PhieuThanhLy
insert into PhieuNhap values(1,1,1,'2017/02/15',2000000,N'')
insert into PhieuNhap values(2,2,2,'2017/01/21',3000000,N'')
insert into PhieuNhap values(3,3,1,'2017/03/23',4000000,N'')
insert into PhieuNhap values(4,4,2,'2017/04/26',2000000,N'')
insert into PhieuNhap values(5,5,1,'2017/05/14',3000000,N'')
insert into PhieuNhap values(6,4,2,'2017/06/10',4000000,N'')
insert into PhieuNhap values(7,3,1,'2017/07/28',3000000,N'')
insert into PhieuNhap values(8,2,2,'2017/08/07',2000000,N'')
insert into PhieuNhap values(9,1,1,'2017/09/01',3000000,N'')
insert into PhieuNhap values(10,4,2,'2017/09/19',4000000,N'')

----------------------------------------12-------------------------------------
select * from ChiTietPhieuNhap
select * from Sach
insert into ChiTietPhieuNhap values(1,1,25000,50,1200000,N'')
insert into ChiTietPhieuNhap values(2,2,15000,60,900000,N'')
insert into ChiTietPhieuNhap values(3,3,18000,80,180000,N'')
insert into ChiTietPhieuNhap values(4,4,190000,100,19000000,N'')
insert into ChiTietPhieuNhap values(5,5,120000,90,11810000,N'')
insert into ChiTietPhieuNhap values(6,6,15000,100,1500000,N'')
insert into ChiTietPhieuNhap values(7,7,30000,120,3600000,N'')
insert into ChiTietPhieuNhap values(8,8,50000,130,6500000,N'')
insert into ChiTietPhieuNhap values(9,9,25000,140,3500000,N'')
insert into ChiTietPhieuNhap values(10,10,15000,150,2250000,N'')

-----------------------------------13-------------------------------------------
select * from PhieuThue
select * from Sach
select * from ChiTietPhieuThue
insert into ChiTietPhieuThue values(1,1,20000,20,400000,N'')
insert into ChiTietPhieuThue values(2,2,15000,20,300000,N'')
insert into ChiTietPhieuThue values(3,3,10000,20,20000,N'')
insert into ChiTietPhieuThue values(4,4,15000,10,150000,N'')
insert into ChiTietPhieuThue values(5,5,200000,5,1000000,N'')
insert into ChiTietPhieuThue values(6,6,120000,3,360000,N'')
insert into ChiTietPhieuThue values(7,7,17000,25,425000,N'')
insert into ChiTietPhieuThue values(8,8,30000,15,450000,N'')
insert into ChiTietPhieuThue values(9,9,50000,25,1250000,N'')
insert into ChiTietPhieuThue values(10,10,15000,20,300000,N'')
insert into ChiTietPhieuThue values(1,1,25000,22,550000,N'')
insert into ChiTietPhieuThue values(2,2,20000,20,11111111,N'')
insert into ChiTietPhieuThue values(3,3,15000,20,11111111,N'')
insert into ChiTietPhieuThue values(4,4,18000,20,11111111,N'')
insert into ChiTietPhieuThue values(5,5,220000,20,11111111,N'')

-----------------------------14-------------------------------------
select * from TacGia
insert into TacGia values(N'Nguyễn Thị Minh Tâm',N'TCP',1,'1998/05/26',N'Đăk Lăk',N'')
insert into TacGia values(N'Nguyễn Thị Thuy',N'Yuuki',1,'1998/08/25',N'Kon Tum',N'')
insert into TacGia values(N'Đỗ Huy Nhân',N'Tiểu kết',1,'1998/02/15',N'Nha Trang',N'')
insert into TacGia values(N'Đỗ Thị Chinh',N'Bạch Dương',1,'1998/04/14',N'Thái Nguyên',N'')
insert into TacGia values(N'Đào Văn Nam',N'Namdv',1,'1998/08/26',N'Thái Bình',N'')

-------------------------15---------------------------------------
select * from KhuyenMai
select * from Sach
insert into KhuyenMai values('2017/02/14','2017/02/20',150000,5,1,30000,5)
insert into KhuyenMai values('2017/03/26','2017/04/05',200000,10,2,20000,5)
insert into KhuyenMai values('2017/05/01','2017/05/10',150000,10,3,15000,5)
insert into KhuyenMai values('2017/06/01','2017/06/10',220000,2,1,220000,5)
insert into KhuyenMai values('2017/07/20','2017/07/30',300000,5,2,150000,5)
insert into KhuyenMai values('2017/08/25','2017/09/10',120000,7,6,20000,5)

------------------------------------16------------------------------------

select * from ChiTietTacGia
insert into ChiTietTacGia values(1,1,N'')
insert into ChiTietTacGia values(1,2,N'')
insert into ChiTietTacGia values(1,3,N'')
insert into ChiTietTacGia values(2,4,N'')
insert into ChiTietTacGia values(3,3,N'')
insert into ChiTietTacGia values(4,2,N'')
insert into ChiTietTacGia values(5,1,N'')
insert into ChiTietTacGia values(5,3,N'')
insert into ChiTietTacGia values(6,4,N'')
insert into ChiTietTacGia values(7,2,N'')

-------------------------------17-------------------------
select * from PhieuPhat
select * from ChiTietPhieuPhat
select * from Sach
insert into ChiTietPhieuPhat values(1,1,N'Làm rách',15000,1,15000,N'')
insert into ChiTietPhieuPhat values(2,2,N'Làm mất',20000,2,40000,N'')
insert into ChiTietPhieuPhat values(3,3,N'Làm rách',9000,1,18000,N'')
insert into ChiTietPhieuPhat values(4,4,N'Làm bẩn',120000,2,240000,N'')
insert into ChiTietPhieuPhat values(5,5,N'Làm rách',100000,1,100000,N'')
insert into ChiTietPhieuPhat values(6,6,N'Làm mất',10000,3,30000,N'')
insert into ChiTietPhieuPhat values(7,7,N'Làm rách',15000,2,30000,N'')
insert into ChiTietPhieuPhat values(8,8,N'Làm bẩn',20000,1,20000,N'')
insert into ChiTietPhieuPhat values(9,9,N'Làm rách',20000,3,60000,N'')
insert into ChiTietPhieuPhat values(10,10,N'Làm mất',20000,2,40000,N'')
---------------------------------18------------------------
select * from TheLoai
insert into TheLoai values(N'Truyện tranh',N'')
insert into TheLoai values(N'Truyện cười',N'')
insert into TheLoai values(N'Truyện trinh thám',N'')
insert into TheLoai values(N'Sách giáo khoa các lớp',N'')
insert into TheLoai values(N'Giáo trình',N'')
---------------------------------19--------------------------
select * from ChiTietTheLoai
insert into ChiTietTheLoai values (1,1,N'')
insert into ChiTietTheLoai values (2,2,N'')
insert into ChiTietTheLoai values (3,3,N'')
insert into ChiTietTheLoai values (4,4,N'')
insert into ChiTietTheLoai values (5,5,N'')


