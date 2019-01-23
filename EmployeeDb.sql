use master;
go
alter database EmploymentDb set single_user with rollback immediate
go
drop database if exists EmploymentDb;
go
create database EmploymentDb;
go
use EmploymentDb;
go
create table Job (
	Id int not null primary key identity(1,1),
	Description nvarchar(80) not null,
	Salary decimal(9,2) not null default 20000
);
go
Insert into Job (Description, Salary) values ('President', 200000);
Insert into Job (Description, Salary) values ('VP', 150000);
Insert into Job (Description, Salary) values ('Director', 125000);
Insert into Job (Description, Salary) values ('Asst Director', 115000);
Insert into Job (Description, Salary) values ('Sr. Manager', 100000);
Insert into Job (Description, Salary) values ('Manager', 90000);
Insert into Job (Description, Salary) values ('Asst. Manager', 80000);
Insert into Job (Description, Salary) values ('Supervisor', 70000);

go
create table Employee (
	Id int not null primary key identity(1,1),
	Lastname nvarchar(30) not null,
	Firstname nvarchar(30) not null,
	JobId int not null foreign key references Job(Id)
);
go
Insert into Employee (Lastname, Firstname, JobId) values ('Adams', 'John', 6);
Insert into Employee (Lastname, Firstname, JobId) values ('Baker', 'Amy', 7);
Insert into Employee (Lastname, Firstname, JobId) values ('Conner', 'Bill', 2);
Insert into Employee (Lastname, Firstname, JobId) values ('Dalton', 'Abe', 1);
Insert into Employee (Lastname, Firstname, JobId) values ('Everington', 'Amy', 4);
Insert into Employee (Lastname, Firstname, JobId) values ('Franklin', 'John', 5);
Insert into Employee (Lastname, Firstname, JobId) values ('Gatz', 'Dan', 8);
Insert into Employee (Lastname, Firstname, JobId) values ('Henry', 'Bill', 1);
Insert into Employee (Lastname, Firstname, JobId) values ('Ibanez', 'Amy', 4);
Insert into Employee (Lastname, Firstname, JobId) values ('Johnson', 'Abe', 2);
Insert into Employee (Lastname, Firstname, JobId) values ('Kincade', 'John', 5);
Insert into Employee (Lastname, Firstname, JobId) values ('Lincoln', 'Dan', 7);
Insert into Employee (Lastname, Firstname, JobId) values ('Morrison', 'Abe', 5);
Insert into Employee (Lastname, Firstname, JobId) values ('Nickols', 'Bill', 3);
Insert into Employee (Lastname, Firstname, JobId) values ('OBrien', 'Abe', 4);
Insert into Employee (Lastname, Firstname, JobId) values ('Paxton', 'Dan', 2);
Insert into Employee (Lastname, Firstname, JobId) values ('Quinto', 'John', 1);
Insert into Employee (Lastname, Firstname, JobId) values ('Robertson', 'Abe', 5);
Insert into Employee (Lastname, Firstname, JobId) values ('Sinclair', 'Amy', 2);
Insert into Employee (Lastname, Firstname, JobId) values ('Thompson', 'Bill', 7);
Insert into Employee (Lastname, Firstname, JobId) values ('Unser', 'Dan', 6);
Insert into Employee (Lastname, Firstname, JobId) values ('Victor', 'Abe', 8);
Insert into Employee (Lastname, Firstname, JobId) values ('Wilson', 'John', 2);
Insert into Employee (Lastname, Firstname, JobId) values ('Xavier', 'Dan', 3);
Insert into Employee (Lastname, Firstname, JobId) values ('Yankey', 'Amy', 5);
Insert into Employee (Lastname, Firstname, JobId) values ('Zontel', 'Bill', 2);
go
