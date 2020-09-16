-- Day17 Solution : Education DB
use sys;

drop database if exists EdDb;

create database EdDb;

use EdDb;

-- create the tables
create table ClassGrade (
	Grade varchar(3) not null, primary key(Grade),
	GPA decimal(4,2) not null default 0.0
);

create table Major (
	Id int not null auto_increment, primary key(Id),
	Description varchar(50) not null,
	MinSAT int not null
);

create table Student (
	Id int not null auto_increment, primary key(Id),
	Firstname varchar(30) not null,
	Lastname varchar(30) not null,
	SAT int not null,
	GPA decimal(4,2) not null,
	MajorId int,
	foreign key (MajorId) references Major(Id)
);


create table Instructor (
	Id int not null auto_increment, primary key(Id),
	Firstname varchar(30) not null,
	Lastname varchar(30) not null,
	YearsExperience int not null default 0,
	IsTenured bit not null default 0
);


create table Class (
	Id int not null auto_increment, primary key(Id),
	Subject varchar(30) not null,
	Section int not null,
	InstructorId int,
	foreign key (InstructorId) references Instructor(Id)
);


create table Assignment (
	Id int not null auto_increment, primary key(Id),
	Description varchar(30) not null,
	ClassId int not null,
	foreign key (ClassId) references Class(Id)
);


create table MajorClassRel (
	Id int not null auto_increment, primary key(Id),
	MajorId int not null,
	ClassId int not null,
	foreign key (MajorId) references Major(Id),
	foreign key (ClassId) references Class(Id)
);


create table StudentClassRel (
	Id int not null auto_increment, primary key(Id),
	StudentId int not null,
	ClassId int not null,
	ClassGradeValue varchar(3),
	foreign key (StudentId) references Student(Id),
	foreign key (ClassId) references Class(Id),
	foreign key (ClassGradeValue) references ClassGrade(Grade)
);


-- ClassGrade: Data
INSERT ClassGrade (Grade, GPA) VALUES ('A+',4.35);
INSERT ClassGrade (Grade, GPA) VALUES ('A',4.0);
INSERT ClassGrade (Grade, GPA) VALUES ('A-',3.7);
INSERT ClassGrade (Grade, GPA) VALUES ('B+',3.35);
INSERT ClassGrade (Grade, GPA) VALUES ('B',3.0);
INSERT ClassGrade (Grade, GPA) VALUES ('B-',2.7);
INSERT ClassGrade (Grade, GPA) VALUES ('C+',2.35);
INSERT ClassGrade (Grade, GPA) VALUES ('C',2.0);
INSERT ClassGrade (Grade, GPA) VALUES ('C-',1.7);
INSERT ClassGrade (Grade, GPA) VALUES ('D+',1.35);
INSERT ClassGrade (Grade, GPA) VALUES ('D',1.0);
INSERT ClassGrade (Grade, GPA) VALUES ('D-',0.5);
INSERT ClassGrade (Grade, GPA) VALUES ('F',0.0);


-- Major: Sample data
INSERT Major (Id, Description, MinSAT) VALUES (1,'General Business',800);
INSERT Major (Id, Description, MinSAT) VALUES (2,'Accounting', 1000);
INSERT Major (Id, Description, MinSAT) VALUES (3,'Finance', 1100);
INSERT Major (Id, Description, MinSAT) VALUES (4,'Math', 1300);
INSERT Major (Id, Description, MinSAT) VALUES (5,'Engineering', 1350);
INSERT Major (Id, Description, MinSAT) VALUES (6,'Education', 900);
INSERT Major (Id, Description, MinSAT) VALUES (7,'General Studies', 500);


-- Student: Sample data
INSERT Student VALUES(100,'Eric','Ephram',1200,3.0,1);
INSERT Student VALUES(110,'Greg','Gould',1100,2.5,null);
INSERT Student VALUES(120,'Adam','Ant',1300,3.2,null);
INSERT Student VALUES(130,'Howard','Hess',1600,3.7,null);
INSERT Student VALUES(140,'Charles','Caldwell',900,2.1,null);
INSERT Student VALUES(150,'James','Joyce',1100,2.5,null);
INSERT Student VALUES(160,'Doug','Dumas',1350,3.1,null);
INSERT Student VALUES(170,'Kevin','Kraft',1000,2.7,null);
INSERT Student VALUES(180,'Frank','Fountain',1000,2.5,null);
INSERT Student VALUES(190,'Brian','Biggs',950,2.3,null);


-- Instructor: Sample data
INSERT Instructor VALUES (10,'Joe','Downey',10,1);
INSERT Instructor VALUES (20,'Jane','Jones',6,1);
INSERT Instructor VALUES (30,'Bill','Tensi',3,0);
INSERT Instructor VALUES (40,'Sherry','Nagy',14,1);
INSERT Instructor VALUES (50,'Frank','Schell',23,1);
INSERT Instructor VALUES (60,'Michelle','Bellman',35,1);
INSERT Instructor VALUES (70,'George','Hunt',2,0);
INSERT Instructor VALUES (80,'Amy','Brock',7,0);
INSERT Instructor VALUES (90,'Larry','Seger',11,1);
INSERT Instructor VALUES (100,'Kathy','Miller',21,1);


-- CLASS: Sample data
-- English
INSERT class (Id,Subject,Section,InstructorId) VALUES(10101,'English',101,10);
INSERT class (Id,Subject,Section,InstructorId) VALUES(10102,'English',102,NULL);
INSERT class (Id,Subject,Section,InstructorId) VALUES(10103,'English',103,NULL);
INSERT class (Id,Subject,Section,InstructorId) VALUES(10201,'English',201,10);
INSERT class (Id,Subject,Section,InstructorId) VALUES(10202,'English',202,NULL);
INSERT class (Id,Subject,Section,InstructorId) VALUES(10203,'English',203,NULL);
INSERT class (Id,Subject,Section,InstructorId) VALUES(10301,'English',301,10);
INSERT class (Id,Subject,Section,InstructorId) VALUES(10302,'English',302,NULL);
INSERT class (Id,Subject,Section,InstructorId) VALUES(10303,'English',303,NULL);

-- Math
INSERT class (Id,Subject,Section,InstructorId) VALUES(20201,'Math',201,50);
INSERT class (Id,Subject,Section,InstructorId) VALUES(20202,'Math',202,NULL);
INSERT class (Id,Subject,Section,InstructorId) VALUES(20203,'Math',203,NULL);
INSERT class (Id,Subject,Section,InstructorId) VALUES(20204,'Math',204,NULL);
INSERT class (Id,Subject,Section,InstructorId) VALUES(20401,'Math',401,50);
INSERT class (Id,Subject,Section,InstructorId) VALUES(20402,'Math',402,NULL);
INSERT class (Id,Subject,Section,InstructorId) VALUES(20403,'Math',403,NULL);
INSERT class (Id,Subject,Section,InstructorId) VALUES(20404,'Math',404,NULL);

-- History
INSERT class (Id,Subject,Section,InstructorId) VALUES(30101,'History',101,80);
INSERT class (Id,Subject,Section,InstructorId) VALUES(30202,'History',201,80);
INSERT class (Id,Subject,Section,InstructorId) VALUES(30303,'History',301,80);

-- Computer Science
INSERT class (Id,Subject,Section,InstructorId) VALUES(40311,'Computer Science',311,40);
INSERT class (Id,Subject,Section,InstructorId) VALUES(40312,'Computer Science',312,40);
INSERT class (Id,Subject,Section,InstructorId) VALUES(40313,'Computer Science',313,40);
INSERT class (Id,Subject,Section,InstructorId) VALUES(40441,'Computer Science',441,40);
INSERT class (Id,Subject,Section,InstructorId) VALUES(40442,'Computer Science',442,40);
INSERT class (Id,Subject,Section,InstructorId) VALUES(40443,'Computer Science',443,40);

-- Psychology
INSERT class (Id,Subject,Section,InstructorId) VALUES(50101,'Psychology',101,20);
INSERT class (Id,Subject,Section,InstructorId) VALUES(50102,'Psychology',102,20);
INSERT class (Id,Subject,Section,InstructorId) VALUES(50231,'Psychology',231,20);
INSERT class (Id,Subject,Section,InstructorId) VALUES(50232,'Psychology',232,20);

-- Education
INSERT class (Id,Subject,Section,InstructorId) VALUES(60221,'Education',221,60);
INSERT class (Id,Subject,Section,InstructorId) VALUES(60222,'Education',222,60);
INSERT class (Id,Subject,Section,InstructorId) VALUES(60223,'Education',223,60);
INSERT class (Id,Subject,Section,InstructorId) VALUES(60351,'Education',351,70);
INSERT class (Id,Subject,Section,InstructorId) VALUES(60352,'Education',352,70);
INSERT class (Id,Subject,Section,InstructorId) VALUES(60353,'Education',353,70);


-- Classes needed for Major: General Business
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(1,1,10101); -- Gen bus | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(2,1,10102); -- Gen bus | Eng 102
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(3,1,10103); -- Gen bus | Eng 103
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(4,1,20201); -- Gen bus | Mat 201
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(5,1,20202); -- Gen bus | Mat 202
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(6,1,20203); -- Gen bus | Mat 203
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(7,1,30101); -- Gen bus | His 101


-- Classes needed for Major: Accounting
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(8,2,10101); -- Acct | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(9,2,10102); -- Acct | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(10,2,10103); -- Acct | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(11,2,20201); -- Acct | Mat 201
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(12,2,20202); -- Acct | Mat 202
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(13,2,20203); -- Acct | Mat 203
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(14,2,30101); -- Acct | His 101


-- Classes needed for Major: Finance
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(15,3,10101); -- Fin | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(16,3,10102); -- Fin | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(17,3,10103); -- Fin | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(18,3,20201); -- Fin | Mat 201
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(19,3,20202); -- Fin | Mat 202
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(20,3,20203); -- Fin | MatId,  203
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(21,3,30101); -- Fin | His 101


-- Classes needed for Major: Finance
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(22,4,10101); -- Math | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(23,4,10102); -- Math | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(24,4,10103); -- Math | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(25,4,20201); -- Math | Mat 201
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(26,4,20202); -- Math | Mat 202
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(27,4,20203); -- Math | Mat Id, 203
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(28,4,20204); -- Math | Mat 204
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(29,4,20401); -- Math | Mat 201
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(30,4,20402); -- Math | Mat 202
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(31,4,20403); -- Math | Mat 203
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(32,4,20404); -- Math | Mat 204
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(33,4,30101); -- Math | His 10Id, 1

-- Classes needed for Major: Finance
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(34,5,10101); -- Eng | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(35,5,10102); -- Eng | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(36,5,10103); -- Eng | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(37,5,20201); -- Eng | Mat 201
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(38,5,20202); -- Eng | Mat 202
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(39,5,20203); -- Eng | Mat 203
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(40,5,30101); -- Eng | His 101

-- Classes needed for Major: Finance
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(41,6,10101); -- Educ | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(42,6,10102); -- Educ | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(43,6,10103); -- Educ | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(44,6,20201); -- Educ | Mat 201
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(45,6,20202); -- Educ | Mat 202
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(46,6,20203); -- Educ | Mat 203
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(47,6,30101); -- Educ | His 101


-- Classes needed for Major: Finance
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(48,7,10101); -- GS | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(49,7,10102); -- GS | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(50,7,10103); -- GS | Eng 101
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(51,7,20201); -- GS | Mat 201
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(52,7,20202); -- GS | Mat 202
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(53,7,20203); -- GS | Mat 203
INSERT MajorClassRel (Id, MajorId, ClassId) VALUES(54,7,30101); -- GS | His 101

