# Answers to SQL assignments for EdDb

## Task #1

For this query, you must start by joining the `Class`, `MajorClassRel`, and `Major` tables. You can start the join with the `Class` or the `Major`. After joining all three tables, you need a `Where` clause to limit the output to only those rows where the major is **Accounting**.

```sql
select 	c.Id as 'Code',
		c.Subject as 'Class',
		c.Section
	from Major m
	join MajorClassRel mc
		on mc.MajorId = m.Id
	join Class c
		on c.Id = mc.ClassId
	where Description = 'Accounting'
```

Your result set should look like this (it does not need to look exactly like this):

    Code        Class       Section
    ----------- ----------- -------
    10101       English     101
    10102       English     102
    10103       English     103
    20201       Math        201
    20202       Math        202
    20203       Math        203
    30101       History     101

## Task #2

For this query, you'll need to group the data so you'll need to use the `Grouped By` clause. 

Start by selecting a simple list of all the classes and the instructors teaching those classes. Then group the data by the instructors last name. Once you group the data, you can use the `Count()` aggregate function in the column list. Remember that once you use the `Group By` clause, your column list can only have aggregate functions or columns listed in the `Group By` clause. Finally, sort the result on the aggregate `Count()` of classes in ascending order. Notice that if you alias the aggregate function `Count()`, you can use the alias name in the `Order By` clause.

```sql
SELECT i.lastname as 'Instructor', 
		count(*) as 'Classes' 
	from Instructor i
	join Class c 
		on i.Id = c.InstructorId
	Group By i.Lastname
	Order By Classes
```

Your result set should look like this (it does not need to look exactly like this):

    Instructor      Classes
    --------------- -----------
    Schell          2
    Bellman         3
    Brock           3
    Downey          3
    Hunt            3
    Jones           4
    Nagy            6

## Task #3

This query relies on a single value from Brian's `Student` row: his SAT. Once you have that, you can easily write a query that gets all the `Major` rows that have MinSat scores lower than Brian's SAT. Just like we did in class getting the average sales of all customers  to display customers with sales greater than that number, using a subquery make things very easy.

Start by creating a `SELECT` query that gets Brian's `Student` row by his last name. But you don't want all the columns, only the `SAT` column (this will be the subquery):

```sql
SELECT SAT From Student Where Lastname = 'Biggs'
```

This should return only a single value of 950. Above that query, write a query on the `Major` table displaying only the Description (which you could alias) and in the `Where` clause, insert the previous query in parentheses.    

```sql
SELECT *
	From Major m
	Where m.MinSAT <= ( -- subquery
		SELECT s.sat 
			From student s
			Where s.Lastname = 'Biggs'
	)
```

Your result set should look like this (it does not need to look exactly like this):

Id    Description           MinSAT
----- --------------------- -------
1     General Business      800
6     Education             900
7     General Studies       500