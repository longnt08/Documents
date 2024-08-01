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
EXEC sp_help BenhNhan
INSERT INTO BenhNhan (MaBN, TenBN, GioiTinh, NgaySinh, DiaChi, SDT)
VALUES 
('BN1', N'Nguyễn Văn A', N'Nam', '1989/4/4', N'Hà Nội', '0363567894'),
('BN2', N'Trần Thị B', N'Nữ', '1995/7/12', N'Hồ Chí Minh', '0987654321'),
('BN3', N'Lê Văn C', N'Nam', '1978/9/21', N'Hải Phòng', '0321654987'),
('BN4', N'Phạm Thị D', N'Nữ', '2000/3/15', N'Hà Tĩnh', '0975321684'),
('BN5', N'Huỳnh Văn E', N'Nam', '1992/11/30', N'Đà Nẵng', '0354879654'),
('BN6', N'Đặng Thị F', N'Nữ', '1985/5/9', N'Bình Dương', '0912345678'),
('BN7', N'Trần Văn G', N'Nam', '1998/8/18', N'Hà Nam', '0975312468'),
('BN8', N'Nguyễn Thị H', N'Nữ', '1997/2/25', N'Nam Định', '0369875412'),
('BN9', N'Lê Văn I', N'Nam', '1993/10/8', N'Bắc Giang', '0912876543'),
('BN10', N'Vũ Thị K', N'Nữ', '1987/12/20', N'Thái Bình', '0987654321'),
('BN11', N'Phan Văn L', N'Nam', '1991/6/14', N'Hải Dương', '0358962147'),
('BN12', N'Tran Thị M', N'Nữ', '1996/1/28', N'Quảng Ninh', '0963258741'),
('BN13', N'Hoàng Văn N', N'Nam', '1983/3/3', N'Hưng Yên', '0387456982'),
('BN14', N'Đỗ Thị O', N'Nữ', '1994/9/17', N'Thái Nguyên', '0932145789'),
('BN15', N'Phạm Văn P', N'Nam', '1986/7/22', N'Ninh Bình', '0396521478'),
('BN16', N'Lê Thị Q', N'Nữ', '1999/5/5', N'Hà Nam', '0987451236'),
('BN17', N'Trương Văn R', N'Nam', '1984/8/10', N'Thái Bình', '0341258967'),
('BN18', N'Nguyễn Thị S', N'Nữ', '1990/11/2', N'Bắc Ninh', '0378965421'),
('BN19', N'Lê Văn T', N'Nam', '1998/4/19', N'Nam Định', '0963258741'),
('BN20', N'Hồ Thị U', N'Nữ', '1992/12/12', N'Phú Thọ', '0354789652');
SELECT *FROM BenhNhan

--Thêm dữ liệu vào bảng bác sĩ
EXEC sp_help BacSi
INSERT INTO BacSi (MaBS, TenBS, ChuyenKhoa, SDT, Email)
VALUES 
('BS1', N'Nguyễn Văn Mạnh', N'Răng hàm mặt', '0989777666', 'manh.nguyen@example.com'),
('BS2', N'Trần Thị Hương', N'Nhi khoa', '0978654321', 'huong.tran@example.com'),
('BS3', N'Lê Văn Tuấn', N'Tim mạch', '0965432198', 'tuan.le@example.com'),
('BS4', N'Phạm Thị Loan', N'Ngoại khoa', '0932145678', 'loan.pham@example.com'),
('BS5', N'Huỳnh Văn Đức', N'Nhi khoa', '0912345678', 'duc.huynh@example.com'),
('BS6', N'Đặng Thị Hải Yến', N'Răng hàm mặt', '0987654321', 'haiyen.dang@example.com'),
('BS7', N'Trần Văn An', N'Thần kinh', '0965321874', 'an.tran@example.com'),
('BS8', N'Nguyễn Thị Bích Ngọc', N'Nhi khoa', '0978563214', 'ngoc.nguyen@example.com'),
('BS9', N'Lê Văn Quân', N'Ngoại khoa', '0945321687', 'quan.le@example.com'),
('BS10', N'Vũ Thị Hương', N'Răng hàm mặt', '0912876543', 'huong.vu@example.com');
SELECT *FROM BacSi

--Thêm dữ liệu vào bảng lịch làm việc của bác sĩ
EXEC sp_help LichLamViec
INSERT INTO LichLamViec (MaBS, NgayTrongTuan, BatDau, KetThuc)
VALUES 
('BS1', 2, '07:00:00', '12:30:00'),
('BS1', 3, '17:00:00', '22:30:00'),
('BS2', 1, '09:00:00', '17:00:00'),
('BS2', 4, '09:00:00', '17:00:00'),
('BS3', 5, '07:30:00', '15:30:00'),
('BS3', 6, '16:30:00', '21:30:00'),
('BS4', 3, '08:30:00', '16:30:00'),
('BS4', 7, '07:30:00', '12:30:00'),
('BS5', 1, '10:00:00', '18:00:00'),
('BS5', 4, '14:00:00', '20:00:00'),
('BS6', 5, '15:00:00', '21:00:00'),
('BS6', 7, '18:00:00', '23:00:00'),
('BS7', 2, '07:00:00', '12:00:00'),
('BS7', 4, '11:00:00', '15:00:00'),
('BS8', 1, '09:30:00', '15:30:00'),
('BS8', 3, '07:30:00', '11:30:00'),
('BS9', 4, '07:00:00', '12:30:00'),
('BS9', 6, '13:00:00', '18:00:00'),
('BS10', 2, '10:30:00', '16:30:00'),
('BS10', 3, '10:30:00', '16:30:00');
SELECT *FROM LichLamViec

--Thêm dữ liệu vào bảng lịch hẹn (phải phù hợp với lịch làm việc của bác sĩ)
EXEC sp_help LichHen
INSERT INTO LichHen (MaLH, MaBN, MaBS, ThoiGian, TinhTrang)
VALUES 
('LH1', 'BN1', 'BS1', '2024-5-7 08:00:00', N'Hoàn thành'),
('LH2', 'BN2', 'BS2', '2024-5-6 08:00:00', N'Hoàn thành'),
('LH3', 'BN3', 'BS3', '2024-5-10 12:00:00', N'Hoàn thành'),
('LH4', 'BN4', 'BS4', '2024-5-5 09:00:00', N'Hoàn thành'),
('LH5', 'BN5', 'BS5', '2024-5-13 15:00:00', N'Hoàn thành'),
('LH6', 'BN6', 'BS6', '2024-5-11 18:00:00', N'Hoàn thành'),
('LH7', 'BN7', 'BS7', '2024-5-9 13:30:00', N'Hoàn thành'),
('LH8', 'BN8', 'BS8', '2024-5-1 11:45:00', N'Hoàn thành'),
('LH9', 'BN9', 'BS9', '2024-5-4 17:00:00', N'Hoàn thành'),
('LH10', 'BN10', 'BS10', '2024-5-14 14:15:00', N'Hoàn thành');
SELECT *FROM LichHen;

--Thêm dữ liệu vào bảng bệnh án (Ngày khám = null)
EXEC sp_help BenhAn
INSERT INTO BenhAn (MaBA, MaBN, MaBS, NgayKham, TrieuChung, ChanDoan)
VALUES
('BA1', 'BN1', 'BS1', null, N'Đau răng, đau lợi', N'Sâu răng'),
('BA2', 'BN2', 'BS2', null, N'Sốt cao, ho khan', N'Viêm họng'),
('BA3', 'BN3', 'BS3', null, N'Đau ngực, khó thở', N'Tăng huyết áp'),
('BA4', 'BN4', 'BS4', null, N'Mắt đỏ, sưng', N'Viêm kết mạc'),
('BA5', 'BN5', 'BS5', null, N'Đau bụng dưới', N'Sốt rét'),
('BA6', 'BN6', 'BS6', null, N'Đau răng, sưng nướu', N'Viêm nướu'),
('BA7', 'BN7', 'BS7', null, N'Đau đầu, chóng mặt', N'Đau đầu căng thẳng'),
('BA8', 'BN8', 'BS8', null, N'Đau dạ dày, buồn nôn', N'Viêm dạ dày'),
('BA9', 'BN9', 'BS9', null, N'Mẫn cảm da, ngứa', N'Dị ứng da'),
('BA10', 'BN10', 'BS10', null, N'Đau răng, chảy máu nướu', N'Viêm nướu');
SELECT *FROM BenhAn

--Thêm dữ liệu vào bảng thuốc
EXEC sp_help Thuoc
INSERT INTO Thuoc (MaThuoc, TenThuoc, GiaTien, DonViTinh, TacDungPhu, HSD, TonKho)
VALUES
('T1', N'Panadol', 20000, N'Vỉ', NULL, '2024-12-31', 1000),
('T2', N'Amoxicillin', 30000, N'Vỉ', N'Dị ứng', '2024-12-31', 1500),
('T3', N'Ibuprofen', 25000, N'Vỉ', N'Đau dạ dày', '2024-12-31', 1020),
('T4', N'Paracetamol', 18000, N'Vỉ', NULL, '2024-12-31', 800),
('T5', N'Aspirin', 15000, N'Vỉ', N'Tăng huyết áp', '2024-12-31', 900),
('T6', N'Codeine', 35000, N'Vỉ', N'Táo bón', '2024-12-31', 1010),
('T7', N'Ceftriaxone', 40000, N'Vỉ', N'Dị ứng', '2024-12-31', 1300),
('T8', N'Cloxacillin', 32000, N'Vỉ', NULL, '2024-12-31', 1000),
('T9', N'Atenolol', 28000, N'Vỉ', N'Tăng huyết áp', '2024-12-31', 800),
('T10', N'Propranolol', 30000, N'Vỉ', N'Di chứng', '2024-12-31', 700),
('T11', N'Amiodarone', 45000, N'Vỉ', N'Di chứng', '2024-12-31', 600),
('T12', N'Nitroglycerin', 50000, N'Vỉ', N'Táo bón', '2024-12-31', 900),
('T13', N'Aspirin', 20000, N'Vỉ', N'Dị ứng', '2024-12-31', 1100),
('T14', N'Morphine', 60000, N'Vỉ', N'Táo bón', '2024-12-31', 1200),
('T15', N'Prednisone', 35000, N'Vỉ', N'Di chứng', '2024-12-31', 800),
('T16', N'Prednisolone', 40000, N'Vỉ', N'Di chứng', '2024-12-31', 700),
('T17', N'Naproxen', 38000, N'Vỉ', N'Đau dạ dày', '2024-12-31', 1000),
('T18', N'Ranitidine', 25000, N'Vỉ', N'Di chứng', '2024-12-31', 1100),
('T19', N'Famotidine', 28000, N'Vỉ', N'Di chứng', '2024-12-31', 1200),
('T20', N'Omeprazole', 30000, N'Vỉ', N'Di chứng', '2024-12-31', 1300),
('T21', N'Lisinopril', 32000, N'Vỉ', N'Tăng huyết áp', '2024-12-31', 900),
('T22', N'Losartan', 28000, N'Vỉ', N'Tăng huyết áp', '2024-12-31', 800),
('T23', N'Enalapril', 30000, N'Vỉ', N'Tăng huyết áp', '2024-12-31', 700),
('T24', N'Amlodipine', 35000, N'Vỉ', N'Tăng huyết áp', '2024-12-31', 600),
('T25', N'Hydrochlorothiazide', 38000, N'Vỉ', N'Tăng huyết áp', '2024-12-31', 500),
('T26', N'Atorvastatin', 40000, N'Vỉ', N'Di chứng', '2024-12-31', 400),
('T27', N'Simvastatin', 30000, N'Vỉ', N'Di chứng', '2024-12-31', 300),
('T28', N'Rosuvastatin', 42000, N'Vỉ', N'Di chứng', '2024-12-31', 200),
('T29', N'Warfarin', 45000, N'Vỉ', N'Di chứng', '2024-12-31', 100),
('T30', N'Clopidogrel', 48000, N'Vỉ', N'Di chứng', '2024-12-31', 500);
SELECT *FROM Thuoc

--Thêm dữ liệu vào bảng đơn thuốc (tổng số = 0, tổng tiền = 0)
EXEC sp_help DonThuoc
INSERT INTO DonThuoc (MaDT, MaBA, TongSo, TongTien)
VALUES 
('DT1', 'BA1', 0, 0),
('DT2', 'BA2', 0, 0),
('DT3', 'BA3', 0, 0),
('DT4', 'BA4', 0, 0),
('DT5', 'BA5', 0, 0),
('DT6', 'BA6', 0, 0),
('DT7', 'BA7', 0, 0),
('DT8', 'BA8', 0, 0),
('DT9', 'BA9', 0, 0),
('DT10', 'BA10', 0, 0);
SELECT *FROM DonThuoc

--Thêm dữ liệu vào bảng chi tiết đơn thuốc (ngày lập phải thỏa mãn hạn sử dụng, tác dụng phụ = null, số lượng phải thỏa mãn tồn kho, đvt = null)
EXEC sp_help CT_DonThuoc
INSERT INTO CT_DonThuoc (MaCTDT, MaDT, MaThuoc, SoLuong, DonViTinh, ThanhTien, NgayLap, LieuLuong, TacDungPhu)
VALUES
('CTDT1', 'DT1', 'T2', 10, null, 0, '2024-06-01', 3, null),
('CTDT2', 'DT1', 'T5', 5, null, 0, '2024-06-01', 1, null),
('CTDT3', 'DT1', 'T10', 7, null, 0, '2024-06-01', 2, null),
('CTDT4', 'DT2', 'T3', 8, null, 0, '2024-06-02', 2, null),
('CTDT5', 'DT2', 'T8', 6, null, 0, '2024-06-02', 2, null),
('CTDT6', 'DT2', 'T13', 10, null, 0, '2024-06-02', 3, null),
('CTDT7', 'DT3', 'T4', 15, null, 0, '2024-06-03', 3, null),
('CTDT8', 'DT3', 'T9', 4, null, 0, '2024-06-03', 1, null),
('CTDT9', 'DT3', 'T14', 9, null, 0, '2024-06-03', 2, null),
('CTDT10', 'DT4', 'T1', 12, null, 0, '2024-06-04', 3, null),
('CTDT11', 'DT4', 'T6', 3, null, 0, '2024-06-04', 1, null),
('CTDT12', 'DT4', 'T11', 5, null, 0, '2024-06-04', 2, null),
('CTDT13', 'DT5', 'T7', 8, null, 0, '2024-06-05', 2, null),
('CTDT14', 'DT5', 'T12', 6, null, 0, '2024-06-05', 2, null),
('CTDT15', 'DT5', 'T17', 10, null, 0, '2024-06-05', 3, null),
('CTDT16', 'DT6', 'T16', 5, null, 0, '2024-06-06', 1, null),
('CTDT17', 'DT6', 'T18', 9, null, 0, '2024-06-06', 2, null),
('CTDT18', 'DT6', 'T23', 7, null, 0, '2024-06-06', 2, null),
('CTDT19', 'DT7', 'T19', 13, null, 0, '2024-06-07', 3, null),
('CTDT20', 'DT7', 'T24', 4, null, 0, '2024-06-07', 1, null),
('CTDT21', 'DT7', 'T29', 6, null, 0, '2024-06-07', 2, null),
('CTDT22', 'DT8', 'T20', 9, null, 0, '2024-06-08', 2, null),
('CTDT23', 'DT8', 'T25', 5, null, 0, '2024-06-08', 1, null),
('CTDT24', 'DT8', 'T30', 7, null, 0, '2024-06-08', 2, null),
('CTDT25', 'DT9', 'T15', 11, null, 0, '2024-06-09', 3, null),
('CTDT26', 'DT9', 'T21', 3, null, 0, '2024-06-09', 1, null),
('CTDT27', 'DT9', 'T26', 8, null, 0, '2024-06-09', 2, null),
('CTDT28', 'DT10', 'T22', 10, null, 0, '2024-06-10', 3, null),
('CTDT29', 'DT10', 'T27', 5, null, 0, '2024-06-10', 1, null),
('CTDT30', 'DT10', 'T28', 7, null, 0, '2024-06-10', 2, null);

SELECT *FROM CT_DonThuoc

--Thủ tục thêm bệnh nhân
EXEC sp_help BenhNhan
ALTER PROCEDURE ThemBenhNhan 
					@MaBN CHAR(20), 
					@TenBN NCHAR(200),
					@GioiTinh NCHAR(20),
					@NgaySinh DATE,
					@DiaChi NCHAR(400),
					@SDT CHAR(20)
AS
BEGIN
	IF EXISTS (SELECT MaBN FROM BenhNhan WHERE MaBN = @MaBN)
		PRINT N'Đã tồn tại mã bệnh nhân'
	ELSE 
		BEGIN
			INSERT INTO BenhNhan 
			VALUES (@MaBN, @TenBN, @GioiTinh, @NgaySinh, @DiaChi, @SDT)
			PRINT N'Thêm bệnh nhân thành công!'
		END
END
GO
SELECT *FROM BenhNhan;
EXEC ThemBenhNhan 'BN21', N'Nguyễn Văn PQ', N'Nam', '1992/3/3', N'Hải Phòng', '0334987122';
--Thủ tục sửa bệnh nhân
EXEC sp_help BenhNhan
ALTER PROCEDURE SuaBenhNhan 
							@MaBN CHAR(20),
							@TenBN NCHAR(200),
							@GioiTinh NCHAR(40),
							@NgaySinh DATE,
							@DiaChi NCHAR(400),
							@SDT CHAR(20)
AS 
BEGIN
	IF NOT EXISTS (SELECT MaBN FROM BenhNhan WHERE MaBN = @MaBN)
		PRINT N'Không tồn tại mã bệnh nhân'
	ELSE 
		BEGIN
			UPDATE BenhNhan SET
					TenBN = @TenBN,
					GioiTinh = @GioiTinh,
					NgaySinh = @NgaySinh,
					DiaChi = @DiaChi,
					SDT = @SDT
					WHERE MaBN = @MaBN
				PRINT N'Sửa thành công'
		END
END
GO
EXEC SuaBenhNhan 'BN21', N'Nguyễn Văn AB',  N'Nam', '1992/3/3', N'Hải Phòng', '0334987122';
SELECT *FROM BenhNhan;
--Thủ tục xóa bệnh nhân
EXEC sp_help BenhNhan
ALTER PROCEDURE XoaBenhNhan @MaBN CHAR(20)
AS
BEGIN
	IF NOT EXISTS (SELECT MaBN FROM BenhNhan WHERE MaBN = @MaBN)
		PRINT N'Không tồn tại mã bệnh nhân'
	IF EXISTS (SELECT MaBN FROM BenhAn WHERE MaBN = @MaBN)
		PRINT N'Mã bệnh nhân tồn tại trong bệnh án'
	IF EXISTS (SELECT MaBN FROM LichHen WHERE MaBN = @MaBN)
		PRINT N'Mã bệnh nhân tồn tại trong lịch hẹn'
	ELSE 
		BEGIN
			DELETE FROM BenhNhan WHERE MaBN = @MaBN;
			PRINT N'Xóa bệnh nhân thành công'
		END
END
GO
EXEC XoaBenhNhan 'BN21';
SELECT *FROM BenhNhan;
--Thủ tục thêm bác sĩ
EXEC sp_help BacSi
ALTER PROCEDURE ThemBacSi 
						@MaBS CHAR(20),
						@TenBS NCHAR(100),
						@ChuyenKhoa NCHAR(100),
						@SDT CHAR(20),
						@Email CHAR(100)
AS
BEGIN
	IF EXISTS (SELECT MaBS FROM BacSi WHERE MaBS = @MaBS)
		PRINT N'Đã tồn tại mã bác sĩ'
	ELSE 
		BEGIN
			INSERT INTO BacSi VALUES (@MaBS, @TenBS, @ChuyenKhoa, @SDT, @Email)
			PRINT N'Thêm bác sĩ thành công'
		END
END
GO
SELECT *FROM BacSi
EXEC ThemBacSi 'BS11', N'Nguyễn Văn Mạnh', N'Tai, mũi, họng', '045345343', 'manhcute@gmail.com';
--Thủ tục sửa bác sĩ
EXEC sp_help BacSi
ALTER PROCEDURE SuaBacSi 
					@MaBS CHAR(20),
					@TenBS NCHAR(200),
					@ChuyenKhoa NCHAR(200),
					@SDT CHAR(20),
					@Email CHAR(100)
AS
BEGIN
	IF NOT EXISTS (SELECT MaBS FROM BacSi WHERE MaBS = @MaBS)
		PRINT N'Không tồn tại mã bác sĩ'
	ELSE 
		BEGIN
			UPDATE BacSi SET 
				TenBS = @TenBS,
				ChuyenKhoa = @ChuyenKhoa,
				SDT = @SDT,
				Email = @Email
				WHERE MaBS = @MaBS
			PRINT N'Sửa thông tin bác sĩ thành công'
		END
END
GO
SELECT *FROM BacSi
EXEC SuaBacSi 'BS11', N'Nguyễn Văn Mạnh', N'Tai, mũi, họng', '04555555', 'manhcutehihi@gmail.com';
--Thủ tục xóa bác sĩ
EXEC sp_help BacSi
ALTER PROCEDURE XoaBacSi @MaBS CHAR(20)
AS
BEGIN
	IF NOT EXISTS (SELECT MaBS FROM BacSi WHERE MaBS = @MaBS)
		PRINT N'Không tồn tại mã bác sĩ'
	IF EXISTS (SELECT MaBS FROM BenhAn WHERE MaBS = @MaBS)
		PRINT N'Mã bác sĩ tồn tại trong bệnh án'
	IF EXISTS (SELECT MaBS FROM LichHen WHERE MaBS = @MaBS)
		PRINT N'Mã bác sĩ đã tồn tại trong lịch hẹn'
	IF EXISTS (SELECT MaBS FROM LichLamViec WHERE MaBS = @MaBS)
		PRINT N'Mã bác sĩ đã tồn tại trong lịch làm việc'
	ELSE 
		BEGIN
			DELETE FROM BacSi WHERE MaBS = @MaBS
			PRINT N'Xóa bác sĩ thành công!'
		END
END
GO
EXEC XoaBacSi 'BS11';
SELECT *FROM BacSi;
--Thủ tục thêm lịch làm việc
EXEC sp_help LichLamViec
ALTER PROCEDURE ThemLichLamViec 
						@MaBS CHAR(20),
						@NgayTrongTuan INT,
						@BatDau TIME,
						@KetThuc TIME
AS 
BEGIN 
	DECLARE @Ngay INT
	DECLARE @GioBatDau TIME

	SELECT @Ngay = NgayTrongTuan
	FROM LichLamViec
	WHERE MaBS = @MaBS

	SELECT @GioBatDau = BatDau
	FROM LichLamViec
	WHERE MaBS = @MaBS

	IF NOT EXISTS (SELECT MaBS FROM BacSi WHERE MaBS = @MaBS)
		PRINT N'Không tồn tại mã bác sĩ'
	IF @NgayTrongTuan >= 8 OR @NgayTrongTuan < 1
		PRINT N'Ngày không hợp lệ'
	IF @NgayTrongTuan = @Ngay AND @BatDau = @GioBatDau
		PRINT N'Trùng lịch làm việc'
	ELSE 
		BEGIN
			INSERT INTO LichLamViec VALUES (@MaBS, @NgayTrongTuan, @BatDau, @KetThuc)
			PRINT N'Thêm lịch làm việc thành công'
		END
END
GO
SELECT *FROM LichLamViec
EXEC ThemLichLamViec 'BS1', 1, '12:00:00', '17:00:00';

--Thủ tục sửa lịch làm việc
ALTER PROCEDURE SuaLichLamViec 
					@MaBS CHAR(20),
					@NgayTrongTuan INT,
					@BatDau TIME,
					@KetThuc TIME
AS
BEGIN
	DECLARE @GioBatDau TIME

	SELECT @GioBatDau = BatDau
	FROM LichLamViec
	WHERE MaBS = @MaBS AND NgayTrongTuan = @NgayTrongTuan

	IF NOT EXISTS (SELECT MaBS FROM LichLamViec WHERE MaBS = @MaBS)
		PRINT N'Không tồn tại mã bác sĩ'
	IF NOT EXISTS (SELECT NgayTrongTuan FROM LichLamViec WHERE NgayTrongTuan = @NgayTrongTuan)
		PRINT N'Không tồn tại ngày này trong lịch làm việc'
	IF @BatDau = @GioBatDau
		PRINT N'Trùng lịch làm việc'
	ELSE
		BEGIN
			UPDATE LichLamViec SET
				BatDau = @BatDau,
				KetThuc = @KetThuc
				WHERE MaBS = @MaBS AND NgayTrongTuan = @NgayTrongTuan
			PRINT N'Sửa lịch làm việc thành công'
		END
END
GO
SELECT *FROM LichLamViec;
EXEC SuaLichLamViec 'BS1', 1, '10:00:00', '16:00:00';

--Thủ tục xóa lịch làm việc
ALTER PROCEDURE XoaLichLamViec 
						@MaBS CHAR(20),
						@NgayTrongTuan INT,
						@BatDau TIME
AS 
BEGIN
	IF NOT EXISTS (SELECT MaBS FROM LichLamViec WHERE MaBS = @MaBS)
		PRINT N'Không tồn tại mã bác sĩ'
	IF NOT EXISTS (SELECT NgayTrongTuan FROM LichLamViec WHERE NgayTrongTuan = @NgayTrongTuan)
		PRINT N'Không tồn tại ngày trong tuần'
	IF NOT EXISTS (SELECT BatDau FROM LichLamViec WHERE BatDau = @BatDau)
		PRINT N'Giờ làm việc không đúng'
	ELSE
		BEGIN
			DELETE FROM LichLamViec
			WHERE MaBS = @MaBS AND NgayTrongTuan = @NgayTrongTuan AND BatDau = @BatDau
		END
END
GO
SELECT *FROM LichLamViec
EXEC XoaLichLamViec 'BS1', 1, '10:00:00'

--Thủ tục thêm lịch hẹn
EXEC sp_help LichHen
ALTER PROCEDURE ThemLichHen
						@MaLH CHAR(20),
						@MaBN CHAR(20),
						@MaBS CHAR(20),
						@ThoiGian DATETIME,
						@TinhTrang NCHAR(50)
AS
BEGIN
	DECLARE @ThoiGianHen DATETIME
	DECLARE @TinhTrangLichHen NCHAR(50)

	SELECT @ThoiGianHen = ThoiGian
	FROM LichHen
	WHERE MaLH = @MaLH AND MaBN = @MaBN AND MaBS = @MaBS

	SELECT @TinhTrangLichHen = TinhTrang
	FROM LichHen
	WHERE MaLH = @MaLH AND MaBN = @MaBN AND MaBS = @MaBS

	IF EXISTS (SELECT MaLH FROM LichHen WHERE MaLH = @MaLH)
		PRINT N'Đã tồn tại mã lịch hẹn'
	IF NOT EXISTS(SELECT MaBN FROM BenhNhan WHERE MaBN = @MaBN)
		PRINT N'Không tồn tại mã bệnh nhân'
	IF NOT EXISTS (SELECT MaBS FROM BacSi WHERE MaBS = @MaBS)
		PRINT N'Không tồn tại mã bác sĩ'
	IF @ThoiGian = @ThoiGianHen AND @TinhTrang = @TinhTrangLichHen
		PRINT N'Trùng lịch hẹn'
	ELSE 
		BEGIN
			INSERT INTO LichHen VALUES(@MaLH, @MaBN, @MaBS, @ThoiGian, @TinhTrang)
			PRINT N'Thêm lịch hẹn thành công'
		END
END
GO
SELECT *FROM LichHen 
EXEC ThemLichHen 'LH11', 'BN1', 'BS1', '2024/5/7 8:00:00', N'Hoàn thành';--thủ tục thêm lịch hẹn không xử lý được trường hợp thời gian bị trùng khi thêm một lịch hẹn mới
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
UPDATE BenhAn
SET NgayKham = CONVERT(DATE, LichHen.ThoiGian)
FROM BenhAn
INNER JOIN LichHen
ON BenhAn.MaBN = LichHen.MaBN 
AND BenhAn.MaBS = LichHen.MaBS 
AND LichHen.TinhTrang = N'Hoàn thành'

SELECT *FROM BenhAn
SELECT *FROM LichHen

--Update đơn vị tính, tác dụng phụ trong bảng chi tiết đơn
UPDATE CT_DonThuoc
SET DonViTinh = Thuoc.DonViTinh,
	TacDungPhu = Thuoc.TacDungPhu
FROM CT_DonThuoc
INNER JOIN Thuoc ON CT_DonThuoc.MaThuoc = Thuoc.MaThuoc

SELECT *FROM CT_DonThuoc
SELECT *FROM Thuoc

--Update thành tiền trong bảng chi tiết đơn
UPDATE CT_DonThuoc
SET ThanhTien = SoLuong*Thuoc.GiaTien
FROM CT_DonThuoc
INNER JOIN Thuoc ON CT_DonThuoc.MaThuoc = Thuoc.MaThuoc

SELECT *FROM CT_DonThuoc
SELECT *FROM Thuoc

--Update tổng số, tổng tiền trong bảng đơn thuốc
UPDATE DonThuoc
SET TongSo = subquery.TongSo,
	TongTien = subquery.TongTien
FROM 
	DonThuoc
INNER JOIN (
	SELECT 
		MaDT,
		SUM(SoLuong) AS TongSo,
		SUM(ThanhTien) AS TongTien
	FROM 
		CT_DonThuoc
	GROUP BY
		MaDT
	) AS subquery
ON 
	DonThuoc.MaDT = subquery.MaDT
SELECT *FROM DonThuoc
SELECT *FROM CT_DonThuoc
--Viết trigger cho tồn kho(thuốc), số lượng & thành tiền(chi tiết dt), tổng số & tổng tiền (đơn thuốc)
--Trigger khi thêm/sửa một chi tiết đơn hàng
CREATE TRIGGER trgAfterInsertCTDonThuoc
ON CT_DonThuoc
AFTER INSERT, UPDATE
AS 
BEGIN
	UPDATE Thuoc
	SET TonKho = TonKho - (SELECT SoLuong FROM inserted)
	FROM Thuoc, CT_DonThuoc
	WHERE Thuoc.MaThuoc = CT_DonThuoc.MaThuoc AND CT_DonThuoc.MaThuoc = (SELECT MaThuoc FROM inserted)

	UPDATE CT_DonThuoc
	SET ThanhTien = SoLuong*Thuoc.GiaTien
	FROM CT_DonThuoc, Thuoc
	WHERE CT_DonThuoc.MaThuoc = Thuoc.MaThuoc AND CT_DonThuoc.MaThuoc = (SELECT MaThuoc FROM inserted)

	UPDATE DonThuoc 
	SET TongSo = TongSo + CT_DonThuoc.SoLuong,
		TongTien = TongTien + CT_DonThuoc.ThanhTien
	FROM Thuoc, CT_DonThuoc
	WHERE DonThuoc.MaDT = CT_DonThuoc.MaDT AND CT_DonThuoc.MaDT = (SELECT MaDT FROM inserted)
END;

--Trigger khi xóa/sửa một chi tiết đơn hàng
CREATE TRIGGER trgAfterDeleteCTDonHang
ON CT_DonThuoc
AFTER DELETE, UPDATE
AS
BEGIN
	UPDATE Thuoc
	SET TonKho = TonKho + (SELECT SoLuong FROM deleted)
	FROM Thuoc, CT_DonThuoc
	WHERE Thuoc.MaThuoc = CT_DonThuoc.MaThuoc AND CT_DonThuoc.MaThuoc = (SELECT MaThuoc FROM deleted)

	UPDATE DonThuoc
	SET TongSo = TongSo - (SELECT SoLuong FROM deleted),
		TongTien = TongTien - CT_DonThuoc.ThanhTien
	FROM DonThuoc, CT_DonThuoc
	WHERE CT_DonThuoc.MaDT = DonThuoc.MaDT AND CT_DonThuoc.MaDT = (SELECT MaDT FROM deleted)
END;

--Tạo view xem tất cả hồ sơ bệnh án của các bệnh nhân
SELECT *FROM BenhNhan
SELECT *FROM BenhAn
CREATE VIEW HoSoBenhAn AS
SELECT BenhNhan.MaBN, 
		BenhNhan.TenBN, 
		BenhNhan.GioiTinh, 
		BenhNhan.NgaySinh,
		BenhNhan.DiaChi,
		BenhNhan.SDT,
		BenhAn.MaBS,
		BenhAn.NgayKham,
		BenhAn.TrieuChung,
		BenhAn.ChanDoan
FROM BenhNhan
INNER JOIN BenhAn ON BenhNhan.MaBN = BenhAn.MaBN

SELECT *FROM HoSoBenhAn

--Tạo view xem bác sĩ nào khám nhiều bệnh nhân nhất
CREATE VIEW BacSiKhamNhieuNhat AS
SELECT TOP(1) WITH TIES 
	BacSi.*,
	COUNT (BenhAn.MaBA) AS SoLuongKham
FROM BacSi
INNER JOIN 
	BenhAn ON BacSi.MaBS = BenhAn.MaBS
GROUP BY 
	BacSi.MaBS, BacSi.TenBS, BacSi.ChuyenKhoa, BacSi.SDT, BacSi.Email
ORDER BY 
	SoLuongKham DESC;

SELECT *FROM BacSi
SELECT *FROM BacSiKhamNhieuNhat
--Tạo view xem bệnh nhân nào khám nhiều bác sĩ nhất
CREATE VIEW BenhNhanKhamNhieuBacSiNhat AS
SELECT TOP(1) WITH TIES 
		BenhNhan.*,
		COUNT (DISTINCT BenhAn.MaBS) AS SoBacSi
FROM BenhNhan
INNER JOIN 
	BenhAn ON BenhNhan.MaBN = BenhAn.MaBN
GROUP BY
	BenhNhan.MaBN, BenhNhan.TenBN, BenhNhan.GioiTinh, BenhNhan.NgaySinh, BenhNhan.DiaChi, BenhNhan.SDT
ORDER BY
	SoBacSi DESC

SELECT *FROM BenhNhanKhamNhieuBacSiNhat
--Tạo view xem bệnh nhân nào tốn tiền mua thuốc nhất
CREATE VIEW BenhNhanTonTienMuaThuocNhat AS
SELECT TOP(1) WITH TIES
	BenhNhan.*,
	SUM (DonThuoc.TongTien) AS TongTienThuoc
FROM BenhNhan
INNER JOIN 
	BenhAn ON BenhNhan.MaBN = BenhAn.MaBN
INNER JOIN 
	DonThuoc ON BenhAn.MaBA = DonThuoc.MaBA
GROUP BY
	BenhNhan.MaBN, BenhNhan.TenBN, BenhNhan.GioiTinh, BenhNhan.NgaySinh, BenhNhan.DiaChi, BenhNhan.SDT
ORDER BY
	TongTienThuoc DESC

SELECT *FROM DonThuoc
SELECT *FROM BenhNhan
SELECT *FROM BenhNhanTonTienMuaThuocNhat
--Tạo view xem loại thuốc nào được bán nhiều nhất
CREATE VIEW ThuocDuocBanNhieuNhat AS
SELECT TOP(1) WITH TIES
		Thuoc.*,
		SUM (CT_DonThuoc.SoLuong) AS TongSoBan
FROM Thuoc
INNER JOIN
	CT_DonThuoc ON Thuoc.MaThuoc = CT_DonThuoc.MaThuoc
GROUP BY 
	Thuoc.MaThuoc, Thuoc.TenThuoc, Thuoc.GiaTien, Thuoc.DonViTinh, Thuoc.TacDungPhu, Thuoc.HSD, Thuoc.TonKho
ORDER BY
	TongSoBan DESC

SELECT *FROM ThuocDuocBanNhieuNhat
SELECT *FROM Thuoc
SELECT *FROM CT_DonThuoc

--Viết function tính tổng số đơn thuốc của một bệnh nhân
CREATE FUNCTION dbo.TongSoDonThuocMotBenhNhan (@MaBN CHAR(20))
RETURNS INT
AS 
BEGIN
	DECLARE @TongDon INT

	SELECT @TongDon = COUNT(DonThuoc.MaDT)
	FROM DonThuoc
	INNER JOIN
		BenhAn ON DonThuoc.MaBA = BenhAn.MaBA
	WHERE BenhAn.MaBN = @MaBN

	RETURN @TongDon
END

SELECT dbo.TongSoDonThuocMotBenhNhan('BN1') AS TongSoDonThuocBN1
SELECT *FROM DonThuoc
--Viết function tính tổng số lịch hẹn của một bác sĩ
CREATE FUNCTION dbo.TongSoLichHenCuaBacSi (@MaBS CHAR(20))
RETURNS INT
AS
BEGIN
	DECLARE @TongLichHen INT

	SELECT @TongLichHen = COUNT(MaLH)
	FROM LichHen
	WHERE LichHen.MaBS = @MaBS

	RETURN @TongLichHen
END

SELECT *FROM LichHen
SELECT dbo.TongSoLichHenCuaBacSi('BS1') AS TongLichHenCuaBacSi1

--Viết function tính tổng tiền thuốc của một bệnh nhân
CREATE FUNCTION dbo.TongTienThuocMotBenhNhan (@MaBN CHAR(20))
RETURNS DECIMAL(18, 2)
AS
BEGIN
	DECLARE @TongTienThuoc DECIMAL(18, 2)

	SELECT @TongTienThuoc = SUM(DonThuoc.TongTien)
	FROM DonThuoc
	INNER JOIN
		BenhAn ON DonThuoc.MaBA = BenhAn.MaBA
	WHERE BenhAn.MaBN = @MaBN

	RETURN @TongTienThuoc
END

SELECT dbo.TongTienThuocMotBenhNhan('BN1') AS TienThuocBenhNhan1

--Viết function tính tổng số tiền/số lượng của một loại thuốc được bán ra
CREATE FUNCTION dbo.ThongTinThuocBanRa (@MaThuoc CHAR(20))
RETURNS @ThongTin TABLE (
		SoLuongBan INT,
		TongTien DECIMAL(18, 2) )
AS
BEGIN
	DECLARE @SoLuongBan INT
	DECLARE @TongTien DECIMAL(18, 2)

	SELECT @SoLuongBan = SUM(CT_DonThuoc.SoLuong),
			@TongTien = SUM(CT_DonThuoc.ThanhTien)
		FROM CT_DonThuoc
		WHERE MaThuoc = @MaThuoc

	INSERT INTO @ThongTin (SoLuongBan, TongTien) VALUES (@SoLuongBan, @TongTien)

	RETURN
END;

SELECT *FROM Thuoc
SELECT *FROM dbo.ThongTinThuocBanRa('T1') AS ThongTinBanRaThuoc1

--Viết thủ tục thống kê có 3 lựa chọn: 
--option1: đến này YY/MM/DD có bao nhiêu loại thuốc được bán ra
--option2: tính tổng số loại thuốc theo đơn vị tính
--option3: đến ngày YY/MM/DD có bao nhiêu loại thuốc hết hạn
SELECT *FROM CT_DonThuoc
CREATE PROC ThongKeThuoc
	@Option INT,
	@Ngay DATE = NULL
AS
BEGIN
	IF @Option = 1
	BEGIN
		SELECT COUNT(DISTINCT MaThuoc) AS SoLoaiThuocBanRa
		FROM 
			CT_DonThuoc
		WHERE 
			NgayLap <= @Ngay
	END

	ELSE IF @Option = 2
	BEGIN
		SELECT 
			DonViTinh,
			SUM(TonKho) AS TongSoLuong
		FROM 
			Thuoc
		GROUP BY
			DonViTinh
	END

	ELSE IF @Option = 3
	BEGIN
		SELECT 
			COUNT (DISTINCT MaThuoc) AS SoThuocHetHan
		FROM 
			Thuoc
		WHERE
			HSD <= @Ngay
	END

	ELSE 
		BEGIN
			PRINT N'Tùy chọn không hợp lệ!'
		END
END

EXEC ThongKeThuoc 1, '2024/6/20'
EXEC ThongKeThuoc 2
EXEC ThongKeThuoc 3, '2025/1/1'
EXEC ThongKeThuoc 4