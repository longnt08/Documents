CREATE DATABASE STT36_NguyenThanhLong_01
USE STT36_NguyenThanhLong_01

-----------------------Câu 1--------------------------------

--Tạo bảng hàng hóa
CREATE TABLE HangHoa (
MaHang CHAR(20) PRIMARY KEY,
TenHang NCHAR(100),
GiaNhap DECIMAL(18, 2),
DonViTinh NCHAR(20),
NoiSX NCHAR(200),
GiaXuat DECIMAL(18, 2),
GhiChu NCHAR(300) )
 
--Tạo bảng khách hàng
CREATE TABLE KhachHang (
MaKhach CHAR(20) PRIMARY KEY,
TenKhach NCHAR(100),
DiaChi NCHAR(200),
DienThoai CHAR(20),
Email CHAR(40) )

--Tạo bảng nhà cung cấp
CREATE TABLE NhaCungCap (
MaNCC CHAR(20) PRIMARY KEY,
TenNCC NCHAR(100),
DiaChiNCC NCHAR(200),
SoPhone CHAR(20) )

--Tạo bảng phiếu nhập
CREATE TABLE PhieuNhap (
SoPhieu_N CHAR(20) PRIMARY KEY,
MaNCC CHAR(20) REFERENCES NhaCungCap(MaNCC),
MaHang CHAR(20) REFERENCES HangHoa(MaHang),
SL_Nhap INT,
NgayNhap DATE,
TienNhap DECIMAL(18, 2),
GhiChu NCHAR(200) )

--Tạo bảng phiếu xuất
CREATE TABLE PhieuXuat (
SoPhieu_X CHAR(20) PRIMARY KEY,
MaHang CHAR(20) REFERENCES HangHoa(MaHang),
MaKhach CHAR(20) REFERENCES KhachHang(MaKhach),
SL_Xuat INT,
NgayXuat DATE, 
TienXuat DECIMAL(18, 2),
GhiChu NCHAR(200) )

--Thêm dữ liệu bảng hàng hóa
INSERT INTO HangHoa (MaHang, TenHang, GiaNhap, DonViTinh, NoiSX, GiaXuat, GhiChu)
VALUES 
('HH001', N'Bút bi', 2000.00, N'Cây', N'Việt Nam', 3000.00, N'Bút bi màu xanh'),
('HH002', N'Tập vở', 15000.00, N'Cuốn', N'Việt Nam', 20000.00, N'Tập 200 trang'),
('HH003', N'Tẩy bút chì', 3000.00, N'Cục', N'Trung Quốc', 5000.00, N'Tẩy màu trắng'),
('HH004', N'Túi xách', 250000.00, N'Cái', N'Việt Nam', 300000.00, N'Túi da màu đen'),
('HH005', N'Sổ tay', 50000.00, N'Quyển', N'Nhật Bản', 80000.00, N'Sổ tay 100 trang'),
('HH006', N'Giấy A4', 100000.00, N'Ream', N'Indonesia', 150000.00, N'Giấy trắng A4'),
('HH007', N'Kéo cắt giấy', 12000.00, N'Cái', N'Trung Quốc', 20000.00, N'Kéo thép không gỉ'),
('HH008', N'Tập giấy note', 8000.00, N'Cuộn', N'Hàn Quốc', 12000.00, N'Tập giấy nhớ màu vàng'),
('HH009', N'Bàn phím máy tính', 300000.00, N'Cái', N'Trung Quốc', 400000.00, N'Bàn phím không dây'),
('HH010', N'Chuột máy tính', 200000.00, N'Cái', N'Trung Quốc', 250000.00, N'Chuột không dây'),
('HH011', N'Máy in', 3000000.00, N'Cái', N'Nhật Bản', 3500000.00, N'Máy in màu'),
('HH012', N'Loa vi tính', 500000.00, N'Cái', N'Việt Nam', 600000.00, N'Loa 2.1'),
('HH013', N'Màn hình LCD', 2500000.00, N'Cái', N'Hàn Quốc', 3000000.00, N'Màn hình 24 inch'),
('HH014', N'USB 16GB', 200000.00, N'Cái', N'Trung Quốc', 250000.00, N'USB 3.0'),
('HH015', N'Ổ cứng di động', 1000000.00, N'Cái', N'Mỹ', 1200000.00, N'Ổ cứng 1TB'),
('HH016', N'Đèn bàn', 150000.00, N'Cái', N'Việt Nam', 200000.00, N'Đèn LED'),
('HH017', N'Máy tính xách tay', 15000000.00, N'Cái', N'Nhật Bản', 17000000.00, N'Máy tính i5, 8GB RAM'),
('HH018', N'Điện thoại thông minh', 10000000.00, N'Cái', N'Hàn Quốc', 12000000.00, N'Điện thoại Android'),
('HH019', N'Máy chiếu', 7000000.00, N'Cái', N'Nhật Bản', 8000000.00, N'Máy chiếu Full HD'),
('HH020', N'Bảng viết trắng', 500000.00, N'Cái', N'Việt Nam', 600000.00, N'Bảng kích thước 120x90 cm');

SELECT *FROM HangHoa
--Thêm dữ liệu bảng khách hàng
INSERT INTO KhachHang (MaKhach, TenKhach, DiaChi, DienThoai, Email)
VALUES 
('KH001', N'Nguyễn Văn A', N'TP.HCM', '0901123456', 'nguyenvana@example.com'),
('KH002', N'Tran Thi B', N'TP.HCM', '0902234567', 'tranthib@example.com'),
('KH003', N'Le Van C', N'TP.HCM', '0903345678', 'levanc@example.com'),
('KH004', N'Pham Thi D', N'Hà Nội', '0904456789', 'phamthid@example.com'),
('KH005', N'Huynh Van E', N'Quảng Ninh', '0905567890', 'huynhvane@example.com'),
('KH006', N'Nguyen Thi F', N'Tuyên Quang', '0906678901', 'nguyenthif@example.com'),
('KH007', N'Bui Van G', N'Điện Biên', '0907789012', 'buivang@example.com'),
('KH008', N'Do Thi H', N'Lào Cai', '0908890123', 'dothih@example.com'),
('KH009', N'Pham Van I', N'Bình Thuận', '0909901234', 'phamvani@example.com'),
('KH010', N'Le Thi J', N'Bình Dương', '0910012345', 'lethij@example.com'),
('KH011', N'Nguyen Van K', N'Hà Nam', '0911123456', 'nguyenvank@example.com'),
('KH012', N'Tran Thi L', N'Vĩnh Long', '0912234567', 'tranthil@example.com'),
('KH013', N'Hoang Van M', N'Cà Mau', '0913345678', 'hoangvanm@example.com'),
('KH014', N'Dang Thi N', N'Hòa Bình', '0914456789', 'dangthin@example.com'),
('KH015', N'Pham Van O', N'Bắc Giang', '0915567890', 'phamvano@example.com'),
('KH016', N'Vu Thi P', N'Bắc Ninh', '0916678901', 'vuthip@example.com'),
('KH017', N'Nguyen Van Q', N'Bình Phước', '0917789012', 'nguyenvanq@example.com'),
('KH018', N'Tran Thi R', N'Đà Nẵng', '0918890123', 'tranthir@example.com'),
('KH019', N'Le Van S', N'TP.HCM', '0919901234', 'levans@example.com'),
('KH020', N'Pham Thi T', N'TP.HCM', '0920012345', 'phamthit@example.com');

SELECT *FROM KhachHang
--Thêm dữ liệu bảng nhà cung cấp
INSERT INTO NhaCungCap (MaNCC, TenNCC, DiaChiNCC, SoPhone)
VALUES 
('NCC001', N'Công ty TNHH ABC', N'123 Đường Lý Thường Kiệt, Quận Tân Bình, TP.HCM', '0901123456'),
('NCC002', N'Công ty CP XYZ', N'456 Đường Trần Hưng Đạo, Quận 1, TP.HCM', '0902234567'),
('NCC003', N'Công ty TNHH Minh Khang', N'789 Đường Nguyễn Thị Minh Khai, Quận 3, TP.HCM', '0903345678'),
('NCC004', N'Công ty CP Phương Nam', N'101 Đường Phan Đăng Lưu, Quận Phú Nhuận, TP.HCM', '0904456789'),
('NCC005', N'Công ty TNHH An Bình', N'202 Đường Cộng Hòa, Quận Tân Bình, TP.HCM', '0905567890'),
('NCC006', N'Công ty TNHH Đông Á', N'303 Đường Võ Thị Sáu, Quận 3, TP.HCM', '0906678901'),
('NCC007', N'Công ty CP Hưng Thịnh', N'404 Đường Điện Biên Phủ, Quận Bình Thạnh, TP.HCM', '0907789012'),
('NCC008', N'Công ty TNHH Sông Hồng', N'505 Đường Nguyễn Văn Trỗi, Quận Phú Nhuận, TP.HCM', '0908890123'),
('NCC009', N'Công ty CP Việt Nhật', N'606 Đường Pasteur, Quận 3, TP.HCM', '0909901234'),
('NCC010', N'Công ty TNHH Thái Bình', N'707 Đường Hai Bà Trưng, Quận 1, TP.HCM', '0910012345'),
('NCC011', N'Công ty CP Kim Long', N'808 Đường Nam Kỳ Khởi Nghĩa, Quận 3, TP.HCM', '0911123456'),
('NCC012', N'Công ty TNHH Phú Cường', N'909 Đường Lê Văn Sỹ, Quận 3, TP.HCM', '0912234567'),
('NCC013', N'Công ty CP Đại Phát', N'1010 Đường Nguyễn Đình Chiểu, Quận 3, TP.HCM', '0913345678'),
('NCC014', N'Công ty TNHH Hoàng Gia', N'1111 Đường Lê Quý Đôn, Quận 3, TP.HCM', '0914456789'),
('NCC015', N'Công ty CP Bảo Minh', N'1212 Đường Trương Định, Quận 3, TP.HCM', '0915567890'),
('NCC016', N'Công ty TNHH Hải Nam', N'1313 Đường Tôn Đức Thắng, Quận 1, TP.HCM', '0916678901'),
('NCC017', N'Công ty CP Phúc An', N'1414 Đường Nguyễn Văn Cừ, Quận 5, TP.HCM', '0917789012'),
('NCC018', N'Công ty TNHH Thành Đạt', N'1515 Đường Nguyễn Trãi, Quận 5, TP.HCM', '0918890123'),
('NCC019', N'Công ty CP Hồng Hà', N'1616 Đường Nguyễn Huệ, Quận 1, TP.HCM', '0919901234'),
('NCC020', N'Công ty TNHH An Phú', N'1717 Đường Xô Viết Nghệ Tĩnh, Quận Bình Thạnh, TP.HCM', '0920012345');

SELECT *FROM NhaCungCap
--Thêm dữ liệu bảng phiếu nhập
INSERT INTO PhieuNhap (SoPhieu_N, MaNCC, MaHang, SL_Nhap, NgayNhap, TienNhap, GhiChu) VALUES
('PN001', 'NCC001', 'HH001', 100, '2024-01-15', 0, N'Nhập bút bi màu xanh'),
('PN002', 'NCC002', 'HH002', 50, '2024-02-16', 0, N'Nhập tập vở 200 trang'),
('PN003', 'NCC003', 'HH003', 200, '2024-01-17', 0, N'Nhập tẩy bút chì màu trắng'),
('PN004', 'NCC004', 'HH004', 30, '2024-01-18', 0, N'Nhập túi xách da màu đen'),
('PN005', 'NCC005', 'HH005', 80, '2024-12-19', 0, N'Nhập sổ tay 100 trang'),
('PN006', 'NCC006', 'HH006', 40, '2024-06-20', 0, N'Nhập giấy A4'),
('PN007', 'NCC007', 'HH007', 150, '2024-01-21', 0, N'Nhập kéo cắt giấy thép không gỉ'),
('PN008', 'NCC008', 'HH008', 200, '2024-01-22', 0, N'Nhập tập giấy note màu vàng'),
('PN009', 'NCC009', 'HH009', 20, '2024-01-23', 0, N'Nhập bàn phím máy tính không dây'),
('PN010', 'NCC010', 'HH010', 25, '2024-03-24', 0, N'Nhập chuột máy tính không dây'),
('PN011', 'NCC011', 'HH011', 10, '2024-01-25', 0, N'Nhập máy in màu'),
('PN012', 'NCC012', 'HH012', 15, '2024-03-26', 0, N'Nhập loa vi tính 2.1'),
('PN013', 'NCC013', 'HH013', 12, '2024-08-27', 0, N'Nhập màn hình LCD 24 inch'),
('PN014', 'NCC014', 'HH014', 25, '2024-05-28', 0, N'Nhập USB 16GB 3.0'),
('PN015', 'NCC015', 'HH015', 10, '2024-11-29', 0, N'Nhập ổ cứng di động 1TB'),
('PN016', 'NCC016', 'HH016', 50, '2024-01-30', 0, N'Nhập đèn bàn LED'),
('PN017', 'NCC017', 'HH017', 5, '2024-08-01', 0, N'Nhập máy tính xách tay i5, 8GB RAM'),
('PN018', 'NCC018', 'HH018', 10, '2024-02-02', 0, N'Nhập điện thoại thông minh Android'),
('PN019', 'NCC019', 'HH019', 7, '2024-02-03', 0, N'Nhập máy chiếu Full HD'),
('PN020', 'NCC020', 'HH020', 20, '2024-08-04', 0, N'Nhập bảng viết trắng 120x90 cm');

UPDATE PhieuNhap
SET TienNhap = SL_Nhap * (HangHoa.GiaNhap)
FROM PhieuNhap
INNER JOIN 
	HangHoa ON PhieuNhap.MaHang = HangHoa.MaHang
SELECT *FROM PhieuNhap
--Thêm dữ liệu bảng phiếu xuất
INSERT INTO PhieuXuat (SoPhieu_X, MaHang, MaKhach, SL_Xuat, NgayXuat, TienXuat, GhiChu)
VALUES 
('PX001', 'HH001', 'KH001', 50, '2024-03-01', 0, N'Xuất bút bi cho Nguyễn Văn A'),
('PX002', 'HH002', 'KH002', 20, '2024-03-02', 0, N'Xuất tập vở cho Trần Thị B'),
('PX003', 'HH003', 'KH003', 100, '2024-03-03', 0, N'Xuất tẩy bút chì cho Lê Văn C'),
('PX004', 'HH004', 'KH004', 10, '2024-03-04', 0, N'Xuất túi xách cho Phạm Thị D'),
('PX005', 'HH005', 'KH005', 30, '2024-03-05', 0, N'Xuất sổ tay cho Huỳnh Văn E'),
('PX006', 'HH006', 'KH006', 15, '2024-03-06', 0, N'Xuất giấy A4 cho Nguyễn Thị F'),
('PX007', 'HH007', 'KH007', 50, '2024-03-07', 0, N'Xuất kéo cắt giấy cho Bùi Văn G'),
('PX008', 'HH008', 'KH008', 100, '2024-03-08', 0, N'Xuất tập giấy note cho Đỗ Thị H'),
('PX009', 'HH009', 'KH009', 5, '2024-03-09', 0, N'Xuất bàn phím máy tính cho Phạm Văn I'),
('PX010', 'HH010', 'KH010', 8, '2024-03-10', 0, N'Xuất chuột máy tính cho Lê Thị J'),
('PX011', 'HH011', 'KH011', 2, '2024-03-11', 0, N'Xuất máy in màu cho Nguyễn Văn K'),
('PX012', 'HH012', 'KH012', 5, '2024-03-12', 0, N'Xuất loa vi tính cho Trần Thị L'),
('PX013', 'HH013', 'KH013', 4, '2024-03-13', 0, N'Xuất màn hình LCD cho Hoàng Văn M'),
('PX014', 'HH014', 'KH014', 10, '2024-03-14', 0, N'Xuất USB 16GB cho Đặng Thị N'),
('PX015', 'HH015', 'KH015', 3, '2024-03-15', 0, N'Xuất ổ cứng di động cho Phạm Văn O'),
('PX016', 'HH016', 'KH016', 20, '2024-03-16', 0, N'Xuất đèn bàn LED cho Vũ Thị P'),
('PX017', 'HH017', 'KH017', 2, '2024-03-17', 0, N'Xuất máy tính xách tay cho Nguyễn Văn Q'),
('PX018', 'HH018', 'KH018', 3, '2024-03-18', 0, N'Xuất điện thoại thông minh cho Trần Thị R'),
('PX019', 'HH019', 'KH019', 2, '2024-03-19', 0, N'Xuất máy chiếu cho Lê Văn S'),
('PX020', 'HH020', 'KH020', 5, '2024-03-20', 0, N'Xuất bảng viết trắng cho Phạm Thị T');

UPDATE PhieuXuat 
SET TienXuat = SL_Xuat * (HangHoa.GiaXuat)
FROM PhieuXuat
INNER JOIN 
	HangHoa ON PhieuXuat.MaHang = HangHoa.MaHang

SELECT *FROM PhieuXuat

-------------------------------------------Câu 2------------------------------------

--Tạo view đưa ra số lượng từng mặt hàng nhập theo tháng 8
CREATE VIEW SoLuongTungMatHangTrongThang8 AS
SELECT 
    HangHoa.MaHang,
    HangHoa.TenHang,
    HangHoa.GiaNhap,
    HangHoa.NoiSX,
    SUM(PhieuNhap.SL_Nhap) AS TongSoLuongNhap
FROM 
    HangHoa
INNER JOIN 
    PhieuNhap ON HangHoa.MaHang = PhieuNhap.MaHang
WHERE 
    MONTH(PhieuNhap.NgayNhap) = 8
GROUP BY 
    HangHoa.MaHang, HangHoa.TenHang, HangHoa.GiaNhap, HangHoa.NoiSX;

SELECT *FROM PhieuNhap
SELECT *FROM SoLuongTungMatHangTrongThang8

--Tạo view tính toán số tiền nhập vào ngày 3/4/2024
CREATE VIEW SoTienNhapVaoNgay3_4_2024 AS
SELECT 
	SUM(PhieuNhap.TienNhap) AS TongSoTienNhapNgay3_4_2024
FROM 
	PhieuNhap
WHERE PhieuNhap.NgayNhap = '2024-4-3'

SELECT *FROM SoTienNhapVaoNgay3_4_2024

---------------------------------------------------Câu 3----------------------------

--Thủ tục thêm phiếu nhập
EXEC sp_help PhieuNhap
CREATE PROC ThemPhieuNhap 
				@SoPhieu_N CHAR(20),
				@MaNCC CHAR(20),
				@MaHang CHAR(20),
				@SL_Nhap INT,
				@NgayNhap DATE,
				@TienNhap DECIMAL(18, 2),
				@GhiChu NCHAR(400)
AS
BEGIN
	IF EXISTS (SELECT SoPhieu_N FROM PhieuNhap WHERE SoPhieu_N = @SoPhieu_N)
		PRINT N'Đã tồn tại số phiếu nhập'
	IF NOT EXISTS (SELECT MaNCC FROM NhaCungCap WHERE MaNCC = @MaNCC)
		PRINT N'Không tồn tại mã nhà cung cấp'
	IF NOT EXISTS (SELECT MaHang FROM HangHoa WHERE MaHang = @MaHang)
		PRINT N'Không tồn tại mã hàng'
	ELSE
		BEGIN
			INSERT INTO PhieuNhap VALUES( 				
				@SoPhieu_N,
				@MaNCC,
				@MaHang,
				@SL_Nhap,
				@NgayNhap,
				@TienNhap,
				@GhiChu )
			PRINT N'Thêm phiếu nhập thành công'
		END
END
GO

--Thủ tục xóa khách hàng
EXEC sp_help KhachHang
CREATE PROC XoaKhachHang @MaKhach CHAR(20)
AS
BEGIN
	IF NOT EXISTS (SELECT MaKhach FROM KhachHang WHERE MaKhach = @MaKhach)
		PRINT N'Không tồn tại mã khách hàng'
	IF EXISTS (SELECT MaKhach FROM PhieuXuat WHERE MaKhach = @MaKhach)
		PRINT N'Đã tồn tại mã khách hàng trong phiếu xuất'
	ELSE
		BEGIN
			DELETE FROM KhachHang WHERE MaKhach = @MaKhach
			PRINT N'Xóa khách hàng thành công'
		END
END
GO

--------------------------------------------Câu 4-----------------------------
CREATE TRIGGER trgAfterThemPhieuNhap
ON PhieuNhap
AFTER INSERT
AS
BEGIN
	UPDATE PhieuNhap
	SET TienNhap = (SELECT SL_Nhap FROM inserted) * (HangHoa.GiaNhap)
	FROM HangHoa, PhieuNhap
	WHERE HangHoa.MaHang = PhieuNhap.MaHang AND PhieuNhap.MaHang = (SELECT MaHang FROM inserted)
END

CREATE PROC ThongKeSoLuong 
	@Option INT,
	@Year INT
AS
BEGIN
	IF @Option = 1
		BEGIN
			SELECT SUM(SL_Nhap) AS SoLuongNhap
			FROM PhieuNhap
			WHERE YEAR(PhieuNhap.NgayNhap) = @Year
		END
	 ELSE IF @Option = 2
		BEGIN 
			SELECT SUM(SL_Xuat) AS SoLuongXuat
			FROM PhieuXuat
			WHERE YEAR(PhieuXuat.NgayXuat) = @Year
		END

	ELSE
		PRINT N'Lựa chọn ko hợp lệ'
END

EXEC ThongKeSoLuong 2, '2024'