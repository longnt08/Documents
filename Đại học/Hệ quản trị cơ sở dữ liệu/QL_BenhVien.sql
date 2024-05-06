CREATE DATABASE QL_BenhVien
USE QL_BenhVien

--Tạo bảng bệnh nhân
CREATE TABLE BenhNhan (
MaBN CHAR(20) PRIMARY KEY,
TenBN NCHAR(100),
GioiTinh NCHAR(20),
NgaySinh DATE,
DiaChi NCHAR(200), 
SDT CHAR(20) )

--Tạo bảng bác sĩ
CREATE TABLE BacSi (
MaBS CHAR(20) PRIMARY KEY,
TenBS NCHAR(100),
ChuyenKhoa NCHAR(100),
SDT CHAR(20),
Email CHAR(100) )

--Tạo bảng lịch làm việc của bác sĩ
CREATE TABLE LichLamViec (
MaBS CHAR(20) REFERENCES BacSi(MaBS),
NgayTrongTuan INT,
BatDau TIME,
KetThuc TIME)

--Tạo bảng lịch hẹn
CREATE TABLE LichHen (
MaLH CHAR(20) PRIMARY KEY,
MaBN CHAR(20) REFERENCES BenhNhan(MaBN),
MaBS CHAR(20) REFERENCES BacSi(MaBS),
ThoiGian DATETIME,
TinhTrang NCHAR(20) )

--Tạo bảng bệnh án
CREATE TABLE BenhAn (
MaBA CHAR(20) PRIMARY KEY,
MaBN CHAR(20) REFERENCES BenhNhan(MaBN),
MaBS CHAR(20) REFERENCES BacSi(MaBS),
NgayKham DATE,
TrieuChung NCHAR(500),
ChanDoan NCHAR(500) )

--Tạo bảng đơn thuốc 
CREATE TABLE DonThuoc (
MaDT CHAR(20) PRIMARY KEY,
MaBA CHAR(20) REFERENCES BenhAn(MaBA),
TongSo INT,
TongTien DECIMAL(18, 2) )

--Tạo bảng chi tiết đơn thuốc
CREATE TABLE CT_DonThuoc (
MaCTDT CHAR(20) PRIMARY KEY,
MaDT CHAR(20) REFERENCES DonThuoc(MaDT),
MaThuoc CHAR(20) REFERENCES Thuoc(MaThuoc),
SoLuong INT,
DonViTinh NCHAR(10),
ThanhTien DECIMAL(18, 2),
NgayLap DATE,
LieuLuong INT,
TacDungPhu NCHAR(200) )

--Tạo bảng thuốc
CREATE TABLE Thuoc (
MaThuoc CHAR(20) PRIMARY KEY,
TenThuoc NCHAR(100),
GiaTien DECIMAL(18, 2),
DonViTinh NCHAR(10),
TacDungPhu NCHAR(200),
HSD DATE,
TonKho INT )

--Thêm dữ liệu vào bảng bệnh nhân
--Thêm dữ liệu vào bảng bác sĩ
--Thêm dữ liệu vào bảng lịch làm việc của bác sĩ
--Thêm dữ liệu vào bảng lịch hẹn (phải phù hợp với lịch làm việc của bác sĩ)
--Thêm dữ liệu vào bảng bệnh án (Ngày khám = null)
--Thêm dữ liệu vào bảng thuốc
--Thêm dữ liệu vào bảng đơn thuốc (tổng số = 0, tổng tiền = 0)
--Thêm dữ liệu vào bảng chi tiết đơn thuốc (ngày lập phải thỏa mãn hạn sử dụng, tác dụng phụ = null, số lượng phải thỏa mãn tồn kho, đvt = null)
--Thủ tục thêm bệnh nhân
--Thủ tục sửa bệnh nhân
--Thủ tục xóa bệnh nhân
--Thủ tục thêm bác sĩ
--Thủ tục sửa bác sĩ
--Thủ tục xóa bác sĩ
--Thủ tục thêm lịch làm việc
--Thủ tục sửa lịch làm việc
--Thủ tục xóa lịch làm việc
--Thủ tục thêm lịch hẹn
--Thủ tục sửa lịch hẹn
--Thủ tục xóa lịch hẹn
--Thủ tục thêm bệnh án
--Thủ tục sửa bệnh án
--Thủ tục xóa bệnh án
--Thủ tục thêm thuốc
--Thủ tục sửa thuốc
--Thủ tục xóa thuốc
--Thủ tục thêm đơn thuốc
--Thủ tục sửa đơn thuốc
--Thủ tục xóa đơn thuốc
--Thủ tục thêm chi tiết đơn thuốc (kiểm tra hsd, tồn kho)
--Thủ tục sửa chi tiết đơn thuốc (kiểm tra hsd, tồn kho)
--Thủ tục xóa chi tiết đơn thuốc (kiểm tra hsd, tồn kho)
--Update ngày khám trong bảng bệnh án
--Update đơn vị tính, tác dụng phụ trong bảng chi tiết đơn
--Update tổng số, tổng tiền trong bảng đơn hàng
--Viết trigger cho tồn kho(thuốc), số lượng & thành tiền(chi tiết dt), tổng số & tổng tiền (đơn thuốc)
--Tạo view xem tất cả hồ sơ bệnh án của các bệnh nhân
--Tạo view xem bác sĩ nào khám nhiều bệnh nhân nhất
--Tạo view xem bệnh nhân nào khám nhiều bác sĩ nhất
--Tạo view xem bệnh nhân nào tốn tiền mua thuốc nhất
--Tạo view xem loại thuốc nào được bán nhiều nhất
--Viết function tính tổng số đơn thuốc của một khách hàng
--Viết function tính tổng số lịch hẹn của một bác sĩ
--Viết function tính tổng tiền thuốc của một bệnh nhân
--Viết function tính tổng số tiền/số lượng của một loại thuốc được bán ra
--Viết thủ tục thống kê xem đến ngày YY/MM/DD có bao nhiêu loại thuốc hết hạn