-- CREATE DATABASE BootcampDb;
/*
CREATE TABLE Students 
(
	Id int not null primary key identity(1, 1),
	Firstname nvarchar(30) not null,
	Lastname nvarchar(50) not null,
	Email nvarchar(255) null,
	Phone nvarchar(10) null,
	DateEnrolled DateTime not null default getdate()
);

INSERT into Students (Firstname, Lastname, Phone, Email)
	VALUES ('Jane', 'Doe');
INSERT into Students (Firstname, Lastname, Phone, Email)
	VALUES ('Alex', 'Chan', '5135605531', 'frozenchanana@gmail.com');
INSERT into Students (Firstname, Lastname, Phone, Email)
	VALUES ('Brailee', 'Begley', '5134351173', 'brail33na11@gmail.com');
INSERT into Students (Firstname, Lastname, Phone, Email)
	VALUES ('Briana', 'Presley', '5132549807', 'presley.briana@gmail.com');
INSERT into Students (Firstname, Lastname, Phone, Email)
	VALUES ('Glenn', 'Lindmark', '5134849323', 'lindmark421@gmail.com');
INSERT into Students (Firstname, Lastname, Phone, Email)
	VALUES ('Jesse', 'Kyle', '5136551990', 'jkylecarpentry@gmail.com');
INSERT into Students (Firstname, Lastname, Phone, Email)
	VALUES ('Maggie', 'Schutzman', '8594797837', 'maggieschutzman2@gmail.com');
INSERT into Students (Firstname, Lastname, Phone, Email)
	VALUES ('Marianne', 'Linardos', '5137858178', 'mlinardow.edu@gmail.com');
INSERT into Students (Firstname, Lastname, Phone, Email)
	VALUES ('Titus', 'Moore', '9374741083', 'tmoore@edgewebware.com');

CREATE TABLE Bootcamps (
	Id int not null primary key identity(1,1),
	Description nvarchar(80) not null
);

INSERT into Bootcamps (Description) VALUES ('.Net');
INSERT into Bootcamps (Description) VALUES ('Java');

select * from bootcamps;

ALTER TABLE Students
	Add BootcampId int null
		foreign key references Bootcamps(Id);

UPDATE Students 
	SET BootcampId = (SELECT id from Bootcamps where description like '%java%') 
	Where Lastname = 'Doe';

UPDATE Students 
	SET BootcampId = (SELECT id from Bootcamps where description like '%net%') 
	Where Lastname <> 'Doe';


CREATE TABLE Assessments (
	Id int not null primary key identity(1,1),
	Technology nvarchar(30) not null,
	NbrQuestions int not null default 10
);
GO
INSERT Into Assessments (Technology, NbrQuestions) VALUES ('Git/Github', 5);
INSERT Into Assessments (Technology) VALUES ('SQL');
INSERT Into Assessments (Technology) VALUES ('C#');
INSERT Into Assessments (Technology) VALUES ('JavaScript');
INSERT Into Assessments (Technology) VALUES ('Angular');
GO

CREATE TABLE AssessmentScores (
	Id int not null primary key identity(1,1),
	StudentId int not null foreign key references Students(Id),
	AssessmentId int not null foreign key references Assessments(Id),
	NbrCorrect int not null
);

INSERT into AssessmentScores (StudentId, AssessmentId, NbrCorrect) VALUES (1, 1, 6); -- Git
INSERT into AssessmentScores (StudentId, AssessmentId, NbrCorrect) VALUES (1, 2, 9); -- SQL
INSERT into AssessmentScores (StudentId, AssessmentId, NbrCorrect) VALUES (1, 3, 10); -- C#/Java
INSERT into AssessmentScores (StudentId, AssessmentId, NbrCorrect) VALUES (1, 4, 7); -- JS
INSERT into AssessmentScores (StudentId, AssessmentId, NbrCorrect) VALUES (1, 5, 11); -- NG
*/
SELECT CONCAT(Lastname, ', ', Firstname) as 'Name', Description as 'Bootcamp', 
			Technology as 'Assessment', NbrCorrect, NbrQuestions, 
			CAST(((CAST(NbrCorrect as decimal) / CAST(NbrQuestions as decimal)) * 100) as int) as 'Score'
	from Students s
	Join AssessmentScores sc
		on s.Id = sc.StudentId
	join Assessments a
		on a.Id = sc.AssessmentId
	join Bootcamps b
		on b.Id = s.BootcampId
where s.id = 1;