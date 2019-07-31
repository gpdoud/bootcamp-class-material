# Assignment - Generic Collections

The assignment is to use the following collection of students and display 
the name of the student that has the highest GPA.

```CS
// Student Class
public class Student {
    public string Name { get; set; }
    public decimal GPA { get; set; }
}
```

This is the `Student` class. You can create a new class in VS.NET with the
name and copy the properties into it or you can just copy the above entire
class into the Program.cs within the namespace but outside the class Program.

```cs
// student collection
var students = new List<Student> {
    new Student { Name = "Abby",    GPA = 4.22 },
    new Student { Name = "Bobby",   GPA = 2.98 },
    new Student { Name = "Cory",    GPA = 2.80 },
    new Student { Name = "Davey",   GPA = 4.42 },
    new Student { Name = "Eddy",    GPA = 4.15 },
    new Student { Name = "Fanny",   GPA = 3.73 },
    new Student { Name = "Georgie", GPA = 1.24 },
    new Student { Name = "Harry",   GPA = 3.59 },
    new Student { Name = "Izzy",    GPA = 2.38 },
    new Student { Name = "Jimmy",   GPA = 4.93 }
};
```

The above is a generic List of the students with the names and GPA numbers
already filled in. It is ready to be pasted into any class that you want.

## How to proceed

In order to find the highest GPA, you'll need to create a decimal variable. The 
variables will hold the highest GPA found so far. You should also create a variable 
of type `Student` which will hold the actual student instance that has the highest 
GPA so far.

Start by setting this highest GPA variable to zero. As you read each student, you
need to check whether the current student's GPA is higher than the variable
holding the highest GPA.  If the student your reading has a higher GPA, you should
copy their GPA to the highest GPA variable and copy the instance of the student to
the variable holding the instance of the student with the highest GPA. Once all 
the students have been read, whichever one is saved in the student variable should
have the highest GPA. Just write the name and GPA to the console.

Here is the logic in pseudo-code (English like code)

```
- Create a decimal variable and set to zero
- Create a Student variable and set to null
- Loop thru the students collection
    - if current student's GPA is greater than the decimal variable
          then copy student's GPA to decimal variable
          and copy current student instance to Student variable
- When loop is done the Student variable contains the student with
    the highest GPA
- Write the name and GPA to the console
```

If you have any issues, send me a Slack message.

-Greg