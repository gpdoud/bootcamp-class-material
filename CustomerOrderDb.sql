USE [master]
GO
DROP DATABASE IF EXISTS [CustomerOrderDb]
GO
CREATE DATABASE [CustomerOrderDb]
GO
USE [CustomerOrderDb]
GO
CREATE TABLE Customers (
	Id int PRIMARY KEY IDENTITY(1001,1) NOT NULL,
	Name nvarchar(50) NOT NULL,
	City nvarchar(30),
	State char(2),
	Active bit not null default 1
);
GO
CREATE TABLE Orders (
	Id int not null primary key identity(2001, 1),
	Date DateTime not null default getdate(),
	Note nvarchar(255),
	CustomerId int,
);
GO
CREATE TABLE Products (
	Id int not null primary key identity(3001, 1),
	Name nvarchar(80) not null,
	Price decimal(11,2) not null default 10.0
);
GO
CREATE TABLE OrderLines (
	Id int not null primary key identity(4001, 1),
	OrderId int not null foreign key references Orders(id),
	ProductId int not null foreign key references Products(Id),
	Quantity int not null default 1
);
GO
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Nintendo','Bensley','OH',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Adidas','Nessen City','KY',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Intel Corporation','Ballard','IN',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('MTV','Oviedo','PA',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Deere & Company','Jelm','OH',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Audi','Philmont','IL',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Nokia','Walterhill','IN',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('BlackBerry','Tower City','MI',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Xerox','Hookerton','KY',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Jack Daniel','Cora','PA',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Heineken Brewery','Masaryktown','OH',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('KFC','Fiskdale','IN',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Wal-Mart','Gunnison','MI',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Zara','Orosi','KY',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Vodafone','Jenner','OH',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Hewlett-Packard','Farrell','IL',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Prada','Clinchport','IN',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('SAP','Ault','KY',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('IBM','Geuda Springs','PA',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Budweiser','Penn Lake Park','OH',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Burberry','Rodman','IN',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Pizza Hut','Kenbridge','KY',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('eBay','Wesley','MI',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Starbucks','Jersey City','OH',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Caterpillar Inc.','La Porte','IL',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Nescafé','Southeast Arcadia','KY',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Chase','Hanalei','IN',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('Porsche','Kotzebue','OH',1)
INSERT INTO CUSTOMERS (NAME, CITY, STATE, ACTIVE) VALUES ('HSBC','Baiting Hollow','PA',1)
GO
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1998-09-29 06:44:40',1028);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2015-01-08 22:45:20',1029);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1997-04-09 17:46:23',1006);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2018-09-11 12:01:14',1010);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2014-01-09 15:28:09',1024);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1998-10-12 05:03:25',1027);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1994-02-17 07:07:37',1027);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1991-12-29 14:27:22',1008);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1992-07-07 18:31:32',1008);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1995-10-29 12:10:13',1016);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1993-06-21 07:12:28',1008);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2015-10-28 00:08:37',1027);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1992-08-17 12:02:00',1028);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1995-10-30 00:54:55',1025);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2012-05-09 13:53:06',1003);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1992-08-30 21:07:59',1008);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1993-07-18 21:03:48',1007);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2007-03-22 08:42:51',1019);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1991-01-05 21:11:49',1002);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2017-08-25 17:22:40',1002);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1994-12-26 06:08:47',1012);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2002-06-19 13:01:19',1002);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1995-10-24 01:41:21',1027);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2006-06-18 17:20:12',1028);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1992-03-16 04:09:22',1011);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2010-12-14 01:58:29',1021);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2016-12-24 17:20:49',1001);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2016-11-09 02:50:34',1015);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1996-12-23 23:23:21',1026);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2006-02-02 08:06:10',1001);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2012-01-04 08:44:57',1028);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2002-08-06 12:26:03',1025);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2009-04-25 01:28:12',1003);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2006-08-08 03:45:14',1008);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2009-05-20 20:12:09',1007);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2011-05-24 04:18:49',1019);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2013-06-09 08:14:04',1002);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1990-05-01 18:00:39',1002);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2009-03-28 07:44:01',1012);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1994-02-03 19:24:53',1002);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2005-02-10 06:57:08',1028);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1994-02-04 20:35:46',1025);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2008-08-14 16:02:31',1003);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2004-07-04 11:03:44',1008);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2007-12-17 20:24:08',1007);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2004-04-07 14:13:18',1019);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1996-12-09 22:56:36',1002);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2007-03-08 09:00:55',1002);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('2008-10-12 19:14:16',1012);
INSERT INTO ORDERS (DATE, CUSTOMERID) VALUES ('1994-04-01 05:06:30',1002);
GO
INSERT INTO PRODUCTS (NAME, PRICE) VALUES ('Echo', 99.99);
INSERT INTO PRODUCTS (NAME, PRICE) VALUES ('Echo Dot', 39.99);
INSERT INTO PRODUCTS (NAME, PRICE) VALUES ('Kingston Micro SD', 9.99);
INSERT INTO PRODUCTS (NAME, PRICE) VALUES ('nonda USB Type C to USB 3.0 Adapter', 8.49);
INSERT INTO PRODUCTS (NAME, PRICE) VALUES ('TP-Link AC1200 WiFi Range Extender', 49.99);
INSERT INTO PRODUCTS (NAME, PRICE) VALUES ('Kingston 240GB A400 SSD 2.5'' SATA', 29.99);
INSERT INTO PRODUCTS (NAME, PRICE) VALUES ('sunswan USB Flash Drive 128GB USB C Thumb Drive', 33.98);
INSERT INTO PRODUCTS (NAME, PRICE) VALUES ('USB C External Bluray Drive Player NOLYTH USB3.0 External Blu-Ray Drive', 130.99);
INSERT INTO PRODUCTS (NAME, PRICE) VALUES ('Apple iPad Pro (10.5-inch, Wi-Fi + Cellular, 64GB) - Rose Gold', 579.00);
INSERT INTO PRODUCTS (NAME, PRICE) VALUES ('Tecware Phantom 87 Key Mechanical Keyboard', 39.09);
INSERT INTO PRODUCTS (NAME, PRICE) VALUES ('Stylus Pen, ARYKX 10 Pack of Fiber Mesh Tip Stylus', 5.70);
INSERT INTO PRODUCTS (NAME, PRICE) VALUES ('Panasonic KX-TCA430 Comfort-Fit, Foldable Headset', 16.99);
INSERT INTO PRODUCTS (NAME, PRICE) VALUES ('Crucial BX500 480GB 3D NAND SATA 2.5-Inch Internal SSD', 49.99);
INSERT INTO PRODUCTS (NAME, PRICE) VALUES ('Kingston HyperX FURY 16GB Kit (2x8GB) 1866MHz DDR3 CL10 DIMM - Red', 68.99);
GO
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2038,3005,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2042,3009,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2047,3012,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2007,3012,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2025,3014,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2012,3007,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2004,3012,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2013,3012,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2023,3012,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2011,3009,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2043,3006,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2030,3005,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2014,3008,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2002,3012,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2020,3002,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2019,3005,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2022,3004,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2024,3003,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2018,3013,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2028,3013,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2038,3010,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2013,3001,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2043,3005,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2034,3006,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2007,3004,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2015,3006,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2009,3010,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2029,3005,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2002,3006,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2004,3011,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2044,3013,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2027,3004,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2044,3006,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2010,3002,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2038,3012,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2027,3001,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2031,3010,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2004,3003,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2004,3008,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2009,3010,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2008,3007,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2022,3005,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2024,3013,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2019,3002,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2031,3013,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2041,3005,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2009,3010,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2039,3012,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2013,3004,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2041,3010,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2045,3008,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2023,3008,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2049,3005,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2035,3014,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2018,3009,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2038,3010,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2028,3013,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2026,3013,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2041,3003,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2005,3012,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2010,3006,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2023,3004,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2011,3012,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2046,3002,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2006,3010,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2039,3006,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2039,3010,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2036,3007,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2027,3009,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2004,3010,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2011,3001,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2039,3006,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2036,3008,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2013,3010,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2016,3014,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2018,3001,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2006,3003,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2027,3005,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2035,3001,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2022,3013,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2039,3014,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2029,3014,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2034,3009,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2050,3009,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2035,3008,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2005,3004,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2043,3001,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2022,3013,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2019,3012,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2017,3007,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2015,3007,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2018,3005,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2018,3010,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2013,3008,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2040,3007,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2015,3014,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2044,3009,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2016,3011,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2038,3001,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2042,3013,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2040,3005,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2013,3008,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2050,3006,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2010,3011,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2017,3005,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2038,3007,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2031,3010,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2034,3006,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2005,3007,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2040,3004,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2004,3012,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2042,3005,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2046,3005,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2039,3006,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2032,3006,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2002,3004,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2046,3008,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2026,3013,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2050,3013,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2048,3011,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2046,3012,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2033,3005,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2012,3008,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2015,3011,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2014,3001,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2028,3011,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2024,3010,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2019,3003,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2012,3005,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2012,3013,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2037,3008,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2049,3014,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2003,3012,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2009,3003,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2017,3002,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2026,3009,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2003,3006,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2019,3002,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2023,3001,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2026,3008,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2032,3001,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2034,3006,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2039,3011,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2034,3007,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2042,3010,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2003,3014,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2040,3014,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2002,3008,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2047,3003,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2019,3013,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2047,3003,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2024,3002,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2039,3008,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2008,3005,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2020,3009,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2003,3007,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2003,3009,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2024,3013,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2043,3001,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2030,3010,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2017,3014,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2027,3010,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2007,3010,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2010,3013,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2048,3009,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2043,3008,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2016,3006,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2034,3001,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2020,3013,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2050,3004,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2042,3005,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2030,3003,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2002,3003,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2027,3003,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2043,3009,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2044,3010,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2013,3002,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2040,3001,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2031,3002,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2045,3009,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2010,3014,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2005,3008,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2036,3005,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2026,3014,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2006,3009,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2029,3001,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2020,3012,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2006,3001,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2028,3003,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2023,3014,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2017,3002,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2040,3007,4);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2031,3009,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2026,3006,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2003,3006,2);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2046,3005,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2005,3014,1);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2016,3012,5);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2017,3008,3);
INSERT INTO OrderLines (OrderId, ProductId, Quantity) VALUES (2036,3013,3);
go