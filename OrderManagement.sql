create database OrderManagement;
use OrderManagement;


create table DonviKhach(
	MaDV varchar(20) not null primary key,
	TenDV varchar(30) not null,
	DiaChi varchar(5) not null,
	DienThoai varchar(10)
);

create table Hang(
	MaHang varchar(20) not null primary key,
    TenHang varchar(30) not null,
    DVTinh float not null,
    MoTa varchar(255)
);

create table NguoiDat(
	MaND varchar(20),
    TenND varchar(30),
    MaDV varchar(20),
    MaHang varchar(20),
    foreign key (MaHang) references Hang(MaHang),
    foreign key (MaDV) references DonviKhach(MaDV)
);

create table OrderGroup(
	SoDH varchar(20) primary key,
	NgayOrder date,
	Soluong int,
	MaHang varchar(20),
	foreign key (MaHang) references Hang(MaHang)
);

create table NguoiNhan(
	MaNN varchar(20) primary key,
    TenNN varchar(30),
	MaDV varchar(20),
    foreign key (MaDV) references DonviKhach(MaDV)
);

create table NoiGiao(
	MaDDG varchar(20) primary key,
    TenDDG varchar(30)
);

create table NguoiGiao(
	MaNG varchar(20) primary key,
    TenNG varchar(30)
);
create table Delevery(
	SoPG varchar(20) not null primary key,
	NgayGiao date,
    DonGia float,
    SoDH varchar(20),
    MaNN varchar(20),
    MaDDG varchar(20),
    MaNG varchar(20),
    foreign key (SoDH) references OrderGroup(SoDH),
    foreign key (MaDDG) references NoiGiao(MaDDG),
	foreign key (MaNN) references NguoiNhan(MaNN),
    foreign key (MaNG) references NguoiGiao(MaNG)
);

