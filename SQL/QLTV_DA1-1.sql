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
Ma varchar(9) not null,
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
GhiChu nvarchar(max) null
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
LoiPhat int not null,
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
Voucher varchar(max) null,
MaSach int null,
GiaSach varchar(max) null,
DongofGiam bit null,
KhuyenMai nvarchar(MAX) null
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


--delete LoaiDocGia where MaLoaiDocGia = 2
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
insert into Quyen values(N'Nhân viên', N'','000000000')
insert into Quyen values(N'Quản Lý', N'','000000001')

-----------------------------------------4---------------------------------------------------
select * from NhanVien
insert into NhanVien values(N'Nguyễn Thị Thủy', N'thuynt',12345,1,4000000,'1998/08/25','2017/8/20',1,'KT123456','01243101767',N'Trần Quý Cáp',N'')
insert into NhanVien values(N'Nguyễn Thị Minh Tâm', N'tamntm',12345,2,6000000,'1998/05/26','2017/8/20',1,'KT123457','01655730111',N'100/6 amakhe',N'')
insert into NhanVien values(N'Đỗ Huy Nhân', N'nhandh',12345,2,5000000,'1998/08/25','2017/02/15',0,'KT123876','0165545345',N'Trường Chinh',N'')
insert into NhanVien values(N'Đỗ Thị Chinh', N'chinhdt',12345,1,5000000,'1998-08-25','2017-04-14',1,'KT123453','01287456321',N'100 Lê Duẩn',N'')

----------------------------------5--------------------------------------------
select * from PhieuThue
select * from DocGia
select * from LoaiDocGia

insert into PhieuThue values('PT001',1,1,'2017/10/12','2017/10/17',24400,N'' )
insert into PhieuThue values('PT002',2,2,'2017/10/12','2017/10/17',44000,N'' )
insert into PhieuThue values('PT003',3,1,'2017/10/12','2017/10/17',18000,N'' )
insert into PhieuThue values('PT004',4,2,'2017/10/12','2017/10/17',25800,N'' )
insert into PhieuThue values('PT005',5,1,'2017/10/12','2017/10/17',40000,N'' )
insert into PhieuThue values('PT006',9,2,'2017/10/13','2017/10/18',24000,N'' )
insert into PhieuThue values('PT007',7,1,'2017/10/13','2017/10/18',15400,N'' )
insert into PhieuThue values('PT008',8,2,'2017/10/14','2017/10/19',41000,N'' )
insert into PhieuThue values('PT009',11,2,'2017/10/15','2017/10/19',18000,N'' )
insert into PhieuThue values('PT010',13,1,'2017/10/16','2017/10/20',14000,N'' )
insert into PhieuThue values('PT011',14,1,'2017/10/17','2017/10/22',53200,N'' )
insert into PhieuThue values('PT012',12,2,'2017/10/18','2017/10/23',12000,N'' )
insert into PhieuThue values('PT013',3,1,'2017/10/19','2017/10/24',100400,N'' )
insert into PhieuThue values('PT014',4,2,'2017/10/20','2017/10/25',32800,N'' )
insert into PhieuThue values('PT015',5,1,'2017/10/21','2017/10/26',40000,N'' )
insert into PhieuThue values('PT016',9,2,'2017/10/22','2017/10/27',16000,N'' )
insert into PhieuThue values('PT017',7,1,'2017/10/23','2017/10/28',8400,N'' )
insert into PhieuThue values('PT018',8,2,'2017/10/25','2017/11/01',44000,N'' )
insert into PhieuThue values('PT019',9,2,'2017/10/26','2017/11/02',18000,N'' )
insert into PhieuThue values('PT020',15,1,'2017/10/27','2017/11/03',16200,N'' )


insert into PhieuThue values('PT021',1,1,'2017/11/01','2017/11/06',21800,N'' )
insert into PhieuThue values('PT022',2,2,'2017/11/02','2017/11/07',27800,N'' )
insert into PhieuThue values('PT023',4,1,'2017/11/03','2017/11/08',16000,N'' )
insert into PhieuThue values('PT024',8,2,'2017/11/03','2017/11/08',4000,N'' )
insert into PhieuThue values('PT025',9,1,'2017/11/06','2017/11/11',4400,N'' )
insert into PhieuThue values('PT026',6,2,'2017/11/06','2017/11/11',44000,N'' )
insert into PhieuThue values('PT027',11,1,'2017/11/08','2017/11/13',18000,N'' )
insert into PhieuThue values('PT028',7,2,'2017/11/09','2017/11/14',16200,N'' )
insert into PhieuThue values('PT029',2,2,'2017/11/09','2017/11/14',21800,N'' )
insert into PhieuThue values('PT030',1,1,'2017/11/11','2017/11/16',27800,N'' )


-----------------------------------6--------------------------------------------
select * from PhieuPhat
select * from PhieuThue
insert into PhieuPhat values('1',1,1,'2017/10/17',15000,N'' )
insert into PhieuPhat values('3',3,1,'2017/10/17',40000,N'' )
insert into PhieuPhat values('10',15,2,'2017/10/20',18000,N'' )
insert into PhieuPhat values('9',13,1,'2017/11/02',240000,N'' )
insert into PhieuPhat values('2',2,2,'2017/11/07',100000,N'' )
insert into PhieuPhat values('4',4,2,'2017/11/07',30000,N'' )
insert into PhieuPhat values('7',8,1,'2017/11/08',30000,N'' )
insert into PhieuPhat values('5',6,1,'2017/11/11',20000,N'' )
insert into PhieuPhat values('7',8,1,'2017/11/08',60000,N'' )
insert into PhieuPhat values('6',2,2,'2017/11/14',40000,N'' )




--------------------------------------------7---------------------------------------------
select * from Sach
insert into Sach values(N'Doreamon',5,N'Sách mới nhập',30000,25000,N'NXB Kim Đồng',N'')
insert into Sach values(N'Conan tập đặc biệt',15,N'Sách mới nhập',20000,1500,N'NXB Kim Đồng',N'')
insert into Sach values(N'Thần đồng đất Việt',10,N'Sách mới nhập',5000,18000,N'NXB Thủy Nguyễn',N'')
insert into Sach values(N'Sách giáo khoa',5,N'Sách mới nhập',22000,16000,N'NXB Minh Tâm',N'')
insert into Sach values(N'Giáo trình ',5,N'Sách mới nhập',50000,40000,N'NXB Hoa Sen',N'')
insert into Sach values(N'Truyện cười',5,N'Sách mới nhập',20000,1500,N'NXB Huy Nhân',N'')
insert into Sach values(N'Shelock Homes',5,N'Sách mới nhập',150000,135000,N'NXB Kim Đồng',N'')
insert into Sach values(N'Hary Porter',16,N'Sách mới nhập',60000,50000,N'NXB Minh Tâm',N'')
insert into Sach values(N'Truyện cổ tích',10,N'Sách mới nhập',30000,25000,N'NXB Thủy Nguyễn',N'')
insert into Sach values(N'Tom & Jerry',5,N'Sách mới nhập',20000,1500,N'NXB Hoa Sen',N'')

insert into Sach values(N'Tuổi trẻ đáng bao nhiêu?',5,N'Sách mới nhập',56000,49000,N'NXB Kim Đồng',N'')
insert into Sach values(N'Học vị bất kì ai',5,N'Sách mới nhập',48000,39000,N'NXB Ánh Dương',N'')
insert into Sach values(N'Đắc nhân tâm',8,N'Sách mới nhập',61000,48000,N'NXB Thủy Nguyễn',N'')
insert into Sach values(N'Lối sống tối giản của người Nhật',5,N'Sách mới nhập',68000,59000,N'NXB Minh Tâm',N'')
insert into Sach values(N'Mình sinh ra đâu phải để buồn ',5,N'Sách mới nhập',58000,52000,N'NXB Hoa Sen',N'')
insert into Sach values(N'Bí quyết thành công khi khời nghiệp',3,N'Sách mới nhập',70000,50000,N'NXB Huy Nhân',N'')
insert into Sach values(N'Anh ấy đã không nắm tay tôi',5,N'Sách mới nhập',120000,100000,N'NXB Kim Đồng',N'')
insert into Sach values(N'Nhà giả kim',10,N'Sách mới nhập',60000,50000,N'NXB Minh Tâm',N'')
insert into Sach values(N'Hôm nay tôi thất tình',10,N'Sách mới nhập',86000,68000,N'NXB Thủy Nguyễn',N'')
insert into Sach values(N'Linh hồn tội lỗi',5,N'Sách mới nhập',120000,105000,N'NXB Hoa Sen',N'')


insert into Sach values(N'Iliad - Cuộc Chiến Thành Troy',5,N'sách cũ, nguyên vẹn',30000,25000,N'NXB Kim Đồng',N'')
insert into Sach values(N'Theseus Và Cuộn Chỉ Của Ariadne',5,N'sách cũ, nguyên vẹn',60000,45000,N'NXB Ánh Dương',N'')
insert into Sach values(N'Odyssey - Những Cuộc Phiêu Lưu Của Odysseus',2,N'sách cũ, nguyên vẹn',65000,56000,N'NXB Thủy Nguyễn',N'')
insert into Sach values(N'Chàng Hoàng Tử Hạnh Phúc - Ngôi Nhà Thạch Lựu',5,N'sách cũ, nguyên vẹn',120000,110000,N'NXB Minh Tâm',N'')
insert into Sach values(N'Thơ Tagore (Song Ngữ Việt - Anh) ',2,N'sách cũ, nguyên vẹn',150000,13000,N'NXB Hoa Sen',N'')
insert into Sach values(N'Mùa Hái Quả',3,N'sách cũ, nguyên vẹn',20000,12500,N'NXB Huy Nhân',N'')
insert into Sach values(N'Nhớ - Tuyển Tập Thơ Anh (Song Ngữ)',5,N'sách cũ, nguyên vẹn',35000,30000,N'NXB Kim Đồng',N'')
insert into Sach values(N'Địa Ngục Đỏ',2,N'sách cũ, nguyên vẹn',60000,50000,N'NXB Minh Tâm',N'')
insert into Sach values(N'Vì Người Ấy Là Em',2,N'sách cũ, nguyên vẹn',30000,25000,N'NXB Thủy Nguyễn',N'')
insert into Sach values(N'Cô Gái Vượt Thời Gian',5,N'sách cũ, nguyên vẹn',40000,35000,N'NXB Hoa Sen',N'')

insert into Sach values(N'Thủy Hử tập 1',2,N'sách cũ, nguyên vẹn',30000,25000,N'NXB Kim Đồng',N'')
insert into Sach values(N'Thủy Hử tập 2',2,N'sách cũ, nguyên vẹn',30000,25000,N'NXB Kim Đồng',N'')
insert into Sach values(N'Đôi Cánh Bị Lãng Quên',1,N'sách cũ, nguyên vẹn',56500,53000,N'NXB Thủy Nguyễn',N'')
insert into Sach values(N'Lâu Đài Gỗ',1,N'sách cũ, nguyên vẹn',120000,100000,N'NXB Minh Tâm',N'')
insert into Sach values(N'Alice Ở Xứ Sở Trong Gương ',3,N'sách cũ, nguyên vẹn',55000,47000,N'NXB Hoa Sen',N'')
insert into Sach values(N'Truyện Cổ Tích Màu Lục',3,N'sách cũ, nguyên vẹn',20000,16500,N'NXB Huy Nhân',N'')
insert into Sach values(N'Cô Bé Có Mọi Món Quà',5,N'sách cũ, nguyên vẹn',35000,30000,N'NXB Kim Đồng',N'')
insert into Sach values(N'Nàng Công Chúa Giả Vờ Không Biết Mọi Chuyện',3,N'sách cũ, nguyên vẹn',60000,50000,N'NXB Minh Tâm',N'')
insert into Sach values(N'Anh Có Thích Nước Mỹ Không? ',2,N'sách cũ, nguyên vẹn',30000,25000,N'NXB Thủy Nguyễn',N'')
insert into Sach values(N'Đừng Nói Với Anh Ấy Tôi Vẫn Còn Yêu - Phần 2',1,N'sách cũ, nguyên vẹn',20000,50000,N'NXB Hoa Sen',N'')


insert into Sach values(N'Đừng Nói Với Anh Ấy Tôi Vẫn Còn Yêu - Phần 1',1,N'sách cũ, nguyên vẹn',20000,50000,N'NXB Hoa Sen',N'')
insert into Sach values(N'Hóa Ra Anh Vẫn Ở Đây',2,N'sách cũ, nguyên vẹn',20000,15000,N'NXB Ánh Dương',N'')
insert into Sach values(N'Đừng Nhắc Em Nhớ Lại!',1,N'sách cũ, nguyên vẹn',2500,18000,N'NXB Thủy Nguyễn',N'')
insert into Sach values(N'Nửa Đường Xuất Giá',1,N'sách cũ, nguyên vẹn',220000,190000,N'NXB Minh Tâm',N'')
insert into Sach values(N'Ước Hẹn Phù Hoa ',1,N'sách cũ, nguyên vẹn',5000,120000,N'NXB Hoa Sen',N'')
insert into Sach values(N'Bong Bóng Mùa Hè ',3,N'sách cũ, nguyên vẹn',20000,15000,N'NXB Huy Nhân',N'')
insert into Sach values(N'Lý Thuyết Số Và Chuyên Đề Nâng Cao',1,N'sách cũ, nguyên vẹn',35000,30000,N'NXB Kim Đồng',N'')
insert into Sach values(N'Kinh Tế Vĩ Mô',1,N'sách cũ, nguyên vẹn',60000,50000,N'NXB Minh Tâm',N'')
insert into Sach values(N'Đa Thức - Chuỗi & Chuyên Đề Nâng Cao',1,N'sách cũ, nguyên vẹn',30000,25000,N'NXB Thủy Nguyễn',N'')
insert into Sach values(N'Chuẩn Bị Kiến Thức Ôn Thi Tốt Nghiệp Trung Học Phổ Thông Và Tuyển Sinh Đại Học, Cao Đẳng - Môn Tiếng Pháp',5,N'sách cũ, nguyên vẹn',25000,15000,N'NXB Hoa Sen',N'')


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

insert into NhaCungCap values(N'Công ty TNHH phát hành Tây Nguyên',N'136, Nguyễn Công Trứ, P. Tự An, Thành phố Buôn Ma Thuột, T. Đắk Lắk','01655730111',N'nccHN@gmail.com',N'')
insert into NhaCungCap values(N'Nhà xuất bản Giáo dục Việt Nam ',N'Nguyễn Chí Thanh_TP Hồ Chí Minh','01243101767',N'minhtamcp@gmail.com',N'')
insert into NhaCungCap values(N'Nhà Xuất Bản Trẻ',N'Hòa Phú-Đà Nẵng','0935539808',N'nccPhuongDong@gmail.com',N'')
insert into NhaCungCap values(N'Nhà Xuất Bản Kim Đồng',N'Nha Trang','01273568459',N'NhaTrang@gmail.com',N'')
insert into NhaCungCap values(N'Công ty TNHH Sách Phương Nam:',N' 940 Đường Ba tháng Hai, Phường 15, Quận 11, TP.HCM','0976197097',N'lienhenxbtrithuc@gmail.com',N'')


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
--select * from Sach
/*
UPDATE PhieuThue SET
TongTien =( select Sum(ThanhTien) from ChiTietPhieuThue
where MaPhieuThue = 30)
where MaPhieuThue = 30
*/
select * from ChiTietPhieuThue
insert into ChiTietPhieuThue values(01,1,6000,2,12000,N'')
insert into ChiTietPhieuThue values(01,2,4000,1,4000,N'')
insert into ChiTietPhieuThue values(01,3,4000,1,4000,N'')
insert into ChiTietPhieuThue values(01,4,4400,1,4400,N'')
insert into ChiTietPhieuThue values(02,5,10000,1,10000,N'')
insert into ChiTietPhieuThue values(02,6,4000,1,4000,N'')
insert into ChiTietPhieuThue values(02,7,30000,1,30000,N'')
insert into ChiTietPhieuThue values(03,8,12000,1,12000,N'')
insert into ChiTietPhieuThue values(03,9,6000,1,6000,N'')
insert into ChiTietPhieuThue values(04,10,4000,1,4000,N'')
insert into ChiTietPhieuThue values(04,11,12200,1,12200,N'')
insert into ChiTietPhieuThue values(04,12,9600,1,9600,N'')
insert into ChiTietPhieuThue values(05,13,12200,1,12200,N'')
insert into ChiTietPhieuThue values(05,14,13600,1,13600,N'')
insert into ChiTietPhieuThue values(05,15,14200,1,14200,N'')
--
insert into ChiTietPhieuThue values(06,21,6000,2,12000,N'')
insert into ChiTietPhieuThue values(06,22,12000,1,12000,N'')
insert into ChiTietPhieuThue values(07,23,1300,1,13000,N'')
insert into ChiTietPhieuThue values(07,24,2400,1,2400,N'')
insert into ChiTietPhieuThue values(08,25,30000,1,30000,N'')
insert into ChiTietPhieuThue values(08,26,4000,1,4000,N'')
insert into ChiTietPhieuThue values(08,27,7000,1,7000,N'')
insert into ChiTietPhieuThue values(09,28,12000,1,12000,N'')
insert into ChiTietPhieuThue values(09,29,6000,1,6000,N'')
insert into ChiTietPhieuThue values(10,30,8000,1,8000,N'')
insert into ChiTietPhieuThue values(10,31,6000,1,6000,N'')
insert into ChiTietPhieuThue values(11,32,6000,1,6000,N'')
insert into ChiTietPhieuThue values(11,33,12200,1,12200,N'')
insert into ChiTietPhieuThue values(11,34,24000,1,24000,N'')
insert into ChiTietPhieuThue values(11,35,11000,1,11000,N'')

insert into ChiTietPhieuThue values(12,41,4000,2,4000,N'')
insert into ChiTietPhieuThue values(12,42,4000,1,4000,N'')
insert into ChiTietPhieuThue values(12,43,4000,1,4000,N'')
insert into ChiTietPhieuThue values(13,44,4400,1,4400,N'')
insert into ChiTietPhieuThue values(13,45,10000,1,10000,N'')
insert into ChiTietPhieuThue values(13,46,4000,1,4000,N'')
insert into ChiTietPhieuThue values(13,47,7000,1,70000,N'')
insert into ChiTietPhieuThue values(13,48,12000,1,12000,N'')
insert into ChiTietPhieuThue values(14,49,6000,1,6000,N'')
insert into ChiTietPhieuThue values(14,50,5000,1,5000,N'')
insert into ChiTietPhieuThue values(14,11,12200,1,12200,N'')
insert into ChiTietPhieuThue values(14,12,9600,1,9600,N'')
insert into ChiTietPhieuThue values(15,13,12200,1,12200,N'')
insert into ChiTietPhieuThue values(15,14,13600,1,13600,N'')
insert into ChiTietPhieuThue values(15,15,14200,1,14200,N'')
---------
insert into ChiTietPhieuThue values(16,1,6000,2,12000,N'')
insert into ChiTietPhieuThue values(16,2,4000,1,4000,N'')
insert into ChiTietPhieuThue values(17,3,4000,1,4000,N'')
insert into ChiTietPhieuThue values(17,4,4400,1,4400,N'')
insert into ChiTietPhieuThue values(18,5,10000,1,10000,N'')
insert into ChiTietPhieuThue values(18,6,4000,1,4000,N'')
insert into ChiTietPhieuThue values(18,7,30000,1,30000,N'')
insert into ChiTietPhieuThue values(19,8,12000,1,12000,N'')
insert into ChiTietPhieuThue values(19,9,6000,1,6000,N'')
insert into ChiTietPhieuThue values(20,10,4000,1,4000,N'')
insert into ChiTietPhieuThue values(20,11,12200,1,12200,N'')
insert into ChiTietPhieuThue values(21,12,9600,1,9600,N'')
insert into ChiTietPhieuThue values(21,13,12200,1,12200,N'')
insert into ChiTietPhieuThue values(22,14,13600,1,13600,N'')
insert into ChiTietPhieuThue values(22,15,14200,1,14200,N'')

insert into ChiTietPhieuThue values(23,1,6000,2,12000,N'')
insert into ChiTietPhieuThue values(23,2,4000,1,4000,N'')
insert into ChiTietPhieuThue values(24,3,4000,1,4000,N'')
insert into ChiTietPhieuThue values(25,4,4400,1,4400,N'')
insert into ChiTietPhieuThue values(26,5,10000,1,10000,N'')
insert into ChiTietPhieuThue values(26,6,4000,1,4000,N'')
insert into ChiTietPhieuThue values(26,7,30000,1,30000,N'')
insert into ChiTietPhieuThue values(27,8,12000,1,12000,N'')
insert into ChiTietPhieuThue values(27,9,6000,1,6000,N'')
insert into ChiTietPhieuThue values(28,10,4000,1,4000,N'')
insert into ChiTietPhieuThue values(28,11,12200,1,12200,N'')
insert into ChiTietPhieuThue values(29,12,9600,1,9600,N'')
insert into ChiTietPhieuThue values(29,13,12200,1,12200,N'')
insert into ChiTietPhieuThue values(30,14,13600,1,13600,N'')
insert into ChiTietPhieuThue values(30,15,14200,1,14200,N'')



-----------------------------14-------------------------------------
select * from TacGia
insert into TacGia values(N'Nguyễn Thị Minh Tâm',N'',1,'1998/05/26',N'Đăk Lăk',N'')
insert into TacGia values(N'Nguyễn Thị Thùy Linh',N'',1,'1982/05/16',N'Nghệ An',N'')
insert into TacGia values(N'Nguyễn Hoàng Anh',N'',0,'1984/01/26',N'Lâm Đồng',N'')
insert into TacGia values(N'Đinh Mạnh Ninh',N'',0,'1988/05/26',N'Đà Nẵng',N'')
insert into TacGia values(N'Hoàng Long Vũ',N'',0,'1979/03/26',N'Hà Nội',N'')
insert into TacGia values(N'Linh Trần',N'',1,'1982/05/26',N'Hồ Chí Minh',N'')

insert into TacGia values(N'Conan Doyle',N'',0,'1974/08/25',N'LonDon, Anh',N'Đối với các độc giả yêu thích dòng văn trinh thám nói riêng cũng như những người yêu sách trên toàn thế giới nói chung thì không phải nói nhiều về sức hút của hai cái tên: nhà văn Conan Doyle và “đứa con tinh thần” của cả cuộc đời ông - Sherlock Holmes')
insert into TacGia values(N'',N'Cửu Lộ Phi Hương',1,'1985/02/15',N'Tấn Giang, Trung Quốc',N'Cửu Lộ Phi Hương là tác giả của trang tiểu thuyết Tấn Giang, một em gái mũm mĩm thích ăn thịt, thường viết truyện vừa, trong tác phẩm không tỏ vẻ uyên thâm hay màu mè, cách hành văn ngắn gọn, dễ hiểu và hài hước.')
insert into TacGia values(N'Đồng Hoa',N' Trương Tiểu Tam  ',1,'1982/10/18',N'Bắc Kinh',N'Tốt nghiệp tại đại học Bắc Kinh.Là một trong “Tứ đại thiên hậu” của dòng tân tiểu thuyết ngôn tình, được phong là Nhiên tình thiên hậu. Từng tốt nghiệp học viện quản lý Quang Hoa thuộc đại học Bắc Kinh, sau khi tốt nghiệp làm công việc phân tích tài chính tại ngân hàng Trung Quốc ở Thẩm Quyến. Hiện đang cùng chồng định cư tại New York, Mĩ.')

insert into TacGia values(null,N'Đường Thất Công Tử',1,'1986/08/26',N'Thái Bình',N'Đường Thất Công Tử là một nhà văn nữ thuộc thế hệ 8X, khi còn học trung học đã đọc sách của Oscar Wilde, trong đó có một câu mà cô luôn ghi nhớ: "Một người muốn trở lại tuổi thanh xuân chỉ cần làm lại những việc ngốc nghếch đã từng làm là đủ rồi". Thế nên hàng ngày cô đều làm những việc ngốc nghếch, vừa tươi trẻ,lại vừa cảm thấy mình cứ tiếp tục tươi trẻ mãi như thế này thật không hay.')

-------------------------15---------------------------------------
select * from KhuyenMai
select * from Sach
--insert into KhuyenMai(NgayBatDau,NgayKetThuc,SoTienHoaDon,KhuyenMai) values('2017/02/14','2017/02/20',150000,N'Giảm giá 15% cho đơn hàng trên 150k')
--insert into KhuyenMai(NgayBatDau,NgayKetThuc,MaSach,KhuyenMai) values('2017/03/26','2017/04/01',200000,N'Giảm giá 20% cho đơn hàng trên 200k')
--insert into KhuyenMai(NgayBatDau,NgayKetThuc,SoLuong,KhuyenMai) values('2017/05/01','2017/05/03',10,N'Giảm giá 15% cho khách hàng mua trên 10 cuốn sách')


insert into KhuyenMai(NgayBatDau,NgayKetThuc,MaSach,GiaSach,DongofGiam,KhuyenMai) values('2017/06/01','2017/12/05',1,0.1,0,N'Giảm giá 10% ')
insert into KhuyenMai(NgayBatDau,NgayKetThuc,MaSach,GiaSach,DongofGiam,KhuyenMai) values('2017/06/01','2017/12/05',1,0.12,0,N'Giảm giá 12%')
insert into KhuyenMai(NgayBatDau,NgayKetThuc,MaSach,GiaSach,DongofGiam,KhuyenMai) values('2017/06/01','2017/12/05',3,0.1,0,N'Giảm giá 10%')
insert into KhuyenMai(NgayBatDau,NgayKetThuc,MaSach,GiaSach,DongofGiam,KhuyenMai) values('2017/06/01','2017/06/05',5,0.15,0,N'Giảm giá 15%')
insert into KhuyenMai(NgayBatDau,NgayKetThuc,MaSach,GiaSach,DongofGiam,KhuyenMai) values('2017/06/01','2017/06/05',7,0.25,0,N'Giảm giá 25%')

insert into KhuyenMai(NgayBatDau,NgayKetThuc,MaSach,GiaSach,DongofGiam,KhuyenMai) values('2017/07/01','2017/12/05',1,25000,1,N'Đồng giá 25k')
insert into KhuyenMai(NgayBatDau,NgayKetThuc,MaSach,GiaSach,DongofGiam,KhuyenMai) values('2017/07/01','2017/12/05',2,25000,1,N'Đồng giá 25k')
insert into KhuyenMai(NgayBatDau,NgayKetThuc,MaSach,GiaSach,DongofGiam,KhuyenMai) values('2017/07/01','2017/12/05',4,25000,1,N'Đồng giá 25k')
insert into KhuyenMai(NgayBatDau,NgayKetThuc,MaSach,GiaSach,DongofGiam,KhuyenMai) values('2017/07/01','2017/07/05',6,25000,1,N'Đồng giá 25k')
insert into KhuyenMai(NgayBatDau,NgayKetThuc,MaSach,GiaSach,DongofGiam,KhuyenMai) values('2017/07/01','2017/12/05',7,25000,1,N'Đồng giá 25k')
insert into KhuyenMai(NgayBatDau,NgayKetThuc,MaSach,GiaSach,DongofGiam,KhuyenMai) values('2017/07/01','2017/07/05',9,25000,1,N'Đồng giá 25k')


insert into KhuyenMai(NgayBatDau,NgayKetThuc,SoTienHoaDon,GiaSach,KhuyenMai) values('2017/08/14','2017/08/20',150000,0.15,N'Giảm giá 15% cho đơn hàng trên 150k')
insert into KhuyenMai(NgayBatDau,NgayKetThuc,SoTienHoaDon,GiaSach,KhuyenMai) values('2017/10/26','2017/10/01',200000,0.2,N'Giảm giá 20% cho đơn hàng trên 200k')


insert into KhuyenMai(NgayBatDau,NgayKetThuc,SoLuong,GiaSach,KhuyenMai) values('2017/11/01','2017/11/03',10,0.05,N'Giảm giá 5% cho khách hàng mua trên 10 cuốn sách')
insert into KhuyenMai(NgayBatDau,NgayKetThuc,SoLuong,GiaSach,KhuyenMai) values('2017/11/01','2017/12/03',20,0.1,N'Giảm giá 10% cho khách hàng mua trên 20 cuốn sách')
insert into KhuyenMai(NgayBatDau,NgayKetThuc,SoLuong,GiaSach,KhuyenMai) values('2017/11/01','2017/12/03',30,0.15,N'Giảm giá 15% cho khách hàng mua trên 30 cuốn sách')

insert into KhuyenMai(NgayBatDau,NgayKetThuc,Voucher,GiaSach,KhuyenMai) values('2017/11/01','2017/12/03','MUNGKHAITRUONG',0.15,N'Giảm giá 15% cho Voucher')
insert into KhuyenMai(NgayBatDau,NgayKetThuc,Voucher,GiaSach,KhuyenMai) values('2017/11/01','2017/12/03','11111111111111',0.15,N'Giảm giá 20% cho Voucher')
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
insert into ChiTietPhieuPhat values(1,1,0.6,15000,1,15000,N'')
insert into ChiTietPhieuPhat values(2,2,1,20000,2,40000,N'')
insert into ChiTietPhieuPhat values(3,3,1,9000,1,18000,N'')
insert into ChiTietPhieuPhat values(4,4,1,120000,2,240000,N'')
insert into ChiTietPhieuPhat values(5,5,2,100000,1,100000,N'')
insert into ChiTietPhieuPhat values(6,6,2,10000,3,30000,N'')
insert into ChiTietPhieuPhat values(7,7,2,15000,2,30000,N'')
insert into ChiTietPhieuPhat values(8,8,2,20000,1,20000,N'')
insert into ChiTietPhieuPhat values(9,9,2,20000,3,60000,N'')
insert into ChiTietPhieuPhat values(10,10,3,20000,2,40000,N'')
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

select * from LoaiDocGia
Select * from ChiTietPhieuThue,PhieuThue 
where ChiTietPhieuThue.MaPhieuThue = PhieuThue.MaPhieuThue 
								  and SoPhieuThue = 'PT003'

								  Select NgayTra,TongTien from PhieuThue where MaPhieuThue =3