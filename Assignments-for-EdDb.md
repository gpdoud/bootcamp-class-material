# SQL assignments for EdDb

Here are three assignments in SQL for those that want to practice what they've learned so far. These are optional for all. The answers are provided in another file named Assignments-for-EdDb-Answers.md.

All of these use the EdDb database.

## Task #1

In the education database, there is the `Major` table and the `Class` table that we've already used for in lecture. There is another table named `MajorClassRel` that provides the many-to-many relationship between `Major` and `Class`. The reason for this table is to define the classes that are required for a particular major. For example, if a student was an English major, they'd likely need to take most if not all the English class for their major. So this `MajorClassRel` table answers the questions:

* What classes are required for a particular major? AND
* What majors require a partiular class?

_Your task is to create a query that displays all the classes required for the Accounting major._

## Task #2

The school does not want to overload any one instructor with teaching too many classes so when a class needs an instructor, the school looks at how many classes each instructor is already assigned to and tries to assign an instructor that has the fewest classes already assigned. 

This query will require grouping the data and using an aggregate function along with sorting the results. Which aggregate function displays the number of rows?

The output of the query should look something like this:

| LastName            | Classes Assigned |
| ------------------- | :--------------: |
| Washington          | 2                |
| Jefferson           | 4                |
| Lincoln             | 5                |

_Your task is to create a query that will display the list of instructor last names and how many classes they are already assigned to teach displaying those instructors assigned to the fewest classes shown first._

## Task #3

You are now a school councelor working with new students. Brian Biggs, a student that has taken one semester at the school but is undecided on a major has decided he wants to major in Accounting. Each of the schools majors has a minimum SAT required by students to be in that major. 

You'll need to query both the `Student` table for Brian's SAT score and query the `Major` table to get the MinSat values for majors that are **LOWER** than Brian's SAT.

**Hint: Using a subquery for this makes this query easier...**

_Your task is to write a query so that you can tell Brian if he can be an accounting major._

