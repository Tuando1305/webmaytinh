create schema webbanhang;
use webbanhang;
create table quanly (
maquanly int(11) AUTO_INCREMENT Primary key,
tenquanly varchar(50) Not Null,
ngaytao datetime Not Null,
ngaycapnhat datetime Not Null
);
create table nhanvien (
manhanvien int(11) AUTO_INCREMENT Primary Key,
maquanly int(11) Not Null,
tennv varchar(50) Not Null,
sodt int(15) Not Null,
email varchar(100) Not Null,
ngaysinh datetime NOt Null,
diachi varchar(100) Not Null,
ngaytao datetime Not Null,
ngaycapnhat datetime Not Null,
Foreign key(maquanly) references quanly(maquanly)
);
create table khackhang (
makh int(11) AUTO_INCREMENT Primary Key,
manhanvien int(11) NOt Null,
tenkh varchar(50) Not Null,
sodt int(15) Not Null,
email varchar(100) Not Null,
ngaysinh datetime NOt Null,
diachi varchar(100) Not Null,
ngaytao datetime Not Null,
ngaycapnhat datetime Not Null,
Foreign key(manhanvien) references nhanvien(manhanvien)
);
CREATE TABLE taikhoan (
    mataikh INT(11) AUTO_INCREMENT PRIMARY KEY,
    hoten VARCHAR(50) NOT NULL UNIQUE,
    matkhau VARCHAR(255) NOT NULL,
    maquanly int(11),
    manhanvien int(11),
    makh int(11),
    ngaytao DATETIME NOT NULL,
    ngaycapnhat DATETIME NOT NULL,
    FOREIGN KEY (maquanly) REFERENCES quanly(maquanly),
    FOREIGN KEY (manhanvien) REFERENCES nhanvien(manhanvien),
    FOREIGN KEY (makh) REFERENCES khackhang(makh)
);
create table danhmucsp (
madanhmuc int(11) AUTO_INCREMENT Primary Key,
tendm varchar(100) Not Null,
ngaytao datetime Not Null,
ngaycapnhat datetime Not Null
);
create table sanpham (
masp varchar(11) Primary Key,
tensp varchar(300) Not Null,
madanhmuc int(11) Not Null,
hang varchar(50) Not Null,
giatien float(15,0) Not Null,
giamgia float(15,0) Not Null,
ngaytao datetime Not Null,
ngaycapnhat datetime Not Null,
Foreign key(madanhmuc) references danhmucsp(madanhmuc)
);



create table khohang (
makho int(11) AUTO_INCREMENT Primary Key,
madanhmuc int(11) Not Null,
masp varchar(11) Not Null,
tensp varchar(300) Not Null,
soluong int Not Null,
ngaytao datetime Not Null,
ngaycapnhat datetime Not Null,
Foreign key(madanhmuc) references danhmucsp(madanhmuc),
Foreign key(masp) references sanpham(masp)
);
create table hoadon (
mahd int(11) AUTO_INCREMENT Primary Key,
manhanvien int(11) Not Null,
makh int(11) Not Null,
tenkh varchar(50) Not Null,
sodt int(15) Not Null,
email varchar(100) Not Null,
diachi varchar(100) Not Null,
ngaytao datetime Not Null,
ngaycapnhat datetime Not Null,
Foreign key(manhanvien) references nhanvien(manhanvien),
Foreign key(makh) references khackhang(makh)
);
create table hoadonchitiet (
mahd int(11) AUTO_INCREMENT Primary Key,
masp varchar(11) Not Null,
tensp varchar(100) Not Null,
giatien float Not Null,
soluongsp int Not Null,
tongtien float Not Null,
Foreign key(mahd) references hoadon(mahd),
Foreign key(masp) references sanpham(masp)
);

create table phanhoi (
maph int(11) AUTO_INCREMENT Primary Key,
masp varchar(11) Not Null,
tensp varchar(100) Not Null,
danhgia int(10) Not Null,mieuta varchar(300) Not Null,
ngaytao datetime Not Null,
ngaycapnhat datetime Not Null,
Foreign key(masp) references sanpham(masp)
);

SELECT 
    sp.masp,
    sp.tensp,
    IFNULL(kh.soluong, 0) AS soluongban,
    IFNULL(kh.soluong * sp.giatien, 0) AS tongdoanhthu
FROM
    sanpham sp
LEFT JOIN
    khohang kh ON sp.masp = kh.masp;
    select * from webbanhang.sanpham;

ALTER TABLE sanpham
DROP hinhanh;

SET FOREIGN_KEY_CHECKS=0;
SET FOREIGN_KEY_CHECKS=1;

DELETE FROM sanpham;
DELETE FROM khohang;


INSERT INTO quanly 
VALUE (1, 'Do Anh Tuan', '2024-4-5', '2024-4-5'),
      (2, 'Nguyen Phuc Dinh Loc', '2024-4-5', '2024-4-5'),
      (3, 'Nguyen Duy Cong', '2024-4-5', '2024-4-5');


INSERT INTO nhanvien
VALUE (1, 1, 'Nguyen Van A', 0966547882, 'nguyenvana@gmail.com', '1997-3-16','Ha Noi', '2024-4-5', '2024-4-5'),
      (2, 2, 'Nguyen Van B', 0966547881, 'nguyenvanb@gmail.com', '1997-4-17','Thai Binh', '2024-4-5', '2024-4-5'),
      (3, 3, 'Nguyen Van C', 0966547883, 'nguyenvanc@gmail.com', '1997-5-18','Quang Ninh', '2024-4-5', '2024-4-5'),
      (4, 1, 'Nguyen Thi D', 0966547884, 'nguyenthid@gmail.com', '1997-6-19','Ninh Binh', '2024-4-5', '2024-4-5');

INSERT INTO khackhang
VALUE (1, 1, 'Le Van A', 0966547431, 'levana@gmail.com', '1995-1-1','Ha Noi', '2024-4-5', '2024-4-5'),
      (2, 2, 'Le Van B', 0966547432, 'levanb@gmail.com', '1995-1-2','Ha Noi', '2024-4-5', '2024-4-5'),
      (3, 3, 'Le Van C', 0966547433, 'levanc@gmail.com', '1995-1-3','Ha Noi', '2024-4-5', '2024-4-5'),
      (4, 4, 'Le Van D', 0966547434, 'levand@gmail.com', '1995-1-4','Ha Noi', '2024-4-5', '2024-4-5'),
      (5, 1, 'Le Van E', 0966547435, 'levane@gmail.com', '1995-1-5','Ha Noi', '2024-4-5', '2024-4-5'),
      (6, 2, 'Le Van F', 0966547436, 'levanf@gmail.com', '1995-1-6','Ha Noi', '2024-4-5', '2024-4-5'),
      (7, 3, 'Le Van G', 0966547437, 'levang@gmail.com', '1995-1-7','Ha Noi', '2024-4-5', '2024-4-5'),
      (8, 4, 'Le Van H', 0966547438, 'levanh@gmail.com', '1995-1-8','Ha Noi', '2024-4-5', '2024-4-5');
      
      
 INSERT INTO taikhoan
 VALUE (001, 'Le Van A', '123456789', 1, 1, 1, '2024-4-5', '2024-4-5'),
       (002, 'Le Van B', '123456789', 2, 2, 2, '2024-4-5', '2024-4-5'),
       (003, 'Le Van C', '123456789', 3, 3, 3, '2024-4-5', '2024-4-5'),
       (004, 'Le Van D', '123456789', 1, 4, 4, '2024-4-5', '2024-4-5'),
       (005, 'Le Van E', '123456789', 2, 1, 5, '2024-4-5', '2024-4-5'),
       (006, 'Le Van F', '123456789', 3, 2, 6, '2024-4-5', '2024-4-5'),
       (007, 'Le Van G', '123456789', 1, 3, 7, '2024-4-5', '2024-4-5'),
       (008, 'Le Van H', '123456789', 2, 4, 8, '2024-4-5', '2024-4-5');
       
       
       
INSERT INTO danhmucsp
VALUE (1, 'Laptop Gaming', '2024-4-5', '2024-4-5'),
      (2, 'Laptop Đồ Họa', '2024-4-5', '2024-4-5');


SELECT * FROM webbanhang.khohang;
INSERT INTO sanpham
VALUE ('LTLV039', 'Laptop Lenovo Gaming LOQ 15IAX9 (83GS001RVN) (i5 12450HX/12GB RAM/512GB SSD/15.6 FHD 144hz/RTX 3050 6G/Win11/Xám)', 1, 'Lenovo', 22499000, 9, '2024-4-5', '2024-4-5'),
      ('LTLV040', 'Laptop Lenovo Gaming LOQ 15IAX9 (83GS000RVN) (i5 12450HX/16GB RAM/512GB SSD/15.6 FHD 144hz/RTX4050 6G/Win11/Xám)', 1, 'Lenovo', 23999000, 8, '2024-4-5', '2024-4-5'),
      ('LTGI039', 'Laptop Gigabyte Gaming G5 (MF-F2VN313SH) (i5 12450H /16GB RAM/512GB SSD/RTX4050 6G/15.6 inch FHD 144Hz/Win 11/Đen)', 1, 'Gigabyte', 20499000, 11, '2024-4-5', '2024-4-5'),
      ('LTLV009', 'Laptop Lenovo Legion Slim 5 16IRH8 (82YA00BSVN) (i5 13500H/16GB RAM/512GB SSD/16 WQXGA 165hz/RTX 4050 6G/Win11/Xám)', 1, 'Lenovo', 31999000, 11, '2024-4-5', '2024-4-5'),
      ('LTGI041', 'Laptop Gigabyte Gaming G5 (MF5-H2VN353SH) (i7 13620H /16GB RAM/512GB SSD/RTX4050 6G/15.6 inch FHD 144Hz/Win 11/Đen)', 1, 'Gigabyte', 23999000, 14, '2024-4-5', '2024-4-5'),
      ('LTGI036', 'Laptop Gigabyte Gaming AORUS 15 (9MF-E2VN583SH) (i5 12500H /8GB Ram/512GB SSD/RTX4050 6G/15.6 inch FHD 360Hz/Win 11/Đen)', 1, 'Gigabyte', 26799000, 0, '2024-4-5', '2024-4-5'),
      ('LTAC840', 'Laptop Acer Gaming Aspire 7 A715-76G-59MW (NH.QMYSV.001) (i5 12450H/8GB RAM/512GB SSD/RTX2050 4G/15.6 inch FHD//Win11/Đen/Vỏ nhôm) (2023)', 1, 'Acer', 17999000, 14, '2024-4-5', '2024-4-5'),
      ('LTAU857', 'Laptop Asus Gaming TUF FA506NF-HN005W (R5 7535HS/8GB RAM/512GB SSD/15.6 FHD 144hz/RTX2050 4GB/Win11/Đen)', 1, 'Asus', 16899000, 16, '2024-4-5', '2024-4-5');
      
      
INSERT INTO khohang
VALUE (001, 1, 'LTLV039', 'Laptop Lenovo Gaming LOQ 15IAX9 (83GS001RVN) (i5 12450HX/12GB RAM/512GB SSD/15.6 FHD 144hz/RTX 3050 6G/Win11/Xám)', 8, '2024-4-5', '2024-4-5'),
      (002, 1, 'LTLV040', 'Laptop Lenovo Gaming LOQ 15IAX9 (83GS000RVN) (i5 12450HX/16GB RAM/512GB SSD/15.6 FHD 144hz/RTX4050 6G/Win11/Xám)', 7, '2024-4-5', '2024-4-5'),
      (003, 1, 'LTGI039', 'Laptop Gigabyte Gaming G5 (MF-F2VN313SH) (i5 12450H /16GB RAM/512GB SSD/RTX4050 6G/15.6 inch FHD 144Hz/Win 11/Đen)', 10, '2024-4-5', '2024-4-5'),
      (004, 1, 'LTLV009', 'Laptop Lenovo Legion Slim 5 16IRH8 (82YA00BSVN) (i5 13500H/16GB RAM/512GB SSD/16 WQXGA 165hz/RTX 4050 6G/Win11/Xám)', 10, '2024-4-5', '2024-4-5'),
      (005, 1, 'LTGI041', 'Laptop Gigabyte Gaming G5 (MF5-H2VN353SH) (i7 13620H /16GB RAM/512GB SSD/RTX4050 6G/15.6 inch FHD 144Hz/Win 11/Đen)', 6, '2024-4-5', '2024-4-5'),
      (006, 1, 'LTGI036', 'Laptop Gigabyte Gaming AORUS 15 (9MF-E2VN583SH) (i5 12500H /8GB Ram/512GB SSD/RTX4050 6G/15.6 inch FHD 360Hz/Win 11/Đen)', 9, '2024-4-5', '2024-4-5'),
      (007, 1, 'LTAC840', 'Laptop Acer Gaming Aspire 7 A715-76G-59MW (NH.QMYSV.001) (i5 12450H/8GB RAM/512GB SSD/RTX2050 4G/15.6 inch FHD//Win11/Đen/Vỏ nhôm) (2023)', 12, '2024-4-5', '2024-4-5'),
      (008, 1, 'LTAU857', 'Laptop Asus Gaming TUF FA506NF-HN005W (R5 7535HS/8GB RAM/512GB SSD/15.6 FHD 144hz/RTX2050 4GB/Win11/Đen)', 11, '2024-4-5', '2024-4-5');
      
      
      
      
      
