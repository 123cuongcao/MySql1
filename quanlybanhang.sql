-- create database QUANLYBANHANG;
-- use QUANLYBANHANG;  

-- create table KHACHHANG(
-- MaKH varchar(4) primary key ,
-- TenKH varchar(30) not null,
-- Diachi varchar(50),
-- Ngaysinh datetime,
-- soDT varchar(15) unique
-- );

-- create table NHANVIEN(
-- MaNV varchar(4) primary key ,
-- HoTen varchar(30) not null,
-- GioiTinh bit not null,
-- DiaChi varchar(50) not null,
-- NgaySinh datetime not null,
-- DienThoai varchar(15),
-- Email text ,
-- NoiSinh varchar(20) not null,
-- NgayVaoLam datetime ,
-- MaNQL varchar(4) 
-- );

-- create table NHACUNGCAP (
-- MaNCC varchar(5) primary key ,
-- TenNCC varchar(50) not null,
-- DiaChi varchar(50) not null,
-- Dienthoai varchar(50) not null,
-- Email varchar(50) not null,
-- Website varchar(30)
-- );

-- create table LOAISP(
-- MaloaiSP varchar(4) primary key,
-- TenloaiSP varchar(30) not null,
-- Ghichu varchar(100) not null
-- );

-- create table SANPHAM(
-- MaSP varchar(4) primary key ,
-- MaloaiSP varchar(4) not null,
-- TenSP varchar(50) not null,
-- Donvitinh varchar(10) not null,
-- Ghichu varchar(100)
-- );

-- create table PHIEUNHAP(
-- SoPN varchar(5) primary key ,
-- MaVN varchar(4) not null ,
-- MaNCC varchar(5) not null,
-- NgayNhap datetime not null ,
-- Ghichu varchar(100)
-- );

-- create table CTPHIEUNHAP (
-- MaSP varchar(4),
-- SoPN varchar(5),
-- Soluong smallint not null default 0,
-- Gianhap real not null check (Gianhap>=0),
-- primary key(MaSP,SoPN)

-- );

-- create table PHIEUXUAT (
-- SoPX varchar(5) primary key,
-- MaNV varchar(4) not null,
-- MaKH varchar(4) not null,
-- NgayBan datetime not null ,
-- GhiCHu text 
-- );

-- create table CTPHIEUXUAT (
-- SoPX varchar(5) not null ,
-- MaSP varchar(4) not null,
-- SoLuong smallint not null,
-- GiaBan real not null,
-- primary key(SoPX,MaSP)
-- );

-- alter table SANPHAM 
-- add foreign key (`MaloaiSP`) references LOAISP(`MaloaiSP`); 

-- alter table PHIEUNHAP
-- add foreign key (`MaVN`) references NHANVIEN(`MaNV`) ;
-- alter table PHIEUNHAP 
-- add foreign key (`MaNCC`) references NHACUNGCAP(`MaNCC`);

-- alter table CTPHIEUNHAP
-- add foreign key (`MaSP`) references SANPHAM(`MaSP`);
-- alter table CTPHIEUNHAP 
-- add foreign key (`SoPN`) references PHIEUNHAP(`SoPN`);

-- alter table PHIEUXUAT
-- add foreign key (`MaNV`) references NHANVIEN(`MaNV`);
-- alter table PHIEUXUAT 
-- add foreign key (`MaKH`) references KHACHHANG (`MaKH`);

-- alter table CTPHIEUXUAT
-- add foreign key (`SoPX`) references PHIEUXUAT (`SoPX`);
-- alter table CTPHIEUXUAT
-- add foreign key (`MaSP`) references SANPHAM(`MaSP`);

-- insert into NHANVIEN (MaNV,HoTen,GioiTinh,DiaChi,NgaySinh,DienThoai,Email,NoiSinh,NgayVaoLam,MaNQL) value('KH01','cường',1,'Bình Thạnh','1999-03-01 23:59:59','1234','cuong@gmail.com','Hà Nam','2000-01-03 23:59:59',1234); 

-- insert into nhacungcap value ('ncc01','SamSung','Hồ Chí Minh','1234','nhacungcap@gmail.com','https://nhacungcap.com');

-- insert into sanpham value('SP01','LSP1','Quần què','vnd','hàng mới về');
-- insert into sanpham value('SP02','LSP1','Quần không què','vnd','hàng mới về rất đẹp');

-- insert into loaisp value('LSP1','Quần','Quần áo rất đẹp');

-- insert into phieunhap values('PN01','NV01','NCC01','1999-03-01 23:59:59','hàng đã được kiểm duyệt') ,
-- 							('PN02','NV02','NCC01','1999-03-01 23:59:59','hàng đã được kiểm duyệt và chứng nhận');

-- insert into phieuxuat values('PX01','NV01','KH01','1999-03-01 23:59:59','hàng đã lên đường'),
-- 							('PX02','NV02','KH01','1999-03-01 23:59:59','hàng đã lên đườngvà sắp tới nơi');

-- insert into nhanvien value('NV03','Cường Cao',1,'Hồ Chí Minh','1999-03-01 23:59:59','123456','cuong@gmail.com','Hà Nam','1999-03-01 23:59:59','1234')

-- update khachhang set soDT = 1111 where MaKH like 'KH01';

-- update nhanvien  set diachi = 'Hà nội' where manv like 'NV01';  

-- insert into ctphieunhap value('SP03','PN02',12,1234); 

-- Bài 5:
-- delete from  nhanvien where manv like 'NV03';

-- delete from sanpham where masp like 'SP04';

-- Bài 6
-- select * from phieunhap left join  phieuxuat on phieunhap.maVN = phieuxuat.MaNV;

 -- 6.1 
 select MaNV,HoTen,GioiTinh,NgaySinh,DiaChi,DienThoai from nhanvien order by NgaySinh ;
 
-- 6.2 
select pn.SoPN,pn.MaVN,nv.HoTen,ncc.TenNCC,pn.NgayNhap,pn.Ghichu
from phieunhap pn join nhanvien nv join nhacungcap ncc  on nv.MaNV = pn.MaVN;

-- 6.3
select * from sanpham where Donvitinh like 'vnd' ;

-- 6.4 
select ctpn.SoPN,sp.MaSP,sp.TenSP,lsp.TenloaiSP ,sp.Donvitinh,ctpn.Soluong,ctpn.Gianhap,(ctpn.Soluong*ctpn.Gianhap) as `Thành tiền`
from ctphieunhap ctpn 
join sanpham sp on sp.MaSP = ctpn.MaSP 
join loaisp lsp on lsp.MaloaiSP = sp.MaloaiSP 
join phieunhap pn on pn.SoPN = ctpn.SoPN
;

-- 6.5
select ncc.MaNCC,ncc.TenNCC,ncc.DiaChi,ncc.Dienthoai,ncc.Email,pn.SoPN,pn.NgayNhap
from phieunhap pn join nhacungcap ncc on ncc.MaNCC = pn.MaNCC
where month(pn.NgayNhap) = month(now())
order by pn.NgayNhap ;

-- 6.6 -- 
select ctpx.SoPX,nv.HoTen,px.NgayBan,sp.MaSP,sp.TenSP,sp.Donvitinh,ctpx.SoLuong,ctpx.GiaBan,(ctpx.SoLuong*ctpx.GiaBan) as `Doanh thu `
from ctphieuxuat ctpx 
join phieuxuat px  on ctpx.SoPX = px.SoPX
join nhanvien nv on px.MaNV = nv.MaNV
join sanpham sp on ctpx.MaSP = sp.MaSP
where (px.NgayBan >= '2018-01-01 00:00:00') and (px.NgayBan <= '2018-06-01 00:00:00')
; 
-- insert into ctphieuxuat values
-- ('PX04','SP01',12,123),
-- ('PX04','SP02',22,123),
-- ('PX04','SP03',32,123);

-- 6.7 -- 
select * from khachhang where not khachhang.Ngaysinh like month(now());

-- 6.8 -- 
select  px.SoPX ,nv.HoTen,px.NgayBan,ctpx.MaSP,sp.Donvitinh,ctpx.SoLuong
from phieuxuat px 
join ctphieuxuat ctpx on ctpx.SoPX = px.SoPX 
join sanpham sp on sp.MaSP = ctpx.MaSP
join nhanvien nv on nv.MaNV = px.MaNV
 ;

-- 6.9 -- 
select px.SoPX,px.NgayBan,kh.MaKH,kh.TenKH,sum(ctpx.SoLuong*ctpx.GiaBan) as `Trị giá`
from phieuxuat px
join khachhang kh on kh.MaKH = px.MaKH
join ctphieuxuat ctpx on ctpx.SoPX = px.SoPX
group by px.SoPX;

-- 6.10 --
select sum(ctpx.SoLuong) as `tổng`
from ctphieuxuat ctpx 
join phieuxuat px on ctpx.SoPX = px.SoPX
where px.NgayBan >= '2018-1-1 00:00:00' and px.NgayBan <= '2018-6-1 00:00:00' and ctpx.MaSP like 'SP01'
;
 
-- 6.11 Tổng kết doanh thu theo từng khách hàng theo tháng, gồm các thông tin: 
-- tháng, mã khách hàng, tên khách hàng, địa chỉ, tổng tiền. --
select kh.MaKH ,sum(ctpx.SoLuong*ctpx.GiaBan) 
from khachhang kh 
join phieuxuat px on px.MaKH = kh.MaKH
join ctphieuxuat ctpx on ctpx.SoPX= px.SoPX 
where month(px.NgayBan) = 4
group by kh.MaKH
;

-- 6.12 --
select year(px.NgayBan) as `Năm`,month(px.NgayBan) as `Tháng` ,sp.TenSP,sp.MaSP,sum(ctpx.SoLuong)
from ctphieuxuat ctpx 
join phieuxuat px on ctpx.SoPX = px.SoPX 
join sanpham sp on sp.MaSP = ctpx.MaSP
group by month(px.NgayBan) , year(px.NgayBan) ,sp.MaSP
;

-- 13.Thống kê doanh thu bán hàng trong trong 6 tháng đầu năm 2018, thông tin 
-- hiển thị gồm: tháng, doanh thu 
select month(px.Ngayban) as `Tháng` ,sum(ctpx.GiaBan*ctpx.SoLuong) as `Doanh thu`
from phieuxuat px 
join ctphieuxuat ctpx on ctpx.SoPX = px.SoPX
where px.NgayBan >= '2018-1-1 00:00:00:' and px.NgayBan <= '2018-6-1 00:00:00:'
group by month(px.Ngayban)
;

-- 14.Liệt kê các hóa đơn bán hàng của tháng 5 và tháng 6 năm 2018, gồm các 
-- thông tin: số phiếu, ngày bán, họ tên nhân viên bán hàng, họ tên khách hàng, 
-- tổng trị giá. 
select px.NgayBan ,px.SoPX ,nv.HoTen,kh.TenKH ,sum(ctpx.GiaBan*ctpx.SoLuong) as 'Tổng giá trị'
from ctphieuxuat ctpx 
join phieuxuat px on ctpx.SoPX = px.SoPX
join nhanvien nv on nv.MaNV = px.MaNV 
join khachhang kh on kh.MaKH = px.MaKH
where month(px.ngayban) = 4 or month(px.ngayban) = 5
group by px.SoPX
;

-- 15.Cuối ngày, nhân viên tổng kết các hóa đơn bán hàng trong ngày, thông tin 
-- gồm: số phiếu xuất, mã khách hàng, tên khách hàng, họ tên nhân viên bán 
-- hàng, ngày bán, trị giá 
select px.SoPX,px.MaKH,kh.TenKH,nv.HoTen,px.NgayBan,sum(ctpx.GiaBan*ctpx.SoLuong) as `Trị giá`
from ctphieuxuat ctpx 
join phieuxuat px on ctpx.SoPX = px.SoPX
join khachhang kh on kh.MaKH = px.MaKH
join sanpham sp on sp.MaSP = ctpx.MaSP
join nhanvien nv on nv.MaNV = px.MaNV
group by px.SoPX 
;

-- 16.Thống kê doanh số bán hàng theo từng nhân viên, gồm thông tin: mã nhân 
-- viên, họ tên nhân viên, mã sản phẩm, tên sản phẩm, đơn vị tính, tổng số 
-- lượng 
select nv.MaNV ,nv.HoTen ,sp.MaSP,sp.TenSP,sp.Donvitinh,sum(ctpx.SoLuong) as `Tổng số lượng`
from nhanvien nv 
join  phieuxuat px on nv.MaNV = px.MaNV
join ctphieuxuat ctpx on ctpx.SoPX = px.SoPX
join sanpham sp on sp.MaSP = ctpx.MaSP
group by nv.MaNV ,sp.MaSP
;

-- 17.Liệt kê các hóa đơn bán hàng cho khách vãng lai (KH01) trong quý 2/2018, 
-- thông tin gồm số phiếu xuất, ngày bán, mã sản phẩm, tên sản phẩm, đơn vị 
-- tính, số lượng, đơn giá, thành tiền. 


-- 18.Liệt kê các sản phẩm chưa bán được trong 6 tháng đầu năm 2018, thông tin 
-- gồm: mã sản phẩm, tên sản phẩm, loại sản phẩm, đơn vị tính. 
select  *
from ctphieuxuat ctpx 
join phieuxuat px on ctpx.SoPX = px.SoPX
right join sanpham sp on sp.MaSP = ctpx.MaSP
join loaisp lsp on lsp.MaloaiSP = sp.MaloaiSP
where px.SoPX is null
;

-- 19.Liệt kê danh sách nhà cung cấp không giao dịch mua bán với cửa hàng trong 
-- quý 2/2018, gồm thông tin: mã nhà cung cấp, tên nhà cung cấp, địa chỉ, số 
-- điện thoại. 
select * 
from ctphieunhap ctpn 
join phieunhap pn on pn.SoPN = ctpn.SoPN
right join nhacungcap ncc on ncc.MaNCC = pn.MaNCC
where (pn.SoPN is null) and  ((pn.NgayNhap >= '2018-02-1 00:00:00') and (pn.NgayNhap <= '2018-02-28 00:00:00')) 
;

-- 20.Cho biết khách hàng có tổng trị giá đơn hàng lớn nhất trong 6 tháng đầu năm 
-- 2018.  
select kh.TenKH 
from khachhang kh 
join phieuxuat px on px.MaKH = kh.MaKH
join ctphieuxuat ctpx on ctpx.SoPX = px.SoPX
where px.NgayBan >= '2018-01-01 00:00:00' and px.NgayBan <= '2018-06-01 00:00:00'
group by kh.MaKH 
having max(ctpx.GiaBan*ctpx.SoLuong)
;

-- 21.Cho biết mã khách hàng và số lượng đơn đặt hàng của mỗi khách hàng.
select kh.MaKH , count(px.SoPX)
from khachhang kh 
join phieuxuat px on px.MaKH = kh.MaKH
join ctphieuxuat ctpx on ctpx.SoPX = px.SoPX
group by kh.MaKH
;

-- 22.Cho biết mã nhân viên, tên nhân viên, tên khách hàng kể cả những nhân viên 
-- không đại diện bán hàng.

-- 23.Cho biết số lượng nhân viên nam, số lượng nhân viên nữ
select count(nhanvien.MaNV ) 
from nhanvien 
group by nhanvien.GioiTinh
;

-- 24.Cho biết mã nhân viên, tên nhân viên, số năm làm việc của những nhân viên 
-- có thâm niên cao nhất
select * from nhanvien where
(select max(now() - nhanvien.NgayVaoLam) as `số năm`
from nhanvien )
;
 
-- 25.Hãy cho biết họ tên của những nhân viên đã đến tuổi về hưu (nam:60 tuổi, 
-- nữ: 55 tuổi) 



