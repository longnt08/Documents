CREATE DATABASE QL_BanThuocThietBiYTe
USE QL_BanThuocThietBiYTe

--Tạo bảng nhà cung cấp
CREATE TABLE NhaCungCap (
MaNCC CHAR(20) PRIMARY KEY,
TenNCC NCHAR(100), 
DienThoai CHAR(15),
Email CHAR(50) )

--Tạo bảng loại sản phẩm
CREATE TABLE LoaiSanPham (
MaLoaiSP CHAR(20) PRIMARY KEY, 
TenLoaiSP NCHAR(100) )

--Tạo bảng sản phẩm
CREATE TABLE SanPham (
MaSanPham CHAR(20) PRIMARY KEY,
TenSanPham NCHAR(100),
MaNCC CHAR(20) REFERENCES NhaCungCap(MaNCC),
MaLoaiSP CHAR(20) REFERENCES LoaiSanPham(MaLoaiSP),
GiaSanPham DECIMAL(18, 2),
TonKho INT )

--Tạo bảng khách hàng
CREATE TABLE KhachHang (
MaKhachHang CHAR(20) PRIMARY KEY,
TenKhachHang NCHAR(100),
DiaChi NCHAR(100),
Sdt CHAR(15),
Email CHAR(50) )

--Tạo bảng đơn hàng
CREATE TABLE DonHang (
MaDonHang CHAR(20) PRIMARY KEY,
MaKhachHang CHAR(20) REFERENCES KhachHang(MaKhachHang),
NgayLap DATE,
TongSo INT,
TongTien DECIMAL(18, 2) )

--Tạo bảng chi tiết đơn hàng
CREATE TABLE ChiTietDonHang (
MaCT_DH CHAR(20) PRIMARY KEY,
MaDonHang CHAR(20) REFERENCES DonHang(MaDonHang),
MaSanPham CHAR(20) REFERENCES SanPham(MaSanPham),
SoLuong INT,
Gia DECIMAL(18, 2) )

--Thêm thông tin bảng nhà cung cấp (20)
EXEC sp_help NhaCungCap
INSERT INTO NhaCungCap (MaNCC, TenNCC, DienThoai, Email)
VALUES 
('NCC1', N'Công ty cổ phần Dược Vĩnh Kim', '0333444555', 'ctydvkim@gmail.com'),
('NCC2', N'Công ty cổ phần dược liệu TW2', '033322211', 'ctydltw2@gmail.com'),
('NCC3', N'Công ty cổ phần Merupha', '02345678', 'merupha@gmail.com'),
('NCC4', N'Công ty dược Việt Nam', '0321123456', 'vnduoc@gmail.com'),
('NCC5', N'Công ty cổ phần Dược Hậu Giang', '02222222', 'duochaugiang@gmail.com')

SELECT *FROM NhaCungCap;

--Thêm thông tin bảng loại sản phẩm
EXEC sp_help LoaiSanPham
INSERT INTO LoaiSanPham (MaLoaiSP, TenLoaiSP)
VALUES 
('TBYT', N'Thiết bị y tế'),
('TH', N'Thuốc')

SELECT *FROM LoaiSanPham;

--Thêm thông tin bảng sản phẩm
EXEC sp_help SanPham
INSERT INTO SanPham 
VALUES 
('SP1', N'Nhiệt kế', 'NCC1', 'TBYT', 30000, 5000),
('SP2', N'Vicks VapoRub', 'NCC1', 'TH', 20000, 500),
('SP3', N'Strepsils', 'NCC1', 'TH', 15000, 200),
('SP4', N'Pastille ho', 'NCC1', 'TH', 7000, 0),
('SP5', N'Bromhexin', 'NCC1', 'TH', 25000, 500),
('SP6', N'Guaifenesin', 'NCC2', 'TH', 50000, 1000),
('SP7', N'Ambroxol', 'NCC2', 'TH', 100000, 6000),
('SP8', N'siro tiêu chảy', 'NCC2', 'TH', 30000, 520),
('SP9', N'Medical gloves (Găng tay y tế)', 'NCC2', 'TBYT', 30000, 5000),
('SP10', N'Suction pump (Máy hút)', 'NCC2', 'TBYT', 3000000, 5000),
('SP11', N'Oxygen mask (Mặt nạ oxy)', 'NCC3', 'TBYT', 500000, 400),
('SP12', N'Paracetamol', 'NCC3', 'TH', 30000, 5000),
('SP13', N'Ibuprofen', 'NCC3', 'TH', 80000, 500),
('SP14', N'ECG electrodes (Cực điện tâm đồ)', 'NCC3', 'TBYT', 4000000, 50),
('SP15', N'Scalpel (Dao mổ)', 'NCC3', 'TBYT', 300000, 1101),
('SP16', N'Aspirin', 'NCC4', 'TH', 30000, 10000),
('SP17', N'Cetirizine', 'NCC4', 'TH', 40000, 5003),
('SP18', N'Syringe (Ống tiêm)', 'NCC4', 'TBYT', 100000, 8000),
('SP19', N'Wheelchair (Xe lăn)', 'NCC4', 'TBYT', 6000000, 10),
('SP20', N'Crutches (Gậy chống)', 'NCC4', 'TBYT', 400000, 3000),
('SP21', N'Glucometer (Máy đo đường huyết)', 'NCC5', 'TBYT', 2500000, 500),
('SP22', N'Sphygmomanometer (Máy đo áp huyết)', 'NCC5', 'TBYT', 3000000, 440),
('SP23', N'Albuterol', 'NCC5', 'TH', 300000, 9000),
('SP24', N'Insulin', 'NCC5', 'TH', 400000, 2000),
('SP25', N'Ultrasound machine (Máy siêu âm)', 'NCC5', 'TBYT', 10000000, 250),
('SP10', N'Suction pump (Máy hút)', 'NCC2', 'TBYT', 3000000, 5000),
('SP10', N'Suction pump (Máy hút)', 'NCC2', 'TBYT', 3000000, 5000),
('SP10', N'Suction pump (Máy hút)', 'NCC2', 'TBYT', 3000000, 5000),
('SP10', N'Suction pump (Máy hút)', 'NCC2', 'TBYT', 3000000, 5000),
('SP10', N'Suction pump (Máy hút)', 'NCC2', 'TBYT', 3000000, 5000),
('SP10', N'Suction pump (Máy hút)', 'NCC2', 'TBYT', 3000000, 5000)

SELECT *FROM SanPham;

--Thêm thông tin bảng khách hàng
EXEC sp_help KhachHang
INSERT INTO KhachHang 
VALUES 
('KH1', N'Nguyễn Văn Tèo', N'Phú Thọ', '011223456', 'teo@gmail.com'),
('KH2', N'Nguyễn Văn Tý', N'Hà Nội', '014564656', 'ty@gmail.com'),
('KH3', N'Nguyễn Thị Xuân', N'Sài Gòn', '075445646', 'xuant@gmail.com'),
('KH4', N'Nguyễn Thị Hạ', N'Nghệ An', '016634636', 'hant@gmail.com'),
('KH5', N'Nguyễn Thị Thu', N'Mộc Châu', '063464536', 'thunt@gmail.com'),
('KH6', N'Nguyễn Văn Đông', N'Quảng Trị', '03534567', 'dongnv@gmail.com'),
('KH7', N'Nguyễn Thị Mai', N'Cà Mau', '04457454', 'maimai@gmail.com'),
('KH8', N'Nguyễn Văn Sáng', N'Kon-Tum', '077574575', 'sang@gmail.com')

UPDATE KhachHang SET DiaChi = N'Cà Mau' WHERE MaKhachHang = 'KH7'

SELECT *FROM KhachHang;


--Thêm thông tin bảng đơn hàng
EXEC sp_help DonHang
INSERT INTO DonHang 
VALUES 
('DH1', 'KH1', '2024/3/19', 0, 0 ),
('DH2', 'KH1', '2024/1/19', 0, 0 ),
('DH3', 'KH1', '2024/2/10', 0, 0 ),
('DH4', 'KH2', '2024/1/1', 0, 0 ),
('DH5', 'KH2', '2024/3/1', 0, 0 ),
('DH6', 'KH2', '2023/12/21', 0, 0 ),
('DH7', 'KH3', '2024/4/1', 0, 0 ),
('DH8', 'KH3', '2024/1/10', 0, 0 ),
('DH9', 'KH3', '2024/2/8', 0, 0 ),
('DH10', 'KH4', '2024/1/5', 0, 0 ),
('DH11', 'KH4', '2024/1/15', 0, 0 ),
('DH12', 'KH4', '2024/3/30', 0, 0 ),
('DH13', 'KH5', '2024/1/2', 0, 0 ),
('DH14', 'KH5', '2024/3/19', 0, 0 ),
('DH15', 'KH5', '2024/1/11', 0, 0 ),
('DH16', 'KH6', '2024/3/12', 0, 0 ),
('DH17', 'KH6', '2023/11/12', 0, 0 ),
('DH18', 'KH6', '2024/1/25', 0, 0 ),
('DH19', 'KH7', '2024/2/20', 0, 0 ),
('DH20', 'KH7', '2024/2/9', 0, 0 ),
('DH21', 'KH7', '2024/2/8', 0, 0 ),
('DH22', 'KH8', '2024/4/5', 0, 0 ),
('DH23', 'KH8', '2024/1/16', 0, 0 ),
('DH24', 'KH8', '2024/3/17', 0, 0 ),
('DH1', 'KH1', '2024/3/19', 0, 0 ),
('DH1', 'KH1', '2024/3/19', 0, 0 ),
('DH1', 'KH1', '2024/3/19', 0, 0 ),
('DH1', 'KH1', '2024/3/19', 0, 0 ),
('DH1', 'KH1', '2024/3/19', 0, 0 ),
('DH1', 'KH1', '2024/3/19', 0, 0 ),
('DH1', 'KH1', '2024/3/19', 0, 0 ),
('DH1', 'KH1', '2024/3/19', 0, 0 ),
('DH1', 'KH1', '2024/3/19', 0, 0 )
INSERT INTO DonHang
VALUES 
('DH25', 'KH1', '2024/4/5', 0, 0),
('DH26', 'KH2', '2024/4/6', 0, 0),
('DH27', 'KH3', '2024/4/7', 0, 0),
('DH28', 'KH4', '2024/4/8', 0, 0),
('DH29', 'KH5', '2024/4/9', 0, 0),
('DH30', 'KH6', '2024/4/10', 0, 0),
('DH31', 'KH7', '2024/4/11', 0, 0),
('DH32', 'KH8', '2024/4/12', 0, 0),
('DH33', 'KH1', '2024/4/13', 0, 0),
('DH34', 'KH2', '2024/4/14', 0, 0),
('DH35', 'KH3', '2024/4/15', 0, 0),
('DH36', 'KH4', '2024/4/16', 0, 0),
('DH37', 'KH5', '2024/4/17', 0, 0),
('DH38', 'KH6', '2024/4/18', 0, 0),
('DH39', 'KH7', '2024/4/19', 0, 0),
('DH40', 'KH8', '2024/4/20', 0, 0),
('DH41', 'KH1', '2024/4/21', 0, 0),
('DH42', 'KH2', '2024/4/22', 0, 0),
('DH43', 'KH3', '2024/4/23', 0, 0),
('DH44', 'KH4', '2024/4/24', 0, 0),
('DH45', 'KH5', '2024/4/25', 0, 0),
('DH46', 'KH6', '2024/4/26', 0, 0),
('DH47', 'KH7', '2024/4/27', 0, 0),
('DH48', 'KH8', '2024/4/28', 0, 0),
('DH49', 'KH1', '2024/4/29', 0, 0),
('DH50', 'KH2', '2024/4/30', 0, 0),
('DH51', 'KH3', '2024/5/1', 0, 0),
('DH52', 'KH4', '2024/5/2', 0, 0),
('DH53', 'KH5', '2024/5/3', 0, 0),
('DH54', 'KH6', '2024/5/4', 0, 0),
('DH55', 'KH7', '2024/5/5', 0, 0),
('DH56', 'KH8', '2024/5/6', 0, 0),
('DH57', 'KH1', '2024/5/7', 0, 0),
('DH58', 'KH2', '2024/5/8', 0, 0);

SELECT *FROM DonHang;

--Thêm thông tin bảng chi tiết đơn hàng
EXEC sp_help ChiTietDonHang
INSERT INTO ChiTietDonHang 
VALUES 
('CTD1', 'DH1', 'SP1', 10, 0),
('CTD2', 'DH1', 'SP2', 5, 0),
('CTD3', 'DH1', 'SP3', 50, 0),
('CTD4', 'DH2', 'SP20', 10, 0),
('CTD5', 'DH2', 'SP5', 5, 0),
('CTD6', 'DH2', 'SP6', 6, 0),
('CTD7', 'DH3', 'SP7', 5, 0),
('CTD8', 'DH3', 'SP8', 200, 0),
('CTD9', 'DH3', 'SP9', 233, 0),
('CTD10', 'DH4', 'SP10', 400, 0),
('CTD11', 'DH4', 'SP11', 10, 0),
('CTD12', 'DH4', 'SP12', 300, 0),
('CTD13', 'DH5', 'SP13', 50, 0),
('CTD14', 'DH5', 'SP14', 8, 0),
('CTD15', 'DH5', 'SP15', 95, 0),
('CTD16', 'DH6', 'SP16', 102, 0),
('CTD17', 'DH6', 'SP17', 200, 0),
('CTD18', 'DH6', 'SP18', 1200, 0),
('CTD19', 'DH7', 'SP19', 3, 0),
('CTD20', 'DH7', 'SP21', 150, 0),
('CTD21', 'DH7', 'SP22', 80, 0),
('CTD22', 'DH8', 'SP23', 2000, 0),
('CTD23', 'DH8', 'SP24', 200, 0),
('CTD24', 'DH8', 'SP25', 66, 0),
('CTD25', 'DH9', 'SP1', 100, 0),
('CTD26', 'DH9', 'SP2', 14, 0),
('CTD27', 'DH9', 'SP3', 2, 0),
('CTD28', 'DH10', 'SP5', 10, 0),
('CTD29', 'DH10', 'SP6', 50, 0),
('CTD30', 'DH10', 'SP7', 45, 0),
('CTD31', 'DH11', 'SP8', 203, 0),
('CTD32', 'DH11', 'SP9', 16, 0),
('CTD33', 'DH11', 'SP10', 4, 0),
('CTD34', 'DH12', 'SP11', 100, 0),
('CTD35', 'DH12', 'SP12', 300, 0),
('CTD36', 'DH12', 'SP13', 20, 0),
('CTD37', 'DH13', 'SP14', 10, 0),
('CTD38', 'DH13', 'SP15', 200, 0),
('CTD39', 'DH13', 'SP16', 500, 0),
('CTD40', 'DH14', 'SP17', 405, 0),
('CTD41', 'DH14', 'SP18', 800, 0),
('CTD42', 'DH14', 'SP19', 2, 0),
('CTD43', 'DH15', 'SP20', 222, 0),
('CTD44', 'DH15', 'SP21', 40, 0),
('CTD45', 'DH15', 'SP22', 33, 0),
('CTD46', 'DH16', 'SP23', 1102, 0),
('CTD47', 'DH16', 'SP24', 600, 0),
('CTD48', 'DH16', 'SP25', 11, 0),
('CTD49', 'DH17', 'SP1', 200, 0),
('CTD50', 'DH17', 'SP2', 20, 0),
('CTD51', 'DH17', 'SP3', 20, 0),
('CTD52', 'DH18', 'SP5', 20, 0),
('CTD53', 'DH18', 'SP6', 150, 0),
('CTD54', 'DH18', 'SP7', 150, 0),
('CTD55', 'DH19', 'SP8', 70, 0),
('CTD56', 'DH19', 'SP9', 1000, 0),
('CTD57', 'DH19', 'SP10', 9, 0),
('CTD58', 'DH20', 'SP11', 50, 0),
('CTD59', 'DH20', 'SP12', 800, 0),
('CTD60', 'DH20', 'SP13', 70, 0),
('CTD61', 'DH20', 'SP14', 3, 0),
('CTD62', 'DH21', 'SP15', 200, 0),
('CTD63', 'DH21', 'SP16', 999, 0),
('CTD64', 'DH21', 'SP17', 345, 0),
('CTD65', 'DH22', 'SP18', 800, 0),
('CTD66', 'DH22', 'SP19', 1, 0),
('CTD67', 'DH22', 'SP20', 400, 0),
('CTD68', 'DH22', 'SP21', 18, 0),
('CTD69', 'DH22', 'SP22', 20, 0),
('CTD70', 'DH23', 'SP23', 1333, 0),
('CTD71', 'DH23', 'SP24', 234, 0),
('CTD72', 'DH23', 'SP25', 21, 0),
('CTD73', 'DH24', 'SP1', 221, 0),
('CTD74', 'DH24', 'SP2', 20, 0),
('CTD75', 'DH24', 'SP11', 50, 0)
INSERT INTO ChiTietDonHang
VALUES
('CTD76', 'DH25', 'SP26', 5, 0),
('CTD77', 'DH25', 'SP27', 10, 0),
('CTD78', 'DH25', 'SP28', 20, 0),
('CTD79', 'DH26', 'SP29', 8, 0),
('CTD80', 'DH26', 'SP30', 15, 0),
('CTD81', 'DH26', 'SP31', 30, 0),
('CTD82', 'DH27', 'SP32', 12, 0),
('CTD83', 'DH27', 'SP33', 25, 0),
('CTD84', 'DH27', 'SP34', 40, 0),
('CTD85', 'DH28', 'SP35', 20, 0),
('CTD86', 'DH28', 'SP36', 5, 0),
('CTD87', 'DH28', 'SP37', 18, 0),
('CTD88', 'DH29', 'SP38', 10, 0),
('CTD89', 'DH29', 'SP39', 12, 0),
('CTD90', 'DH29', 'SP40', 22, 0),
('CTD91', 'DH30', 'SP41', 15, 0),
('CTD92', 'DH30', 'SP42', 25, 0),
('CTD93', 'DH30', 'SP43', 30, 0),
('CTD94', 'DH31', 'SP44', 8, 0),
('CTD95', 'DH31', 'SP45', 17, 0),
('CTD96', 'DH31', 'SP46', 10, 0),
('CTD97', 'DH32', 'SP47', 12, 0),
('CTD98', 'DH32', 'SP48', 15, 0),
('CTD99', 'DH32', 'SP49', 20, 0),
('CTD100', 'DH33', 'SP50', 5, 0),
('CTD101', 'DH33', 'SP1', 10, 0),
('CTD102', 'DH33', 'SP2', 20, 0),
('CTD103', 'DH34', 'SP3', 25, 0),
('CTD104', 'DH34', 'SP4', 30, 0),
('CTD105', 'DH34', 'SP5', 15, 0),
('CTD106', 'DH35', 'SP6', 20, 0),
('CTD107', 'DH35', 'SP7', 35, 0),
('CTD108', 'DH35', 'SP8', 40, 0),
('CTD109', 'DH36', 'SP9', 8, 0),
('CTD110', 'DH36', 'SP10', 18, 0),
('CTD111', 'DH36', 'SP11', 25, 0),
('CTD112', 'DH37', 'SP12', 30, 0),
('CTD113', 'DH37', 'SP13', 35, 0),
('CTD114', 'DH37', 'SP14', 10, 0),
('CTD115', 'DH38', 'SP15', 15, 0),
('CTD116', 'DH38', 'SP16', 20, 0),
('CTD117', 'DH38', 'SP17', 25, 0),
('CTD118', 'DH39', 'SP18', 30, 0),
('CTD119', 'DH39', 'SP19', 12, 0),
('CTD120', 'DH39', 'SP20', 18, 0),
('CTD121', 'DH40', 'SP21', 10, 0),
('CTD122', 'DH40', 'SP22', 25, 0),
('CTD123', 'DH40', 'SP23', 30, 0),
('CTD124', 'DH41', 'SP24', 8, 0),
('CTD125', 'DH41', 'SP25', 15, 0),
('CTD126', 'DH42', 'SP26', 5, 0),
('CTD127', 'DH42', 'SP27', 10, 0),
('CTD128', 'DH42', 'SP28', 20, 0),
('CTD129', 'DH43', 'SP29', 8, 0),
('CTD130', 'DH43', 'SP30', 15, 0),
('CTD131', 'DH43', 'SP31', 30, 0),
('CTD132', 'DH44', 'SP32', 12, 0),
('CTD133', 'DH44', 'SP33', 25, 0),
('CTD134', 'DH44', 'SP34', 40, 0),
('CTD135', 'DH45', 'SP35', 20, 0),
('CTD136', 'DH45', 'SP36', 5, 0),
('CTD137', 'DH45', 'SP37', 18, 0),
('CTD138', 'DH46', 'SP38', 10, 0),
('CTD139', 'DH46', 'SP39', 12, 0),
('CTD140', 'DH46', 'SP40', 22, 0),
('CTD141', 'DH47', 'SP41', 15, 0),
('CTD142', 'DH47', 'SP42', 25, 0),
('CTD143', 'DH47', 'SP43', 30, 0),
('CTD144', 'DH48', 'SP44', 8, 0),
('CTD145', 'DH48', 'SP45', 17, 0),
('CTD146', 'DH48', 'SP46', 10, 0),
('CTD147', 'DH49', 'SP47', 12, 0),
('CTD148', 'DH49', 'SP48', 15, 0),
('CTD149', 'DH49', 'SP49', 20, 0),
('CTD150', 'DH50', 'SP50', 5, 0),
('CTD151', 'DH51', 'SP1', 10, 0),
('CTD152', 'DH51', 'SP2', 20, 0),
('CTD153', 'DH51', 'SP3', 25, 0),
('CTD154', 'DH52', 'SP4', 30, 0),
('CTD155', 'DH52', 'SP5', 15, 0),
('CTD156', 'DH52', 'SP6', 20, 0),
('CTD157', 'DH53', 'SP7', 18, 0),
('CTD158', 'DH53', 'SP8', 10, 0),
('CTD159', 'DH53', 'SP9', 12, 0),
('CTD160', 'DH54', 'SP10', 22, 0),
('CTD161', 'DH54', 'SP11', 15, 0),
('CTD162', 'DH54', 'SP12', 25, 0),
('CTD163', 'DH55', 'SP13', 30, 0),
('CTD164', 'DH55', 'SP14', 8, 0),
('CTD165', 'DH55', 'SP15', 17, 0),
('CTD166', 'DH56', 'SP16', 10, 0),
('CTD167', 'DH56', 'SP17', 12, 0),
('CTD168', 'DH56', 'SP18', 15, 0),
('CTD169', 'DH57', 'SP19', 20, 0),
('CTD170', 'DH57', 'SP20', 5, 0),
('CTD171', 'DH57', 'SP21', 10, 0),
('CTD172', 'DH58', 'SP22', 20, 0),
('CTD173', 'DH58', 'SP23', 12, 0),
('CTD174', 'DH58', 'SP24', 15, 0);

SELECT *FROM DonHang
SELECT *FROM ChiTietDonHang;

--Việc cần làm
--Thủ tục thêm Nhà cung cấp
CREATE PROCEDURE ThemNhaCungCap 
					@MaNCC char(20),
					@TenNCC nchar(100), 
					@DienThoai char(15), 
					@Email char(50)
AS
BEGIN
	IF EXISTS (SELECT MaNCC FROM NhaCungCap WHERE @MaNCC = MaNCC)
		PRINT N'Đã tồn tại mã nhà cung cấp'
	ELSE
		INSERT INTO NhaCungCap 
		VALUES (@MaNCC, @TenNCC, @DienThoai, @Email)
		PRINT N'Thêm nhà cung cấp thành công'
END
GO

EXEC ThemNhaCungCap 'NCC6', N'Công ty cổ phần dược phẩm Traphaco', '0294729999', 'traphaco@gmail.com'
SELECT * FROM NhaCungCap

--Thủ tục xóa nhà cung cấp
CREATE PROCEDURE XoaNhaCungCap 
				@MaNCC char(20)
AS
BEGIN
	IF NOT EXISTS (SELECT MaNCC FROM NhaCungCap WHERE MaNCC = @MaNCC)
		PRINT N'Không tồn tại mã nhà cung cấp'
	IF EXISTS (SELECT MaNCC FROM SanPham WHERE MaNCC = @MaNCC)
		PRINT N'Đã tồn tại trong bảng sản phẩm'
	ELSE
		DELETE FROM NhaCungCap WHERE MaNCC = @MaNCC
		PRINT N'Xóa nhà cung cấp thành công!'
END

EXEC XoaNhaCungCap 'NCC10'
EXEC XoaNhaCungCap 'NCC6'
SELECT * FROM NhaCungCap

--Thủ tục sửa Nhà cung cấp
EXEC sp_help NhaCungCap;
CREATE PROCEDURE SuaNhaCungCap 
				@MaNCC CHAR(20),
				@TenNCC NCHAR(200),
				@DienThoai CHAR(15),
				@Email CHAR(50)
AS
BEGIN
	IF NOT EXISTS (SELECT MaNCC FROM NhaCungCap WHERE MaNCC = @MaNCC)
		PRINT N'Không tồn tại nhà cung cấp'
	ELSE 
		UPDATE NhaCungCap 
		SET TenNCC = @TenNCC, DienThoai = @DienThoai, Email = @Email 
		WHERE MaNCC = @MaNCC
END
GO

--Thủ tục thêm loại sản phẩm
CREATE PROCEDURE ThemLoaiSanPham 
				@MaLoaiSP CHAR(20), 
				@TenLoaiSP NCHAR(100)
AS
BEGIN
	IF EXISTS (SELECT MaLoaiSP FROM LoaiSanPham WHERE @MaLoaiSP = MaLoaiSP)
		PRINT N'Loại sản phẩm đã tồn tại.'
	ELSE
		INSERT INTO LoaiSanPham(MaLoaiSP, TenLoaiSP) 
		VALUES (@MaLoaiSP, @TenLoaiSP)
		PRINT N'Thêm loại sản phẩm thành công!'
END
GO

EXEC ThemLoaiSanPham 'TEST1', N'Khử trùng cao cấp'
SELECT * FROM LoaiSanPham

--Thủ tục xóa loại sản phẩm
CREATE PROCEDURE XoaLoaiSanPham 
					@MaLoaiSP CHAR(20)
AS
BEGIN
	IF NOT EXISTS (SELECT MaLoaiSP FROM LoaiSanPham WHERE MaLoaiSP = @MaLoaiSP)
		PRINT N'Không tồn tại loại sản phẩm có mã ' + @MaLoaiSP
	IF EXISTS (SELECT MaLoaiSP FROM SanPham WHERE MaLoaiSP = @MaLoaiSP)
		PRINT N'Đã tồn tại trong bảng sản phẩm'
	ELSE
			DELETE FROM LoaiSanPham WHERE MaLoaiSP = @MaLoaiSP
			PRINT N'Xóa loại sản phẩm thành công!'
END
GO

EXEC XoaLoaiSanPham 'TEST1'
SELECT * FROM LoaiSanPham

--Thủ tục sửa loại sản phẩm
CREATE PROCEDURE SuaLoaiSanPham 
					@MaLoaiSP CHAR(20),
					@TenLoaiSP NCHAR(100)
AS
BEGIN
	IF NOT EXISTS (SELECT MaLoaiSP FROM LoaiSanPham WHERE MaLoaiSP = @MaLoaiSP)
		PRINT N'Không tồn tại loại sản phẩm'
	ELSE 
		UPDATE LoaiSanPham 
		SET TenLoaiSP = @TenLoaiSP
		WHERE MaLoaiSP = @MaLoaiSP
END
GO

--Thủ tục thêm sản phẩm
CREATE PROCEDURE ThemSanPham 
				@MaSanPham CHAR(20),
				@TenSanPham NCHAR(100), 
				@MaNCC CHAR(20), 
				@MaLoaiSP CHAR(20),
				@GiaSanPham DECIMAL(18, 2), 
				@TonKho INT
AS
BEGIN
	IF EXISTS (SELECT MaSanPham FROM SanPham WHERE MaSanPham = @MaSanPham)
		PRINT N'Đã tồn tại mã sản phẩm'
	IF NOT EXISTS (SELECT MaNCC FROM NhaCungCap WHERE MaNCC = @MaNCC)
		PRINT N'Không tồn tại nhà cung cấp'
	IF NOT EXISTS (SELECT MaLoaiSP FROM LoaiSanPham WHERE MaLoaiSP = @MaLoaiSP)
		PRINT N'Không tồn tại loại sản phẩm'
	ELSE
		BEGIN
			INSERT INTO SanPham 
			VALUES (@MaSanPham, 
					@TenSanPham, 
					@MaNCC, 
					@MaLoaiSP,
					@GiaSanPham, 
					@TonKho)
			PRINT N'Thêm sản phẩm thành công'
		END
END
GO

EXEC ThemSanPham 'SP26', N'Bổ phế Nam Hà', 'NCC5', 'TH', 28000, 1300;
SELECT * FROM SanPham

--Thủ tục xóa sản phẩm
CREATE PROCEDURE XoaSanPham 
					@MaSanPham CHAR(20)
AS
BEGIN
	IF NOT EXISTS (SELECT MaSanPham FROM SanPham WHERE MaSanPham = @MaSanPham)
		PRINT N'Không tồn tại mã sản phẩm'
	IF EXISTS (SELECT MaSanPham FROM ChiTietDonHang WHERE MaSanPham = @MaSanPham)
		PRINT N'Đã tồn tại trong bảng chi tiết đơn hàng'
	ELSE
		DELETE FROM SanPham WHERE MaSanPham = @MaSanPham
		PRINT N'Xóa sản phẩm thành công!'
END
GO
EXEC XoaSanPham 'SP26'
SELECT * FROM SanPham

--Thủ tục sửa sản phẩm
CREATE PROCEDURE SuaSanPham 
				@MaSanPham CHAR(20),
				@TenSanPham NCHAR(100), 
				@MaNCC CHAR(20), 
				@MaLoaiSP CHAR(20),
				@GiaSanPham DECIMAL(18, 2), 
				@TonKho INT
AS 
BEGIN
	IF NOT EXISTS (SELECT MaSanPham FROM SanPham WHERE MaSanPham = @MaSanPham)
		PRINT N'Không tồn tại mã sản phẩm'
	IF NOT EXISTS (SELECT MaNCC FROM NhaCungCap WHERE MaNCC = @MaNCC)
		PRINT N'Không tồn tại mã nhà cung cấp'
	IF NOT EXISTS (SELECT MaLoaiSP FROM LoaiSanPham WHERE MaLoaiSP = @MaLoaiSP)
		PRINT N'Không tồn tại mã loại sản phẩm'
	ELSE
		UPDATE SanPham 
		SET TenSanPham = @TenSanPham, MaNCC = @MaNCC, MaLoaiSP = @MaLoaiSP, GiaSanPham = @GiaSanPham, TonKho = @TonKho
		WHERE MaSanPham = @MaSanPham
END
GO

--Thủ tục thêm khách hàng
CREATE PROCEDURE ThemKhachHang 
					@MaKhachHang CHAR(20), 
					@TenKhachHang NCHAR(100),
					@DiaChi NCHAR(100), 
					@Sdt CHAR(15), @Email CHAR(50)
AS
BEGIN
	IF EXISTS (SELECT MaKhachHang FROM KhachHang WHERE @MaKhachHang = MaKhachHang)
		PRINT N'Đã tồn tại khách hàng'
	ELSE
		INSERT INTO KhachHang 
		VALUES (
			@MaKhachHang, 
			@TenKhachHang,
			@DiaChi, 
			@Sdt, 
			@Email)
		PRINT N'Thêm khách hàng thành công'
END
GO

--Thủ tục xóa khách hàng
CREATE PROCEDURE XoaKhachHang 
					@MaKhachHang CHAR(20)
AS
BEGIN
	IF NOT EXISTS (SELECT MaKhachHang FROM KhachHang WHERE MaKhachHang = @MaKhachHang)
		PRINT N'Không tồn tại mã khách hàng'
	IF EXISTS (SELECT MaKhachHang FROM DonHang WHERE MaKhachHang = @MaKhachHang)
		PRINT N'Đã tồn tại trong bảng đơn hàng'
	ELSE
		DELETE FROM KhachHang WHERE MaKhachHang = @MaKhachHang
		PRINT N'Xóa khách hàng thành công!'
END
GO

--Thủ tục sửa khách hàng
CREATE PROCEDURE SuaKhachHang
				@MaKhachHang CHAR(20),
				@TenKhachHang NVARCHAR(200),
				@DiaChi NCHAR(200),
				@Sdt CHAR(25),
				@Email CHAR(50)
AS
BEGIN
	IF NOT EXISTS(SELECT MaKhachHang FROM KhachHang WHERE MaKhachHang = @MaKhachHang)
	PRINT N'KHÔNG TỒN TẠI'
	ELSE
		UPDATE KhachHang
		SET 
			TenKhachHang = @TenKhachHang,
			DiaChi = @DiaChi,
			Sdt = @SdT,
			Email = @Email
		WHERE 
			MaKhachHang = @MaKhachHang;
END;

--Thủ tục thêm đơn hàng
CREATE PROCEDURE ThemDonHang 
					@MaDonHang CHAR(20), 
					@MaKhachHang CHAR(20),
					@NgayLap DATE, 
					@TongSo INT, 
					@TongTien DECIMAL(18, 2)
AS
BEGIN
	IF EXISTS (SELECT MaDonHang FROM DonHang WHERE MaDonHang = @MaDonHang)
		PRINT N'Đã tồn tại mã đơn hàng'
	IF NOT EXISTS (SELECT MaKhachHang FROM KhachHang WHERE MaKhachHang = @MaKhachHang)
		PRINT N'Không tồn tại khách hàng'
	ELSE
			INSERT INTO DonHang 
			VALUES 
			(@MaDonHang, 
			@MaKhachHang,
			@NgayLap, 
			@TongSo, 
			@TongTien)
			PRINT N'Thêm đơn hàng thành công'
END
GO
--Thủ tục xóa đơn hàng
CREATE PROCEDURE XoaDonHang 
					@MaDonHang CHAR(20) --đơn hàng tồn tại trong chi tiết đơn hàng
AS
BEGIN
	IF NOT EXISTS (SELECT MaDonHang FROM DonHang WHERE MaDonHang = @MaDonHang)
		PRINT N'Không tồn tại đơn hàng'
	IF EXISTS (SELECT MaDonHang FROM ChiTietDonHang WHERE MaDonHang = @MaDonHang)
		PRINT N'Tồn tại mã đơn hàng trong chi tiết đơn hàng'
	ELSE
		DELETE FROM DonHang WHERE MaDonHang = @MaDonHang
		PRINT N'Xóa đơn hàng thành công!'
END
GO
--Thủ tục thêm chi tiết đơn hàng
EXEC sp_help ChiTietDonHang;
CREATE PROCEDURE ThemChiTietDonHang 
					@MaCT_DH CHAR(20),
					@MaDonHang CHAR(20),
					@MaSanPham CHAR(20),
					@SoLuong INT,
					@Gia DECIMAL(18, 2)
AS
BEGIN
	DECLARE @SoLuongTonKho INT
	SELECT @SoLuongTonKho = TonKho
	FROM SanPham
	WHERE MaSanPham = @MaSanPham

	IF @SoLuongTonKho < @SoLuong
		PRINT N'Không đủ số lượng'
	IF EXISTS (SELECT MaCT_DH FROM ChiTietDonHang WHERE MaCT_DH = @MaCT_DH)
		PRINT N'Đã tồn tại chi tiết đơn hàng'
	IF NOT EXISTS (SELECT MaDonHang FROM DonHang WHERE MaDonHang = @MaDonHang)
		PRINT N'Không tồn tại mã đơn hàng'
	IF NOT EXISTS (SELECT MaSanPham FROM SanPham WHERE MaSanPham = @MaSanPham)
		PRINT N'Không tồn tại mã sản phẩm'
	ELSE 
		INSERT INTO ChiTietDonHang
		VALUES (@MaCT_DH, @MaDonHang, @MaSanPham, @SoLuong, @Gia)
		
		UPDATE SanPham
		SET TonKho = TonKho - @SoLuong
		WHERE MaSanPham = @MaSanPham
END
GO
--Thủ tục xóa chi tiết đơn hàng
CREATE PROCEDURE XoaChiTietDonHang
					@MaCT_DH CHAR(20),
					@SoLuong INT
AS
BEGIN
	IF NOT EXISTS (SELECT MaCT_DH FROM ChiTietDonHang WHERE MaCT_DH = @MaCT_DH)
		PRINT N'Không tồn tại chi tiết đơn hàng'
	ELSE 
		DELETE FROM ChiTietDonHang WHERE MaCT_DH = @MaCT_DH
		UPDATE SanPham
		SET TonKho = TonKho + @SoLuong
		PRINT N'Xóa thành công'
END
GO
--Thủ tục sửa đơn hàng chi tiết
CREATE PROCEDURE SuaChiTietDonHang 
					@MaCT_DH CHAR(20),
					@MaDonHang CHAR(20),
					@MaSanPham CHAR(20),
					@SoLuong INT,
					@Gia DECIMAL(18, 2)
AS
BEGIN
	DECLARE @SoLuongTonKho INT
	DECLARE @SoLuongCu INT

	SELECT @SoLuongTonKho = TonKho
	FROM SanPham
	WHERE MaSanPham = @MaSanPham

	SELECT @SoLuongCu = SoLuong
	FROM ChiTietDonHang
	WHERE MaCT_DH = @MaCT_DH

	IF @SoLuongTonKho < @SoLuong
		PRINT N'Không đủ số lượng'
	IF NOT EXISTS (SELECT MaCT_DH FROM ChiTietDonHang WHERE MaCT_DH = @MaCT_DH)
		PRINT N'Không tồn tại chi tiết đơn hàng'
	IF NOT EXISTS (SELECT MaDonHang FROM DonHang WHERE MaDonHang = @MaDonHang)
		PRINT N'Không tồn tại mã đơn hàng'
	IF NOT EXISTS (SELECT MaSanPham FROM SanPham WHERE MaSanPham = @MaSanPham)
		PRINT N'Không tồn tại mã sản phẩm'
	ELSE 
		INSERT INTO ChiTietDonHang
		VALUES (@MaCT_DH, @MaDonHang, @MaSanPham, @SoLuong, @Gia)
		
		UPDATE SanPham
		SET TonKho = TonKho + @SoLuongCu - @SoLuong
		WHERE MaSanPham = @MaSanPham
END
GO
--Tính giá cho chi tiết đơn hàng
UPDATE ChiTietDonHang 
SET Gia = SoLuong*SanPham.GiaSanPham
FROM ChiTietDonHang
INNER JOIN SanPham ON ChiTietDonHang.MaSanPham = SanPham.MaSanPham

SELECT *FROM ChiTietDonHang;
--Tính tổng số tiền, tổng số cho đơn hàng
UPDATE DonHang
SET TongTien = (
	SELECT SUM(ChiTietDonHang.Gia) 
	FROM ChiTietDonHang
	WHERE ChiTietDonHang.MaDonHang = DonHang.MaDonHang )

UPDATE DonHang
	SET TongSo = (
	SELECT SUM(ChiTietDonHang.SoLuong)
	FROM ChiTietDonHang
	WHERE ChiTietDonHang.MaDonHang = DonHang.MaDonHang)

SELECT *FROM ChiTietDonHang;
SELECT *FROM DonHang;

--Trigger tính giá, tổng tiền, tổng số
CREATE TRIGGER UpdateInsertTonKho 
	ON ChiTietDonHang
	AFTER INSERT, UPDATE
AS
BEGIN
	UPDATE SanPham
	SET TonKho = TonKho - (SELECT SoLuong FROM inserted)
	FROM SanPham, ChiTietDonHang
	WHERE ChiTietDonHang.MaSanPham = SanPham.MaSanPham AND ChiTietDonHang.MaSanPham = (SELECT MaSanPham FROM inserted)

	UPDATE ChiTietDonHang 
	SET Gia = SoLuong * SanPham.GiaSanPham
	FROM ChiTietDonHang, SanPham
	WHERE ChiTietDonHang.MaSanPham = SanPham.MaSanPham 
	AND (ChiTietDonHang.MaSanPham = (SELECT MaSanPham FROM inserted))

	UPDATE DonHang
	SET TongSo = TongSo + ChiTietDonHang.SoLuong, TongTien = TongTien + ChiTietDonHang.Gia
	FROM DonHang, ChiTietDonHang
	WHERE ChiTietDonHang.MaDonHang = DonHang.MaDonHang
	AND (ChiTietDonHang.MaDonHang = (SELECT MaDonHang FROM inserted))
END;

CREATE TRIGGER UpdateDeleteTonKho
	ON ChiTietDonHang
	AFTER DELETE, UPDATE
AS
BEGIN
	UPDATE SanPham
	SET TonKho = TonKho + (SELECT SoLuong FROM deleted)
	FROM SanPham, ChiTietDonHang
	WHERE ChiTietDonHang.MaSanPham = SanPham.MaSanPham AND ChiTietDonHang.MaSanPham = (SELECT MaSanPham FROM deleted)

	UPDATE DonHang
	SET TongSo = TongSo - ChiTietDonHang.SoLuong, TongTien = TongTien - ChiTietDonHang.Gia
	FROM DonHang, ChiTietDonHang
	WHERE ChiTietDonHang.MaDonHang = DonHang.MaDonHang
	AND (ChiTietDonHang.MaDonHang = (SELECT MaDonHang FROM deleted))
END;

--Tạo view đưa ra danh sách hóa đơn của mỗi khách hàng
CREATE VIEW DanhSachHoaDonKhachHang AS 
SELECT 
		KhachHang.MaKhachHang, 
		TenKhachHang,
		DiaChi, 
		Sdt, 
		Email, 
		MAX(DonHang.NgayLap) AS NgayLap, 
		SUM(DonHang.TongSo) AS TongSoHangHoa, 
		SUM(DonHang.TongTien) AS TongTien
FROM KhachHang
INNER JOIN DonHang ON KhachHang.MaKhachHang = DonHang.MaKhachHang
GROUP BY KhachHang.MaKhachHang, TenKhachHang, DiaChi, Sdt, Email

SELECT *FROM DanhSachHoaDonKhachHang;
--.Tạo view đưa ra sản phẩm được mua nhiều nhất
CREATE VIEW SanPhamDuocMuaNhieuNhat AS
SELECT TOP (5) WITH TIES SanPham.*, SUM(ChiTietDonHang.SoLuong) AS TongSo
FROM SanPham
INNER JOIN ChiTietDonHang ON SanPham.MaSanPham = ChiTietDonHang.MaSanPham
GROUP BY SanPham.MaSanPham, TenSanPham, MaNCC, MaLoaiSP, GiaSanPham, TonKho
ORDER BY SUM(ChiTietDonHang.SoLuong) DESC

SELECT *FROM SanPhamDuocMuaNhieuNhat
SELECT *FROM DonHang
--Tạo view đưa ra nhà cung cấp bán nhiều nhất
CREATE VIEW NhaCungCapNhieuNhat
AS
SELECT TOP 1 
    NhaCungCap.TenNCC AS TenNhaCungCap,
    SUM(ChiTietDonHang.SoLuong) AS TongSoLuong
FROM 
    ChiTietDonHang,SanPham, NhaCungCap

WHERE ChiTietDonHang.MaSanPham = SanPham.MaSanPham AND
	  SanPham.MaNCC = NhaCungCap.MaNCC
GROUP BY 
    NhaCungCap.TenNCC
ORDER BY 
    TongSoLuong DESC;

SELECT *FROM NhaCungCapNhieuNhat;
--Tạo view đưa ra số lượng tồn kho của mỗi sản phẩm
--Tạo function tính tổng tiền cho 1 đơn hàng
CREATE FUNCTION dbo.TongTienMotDonHang (@MaDonHang CHAR(20))
RETURNS DECIMAL(18, 2)
AS
BEGIN
	DECLARE @TongTien DECIMAL(18, 2);

	SELECT @TongTien = SUM(Gia)
	FROM ChiTietDonHang
	WHERE MaDonHang = @MaDonHang

	RETURN ISNULL(@TongTien, 0);
END

SELECT dbo.TongTienMotDonHang('DH1') AS TongTienDonHang1
SELECT *FROM DonHang
SELECT *FROM ChiTietDonHang

--Function tính tổng số cho một đơn hàng 
CREATE FUNCTION dbo.TongSoLuongMotDonHang (@MaDonHang CHAR(20))
RETURNS INT
AS
BEGIN
	DECLARE @TongSo INT;

	SELECT @TongSo = SUM(SoLuong)
	FROM ChiTietDonHang
	WHERE MaDonHang = @MaDonHang

	RETURN ISNULL(@TongSo, 0)
END

SELECT dbo.TongSoLuongMotDonHang('DH1') AS TongSoLuongDonHang1;
SELECT *FROM DonHang;
--Tính doanh thu theo sản phẩm
--Thủ tục thống kê