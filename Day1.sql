create database testDB;

create table Students
(
    StudentID int PRIMARY KEY,
    FirstName varchar(50),
    LastName  varchar(50),
    Birthdate DATE,
    Gender    char(1),
    GPA       float(7, 2)
);


create table Courses
(
    CourseID   int PRIMARY KEY,
    CourseName varchar(50),
    Instructor varchar(50),
    Department varchar(100)
);


create table Enrollments
(
    EnrollmentID   int,
    StudentID      int,
    CourseID       int,
    EnrollmentDate Date
);


alter table Students drop PRIMARY key (StudentID);
alter table Courses drop PRIMARY key (CourseID);
alter table Enrollments drop PRIMARY key (EnrollmentID);

alter table Courses add PRIMARY key (StudentID);
alter table Courses add PRIMARY key (CourseID);
alter table Enrollments ADD PRIMARY key (EnrollmentID);

CREATE INDEX StudentIDX ON Enrollments(StudentID);
CREATE INDEX CourseIDX ON Enrollments(CourseID);

insert into Students(StudentID, FirstName, LastName, Birthdate, Gender, GPA) VALUES (1, '가', '가나', '2005-05-15', 'M', 3.75);
insert into Students(StudentID, FirstName, LastName, Birthdate, Gender, GPA) VALUES (2, '가', '다라', '1999-05-21', 'F', 3.9);
insert into Students(StudentID, FirstName, LastName, Birthdate, Gender, GPA) VALUES (3, '나', '마바', '2001-02-10', 'M', 3.2);
insert into Students(StudentID, FirstName, LastName, Birthdate, Gender, GPA) VALUES (4, '나', '사아', '2000-11-30', 'F', 3.6);
insert into Students(StudentID, FirstName, LastName, Birthdate, Gender, GPA) VALUES (5, '나', '자차', '2002-07-18', 'M', 3.45);

# 1. 학점이 높은 순서대로 학생들의 이름을 조회
select FirstName, LastName from Students order by GPA DESC;

# 2. 학생들의 평균 학점을 조회
select AVG(GPA) from Students;

# 3. 학점이 가장 은 학생의 이름을 조회
select FirstName, LastName from Students order by GPA limit 1;

# 4. Gender별 평균 학점을 조회
select Gender, avg(GPA) from Students group by Gender;

# 1. FirstName 별 가장 늦은 생일
select FirstName, max(Birthdate) from Students group by FirstName;

# 2. FirstName, Gender 별 학점 평균
select Gender, FirstName, avg(GPA) from Students group by FirstName, Gender;

insert into Courses(CourseID, CourseName, Instructor, Department)
VALUES
    (101, 'JAVA', '김상현', 'Mathematics'),
    (102, 'Python', '깨중', 'Arts'),
    (103, 'DADABASE', '다운', 'Computer Sci');

INSERT INTO Enrollments(EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES (1, 1, 101, '2023-01-15'),
       (2, 2, 102, '2023-02-10'),
       (3, 3, 101, '2023-03-05'),
       (4, 4, 103, '2023-04-22'),
       (5, 5, 102, '2023-05-10'),
       (5, 5, 101, '2023-05-10');


# JOIN
select
    CourseName, FirstName, LastName, EnrollmentDate
from
    Students
        join Enrollments on Students.StudentID = Enrollments.StudentID
        join Courses on Enrollments.CourseID = Courses.CourseID

# 1. 각 강의 이름별 수강 학생 수 조회
select CourseName, COUNT(Enrollments.StudentID)
from
    Students
        join Enrollments on Students.StudentID = Enrollments.StudentID
        join Courses on Enrollments.CourseID = Courses.CourseID
GROUP by
    CourseName;

# 2.각 강의 이름별 최고 학점 조회
select CourseName, max(Students.GPA)
from
    Students
        join Enrollments on Students.StudentID = Enrollments.StudentID
        join Courses on Enrollments.CourseID = Courses.CourseID
GROUP by
    CourseName;

# 3. 학생 이름별 수강 과목 수 조회
select FirstName, LastName, CourseName
from
    Students
        join Enrollments on Students.StudentID = Enrollments.StudentID
        join Courses on Enrollments.CourseID = Courses.CourseID
GROUP by
    FirstName, LastName;