use Master;
go
DROP DATABASE IF EXISTS SqlPrs;
go
CREATE DATABASE SqlPrs;
go
use SqlPrs;
go
CREATE TABLE Users (
	Id int primary key identity(1,1),
	Username nvarchar(30) not null unique,
	Password nvarchar(30) not null,
	Firstname nvarchar(30) not null,
	Lastname nvarchar(30) not null,
	Phone nvarchar(12) null,
	Email nvarchar(255) null,
	IsReviewer bit not null default 0,
	IsAdmin bit not null default 0
);
go
insert into users (Username, Password, Firstname, Lastname, IsReviewer, IsAdmin)
	values ('sa', 'sa', 'Super', 'Admin', 1, 1);
insert into users (Username, Password, Firstname, Lastname, IsReviewer)
	values ('rv', 'rv', 'Request', 'Reviewer', 1);
insert into users (Username, Password, Firstname, Lastname)
	values ('nu', 'nu', 'Normal', 'User');
go
CREATE TABLE Vendors (
	Id int primary key identity(1,1),
	Code nvarchar(30) not null unique,
	Name nvarchar(30) not null,
	Address nvarchar(30) not null,
	City nvarchar(30) not null,
	State nvarchar(2) not null,
	Zip nvarchar(5) not null,
	Phone nvarchar(30) null,
	Email nvarchar(30) null
);
go
insert into Vendors (Code, Name, Address, City, State, Zip)
	values ('AMAZ', 'Amazon', '123 Any Street', 'Seattle', 'WA', '12345');
insert into Vendors (Code, Name, Address, City, State, Zip)
	values ('WALM', 'Walmart', '123 Any Street', 'Bentonville', 'AR', '12345');
insert into Vendors (Code, Name, Address, City, State, Zip)
	values ('TARG', 'Target', '123 Any Street', 'Minneapolis', 'MN', '12345');
insert into Vendors (Code, Name, Address, City, State, Zip)
	values ('BBUY', 'Best Buy', '123 Any Street', 'Seattle', 'WA', '12345');
insert into Vendors (Code, Name, Address, City, State, Zip)
	values ('MSFT', 'Microsoft', '123 Any Street', 'Redmond', 'WA', '12345');
go
CREATE TABLE Products (
	Id int primary key identity(1,1),
	PartNbr nvarchar(30) not null unique,
	Name nvarchar(30) not null,
	Price decimal(11,2) not null,
	Unit nvarchar(30) not null,
	PhotoPath nvarchar(255),
	VendorId int not null foreign key references Vendors(Id)
);
go
DECLARE @AmazonId int;
SELECT @AmazonId = Id from Vendors where Code = 'AMAZ';

INSERT INTO Products (PartNbr, Name, Price, Unit, VendorId)
	values ('ECHO', 'Echo', 99.99, 'Each', @AmazonId);
INSERT INTO Products (PartNbr, Name, Price, Unit, VendorId)
	values ('ECHODOT', 'Echo Dot', 39.99, 'Each', @AmazonId);
INSERT INTO Products (PartNbr, Name, Price, Unit, VendorId)
	values ('IPAD', 'Apple iPad', 499.99, 'Each', @AmazonId);
INSERT INTO Products (PartNbr, Name, Price, Unit, VendorId)
	values ('CITIZENWATCH', 'Citizen Watch', 119.99, 'Each', @AmazonId);
INSERT INTO Products (PartNbr, Name, Price, Unit, VendorId)
	values ('BOOKCSHARPINTRO', 'Intro to C#', 49.99, 'Each', @AmazonId);
go
CREATE TABLE Requests (
	Id int primary key identity(1,1),
	Description nvarchar(80) not null,
	Justification nvarchar(80) not null,
	RejectionReason nvarchar(80) null,
	DeliveryMode nvarchar(20) not null default 'Pickup',
	Status nvarchar(10) not null default 'NEW',
	Total decimal(11,2) not null default 0,
	UserId int not null foreign key references Users(Id)
);
go
DECLARE @UserId int;
SELECT @UserId = Id from Users where Username = 'nu';
Insert into Requests (Description, Justification, UserId)
	values ('1st Request AAA', 'None', @UserId);
Insert into Requests (Description, Justification, UserId)
	values ('2nd Request BBB', 'None', @UserId);
Insert into Requests (Description, Justification, UserId)
	values ('3rd Request CCC', 'None', @UserId);
go
CREATE TABLE RequestLines (
	Id int primary key identity(1,1),
	RequestId int not null foreign key references Requests(Id),
	ProductId int not null foreign key references Products(Id),
	Quantity int not null default 1
);
go
DECLARE @RequestId int, @EchoId int, @EchoDotId int;
DECLARE @IPadId int, @WatchId int, @BookId int;
SELECT @RequestId = Id from Requests where Description like '%AAA';

SELECT @EchoId = Id from Products where PartNbr = 'ECHO';
SELECT @EchoDotId = Id from Products where PartNbr = 'ECHODOT';
SELECT @IPadId = Id from Products where PartNbr = 'ECHODOT';
SELECT @IPadId = Id from Products where PartNbr = 'IPAD';
SELECT @WatchId = Id from Products where PartNbr = 'CITIZENWATCH';
SELECT @BookId = Id from Products where PartNbr = 'BOOKCSHARPINTRO';

INSERT Into RequestLines (RequestId, ProductId, Quantity)
	values (@RequestId, @EchoId, 1);
INSERT Into RequestLines (RequestId, ProductId, Quantity)
	values (@RequestId, @EchoDotId, 3);
INSERT Into RequestLines (RequestId, ProductId, Quantity)
	values (@RequestId, @IPadId, 2);
INSERT Into RequestLines (RequestId, ProductId, Quantity)
	values (@RequestId, @WatchId, 1);
INSERT Into RequestLines (RequestId, ProductId, Quantity)
	values (@RequestId, @BookId, 5);
go
