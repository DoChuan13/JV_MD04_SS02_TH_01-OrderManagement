create database OrderManagement;
use OrderManagement;


create table DonviKhach(
	MaDV varchar(20) primary key,
	TenDV varchar(30) not null,
	DiaChi varchar(5) not null,
	DienThoai varchar(10)
);

create table NguoiDat(
	MaSoND varchar(20) primary key,
    TenND varchar(30)
);

create table Hang(
	MaHang varchar(20) not null primary key,
    TenHang varchar(30) not null,
    DVTinh float not null,
    MoTa varchar(255)
);

create table NguoiNhan(
	MaNN varchar(20) primary key,
    TenNN varchar(30)
);

create table NoiGiao(
	MaDDG varchar(20) primary key,
    TenDDG varchar(30)
);

create table NguoiGiao(
	MaNG varchar(20) primary key,
    TenNG varchar(30)
);

create table Thuoc1(
	MaDV varchar(20),
    MaSoND varchar(20),
    primary key (MaDV, MaSoND),
    foreign key (MaDV) references DonViKhach(MaDV),
    foreign key (MaSoND) references NguoiDat(MaSoND)
);

create table Dat(
	SoDH varchar(20),
	NgayDat date,
	Soluong int,
	MaHang varchar(20),
    MaSoND varchar (20),
    primary key(MaHang,MaSoND),
	foreign key (MaHang) references Hang(MaHang),
    foreign key (MaSoND) references NguoiDat(MaSoND)
);


create table Giao(
	SoPG varchar(20),
	NgayGiao date,
    Soluong int,
    DonGia float,
    MaHang varchar(20),
    MaNG varchar(20),
    MaDDG varchar(20),
    MaNN varchar(20),
    primary key (MaHang,MaNG, MaDDG, MaNN),
    foreign key (MaHang) references Hang(MaHang),
    foreign key (MaNG) references NguoiGiao(MaNG),
    foreign key (MaDDG) references NoiGiao(MaDDG),
    foreign key (MaNN) references NguoiNhan(MaNN)
);

create table Thuoc2(
	MaDV varchar(20),
    MaNN varchar(20),
    primary key (MaDV, MaNN),
    foreign key (MaDV) references DonViKhach(MaDV),
    foreign key (MaNN) references NguoiNhan(MaNN)
);