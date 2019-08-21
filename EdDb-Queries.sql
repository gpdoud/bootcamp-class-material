
-- Classes taken by a Student
INSERT StudentClassRel (StudentId,ClassId,ClassGradeValue) VALUES (100,10101,'A+');
go

select m.Description as 'Major', m.MinSAT as 'SAT', c.Subject as 'Subject', c.Section as 'Section'
	from Major m 
	join MajorClassRel mc  
		on mc.MajorId = m.Id 
	join class c
		on c.Id = mc.ClassId
	where m.Description in ('General Business','Math');

-- Classes remaining for a Student of a Major
select concat(s.Firstname,' ',s.Lastname) as 'Name', concat(c.Subject, ' ',c.Section) as 'Class'
	from Student s
	join Major m
		on s.MajorId = m.Id
	join MajorClassRel mc
		on m.Id = mc.MajorId
	join class c
		on c.Id = mc.ClassId
where c.Id not in (
			select c.Id
				from Student s
				join StudentClassRel sc
					on s.Id = sc.StudentId
				join class c
					on c.Id = sc.ClassId
		);

select concat(s.Firstname,' ',s.Lastname) as 'Name', c.Subject as 'Class'
	, i.Lastname as 'Instructor', cg.Grade as 'Grade', cg.GPA as 'GPA Value'
	from Student s
	join StudentClassRel sc
		on s.Id = sc.StudentId
	join class c 
		on c.Id = sc.ClassId
	join ClassGrade cg 
		on sc.ClassGradeValue = cg.Grade
	join Instructor i
		on i.Id = c.InstructorId
where s.Id = 100;

select concat(s.Firstname,' ',s.Lastname) as 'Name', concat(c.Subject,' ',c.Section) as 'Class'
		,  i.Lastname as 'Instructor'
	from Student s 
	join StudentClassRel sc 
		on s.Id = sc.StudentId
	join class c 
		on c.Id = sc.ClassId
	left join Instructor i 
		on i.Id = c.InstructorId;