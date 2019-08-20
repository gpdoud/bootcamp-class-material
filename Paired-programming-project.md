# Pair Programming Project

## The Teams

    Alex, Briana, Marianne
    Brailee, Jesse
    Glenn, Titus
    
## The process

Paired programming combines two developers on a single machine. One programmer is the coder and the other is the tester. They work together on a project. The process starts with the tester proposing a test case that will be needed when the code is written. The test case is added to the project. Next, the coder writes the code such that the test case passes. That process of creating a test case then writing the code that satisfies the test case continues for 10 minutes at which time the two programmers switch roles then the process continues.

## The Project - The Calculator

The project is to create a calculator using a library project. The calculator provides only these functions:

    int add(int total, int amount)
    int subtract(int total, int amount)
    int multiply(int total, int amount)
    int divide(int total, int amount)
    void clear()

These commands will be enter using a console application that uses the library. A session might look like this:

    > clear
    < total 0
    > add 5
    < total 5
    > subtract 2
    < total 3
    > multiply 4
    < total 12
    > divide 2
    < total 6
    > clear
    < total 0
    > end


You'll be using the Console class to write out the information.

## Testing

1. clear, add 7, multiply 5, add 5, divide 8 == 40
2. clear, add -9, subtract 11, divide -2, multiple -10 == -100
3. clear, divide 0 == (Exception!)