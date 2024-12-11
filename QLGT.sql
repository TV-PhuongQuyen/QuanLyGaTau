CREATE DATABASE QuanLyGaTau;
USE QuanLyGaTau;

-- Bảng User
CREATE TABLE User (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(199) NOT NULL,
    password VARCHAR(199) NOT NULL
);

-- Bảng Tau
CREATE TABLE Tau (
    id_tau VARCHAR(199) PRIMARY KEY,
    ten_tau VARCHAR(199) NOT NULL,
    so_hieu_tau VARCHAR(199) NOT NULL,
    TrangThai ENUM('HoatDong', 'Dung') NOT NULL
);

-- Bảng SoGheTau
CREATE TABLE SoGheTau (
    id_SoGhe VARCHAR(199) PRIMARY KEY,
    id_tau VARCHAR(199) NOT NULL,
    SoChoNgoi INT NOT NULL,
    HangGhe VARCHAR(199) NOT NULL,
    gia_ve DECIMAL(10, 2) NOT NULL,
    TrangThai ENUM('con', 'het') NOT NULL,
    FOREIGN KEY (id_tau) REFERENCES Tau(id_tau) ON DELETE CASCADE
);

-- Bảng LichTrinh
CREATE TABLE LichTrinh (
    id_lich_trinh VARCHAR(199) PRIMARY KEY,
    id_tau VARCHAR(199) NOT NULL,
    ga_kh VARCHAR(199) NOT NULL,
    ga_den VARCHAR(199) NOT NULL,
    time_kh TIME NOT NULL,
    time_den TIME NOT NULL,
    ngay_kh DATE NOT NULL,
    ngay_den DATE NOT NULL,
    TrangThai ENUM('DaDuyet', 'ChuaDuyet') NOT NULL,
    FOREIGN KEY (id_tau) REFERENCES Tau(id_tau) ON DELETE CASCADE
);

-- Bảng Khách Hàng
CREATE TABLE KhachHang (
    id_kh VARCHAR(199) PRIMARY KEY,
    name VARCHAR(199) NOT NULL,
    gioi_tinh ENUM('Nam', 'Nu') NOT NULL,
    email VARCHAR(199) NOT NULL,
    cccd VARCHAR(12) NOT NULL,
    number VARCHAR(12) NOT NULL, 
    id_SoGhe VARCHAR(199) NOT NULL,
    id_lich_trinh VARCHAR(199) NOT NULL,
    ngay_dat_ve DATE NOT NULL,
    TrangThai ENUM('DaDuyet', 'ChoDuyet') NOT NULL,
    FOREIGN KEY (id_SoGhe) REFERENCES SoGheTau(id_SoGhe) ON DELETE CASCADE,
    FOREIGN KEY (id_lich_trinh) REFERENCES LichTrinh(id_lich_trinh) ON DELETE CASCADE
);

