
-- Tabel Transaksi_Header
CREATE TABLE Transaksi_Header (
    No_Transaksi VARCHAR(10) PRIMARY KEY,
    Tanggal DATE NOT NULL,
    Kasir VARCHAR(50) NOT NULL
);

-- Tabel Transaksi_Detail
CREATE TABLE Transaksi_Detail (
    ID_Detail INT AUTO_INCREMENT PRIMARY KEY,
    No_Transaksi VARCHAR(10),
    Item VARCHAR(50),
    Kuantitas INT,
    Harga_Satuan DECIMAL(10, 2),
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (No_Transaksi) REFERENCES Transaksi_Header(No_Transaksi)
);

-- Tabel Item
CREATE TABLE Item (
    Item VARCHAR(50) PRIMARY KEY,
    Harga_Satuan DECIMAL(10, 2)
);

-- Tabel Pengguna
CREATE TABLE Pengguna (
    ID_User INT AUTO_INCREMENT PRIMARY KEY,
    Nama_User VARCHAR(50),
    Role ENUM('SuperUser', 'Admin', 'User'),
    Password VARCHAR(255)
);

-- Super User
CREATE USER 'super_user'@'%' IDENTIFIED BY 'password_super';
GRANT ALL PRIVILEGES ON database_name.* TO 'super_user'@'%';

-- Admin
CREATE USER 'admin'@'%' IDENTIFIED BY 'password_admin';
GRANT INSERT, UPDATE ON Transaksi_Header, Transaksi_Detail TO 'admin'@'%';

-- User Biasa
CREATE USER 'user'@'%' IDENTIFIED BY 'password_user';
GRANT SELECT ON database_name.* TO 'user'@'%';
