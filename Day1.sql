create database testDB;

create table Students (
    StudentID int PRIMARY KEY,
    FirstName varchar(50),
    LastName varchar(50),
    Birthdate DATE,
    Gender char(1),
    GPA	float(7, 2)
    );

create table Courses(
    CourseID   int PRIMARY KEY,
    CourseName varchar(50),
    Instructor varchar(50),
    Department varchar(100)
);


create table Enrollment(
    EnrollmentID   int PRIMARY KEY,
    StudentID      int,
    CourseID       int,
    EnrollmentDate Date
);


alter table Students drop PRIMARY key (StudentID);
alter table Courses drop PRIMARY key (CourseID);
alter table Enrollment drop PRIMARY key (EnrollmentID);

alter table Courses add PRIMARY key (StudentID);
alter table Courses add PRIMARY key (CourseID);
alter table Enrollment ADD PRIMARY key (EnrollmentID);

CREATE INDEX StudentIDX ON Enrollment(StudentID);
CREATE INDEX CourseIDX ON Enrollment(CourseID);

insert into Students(StudentID, FirstName, LastName, Birthdate, Gender, GPA) VALUES (1, '가', '가나', '2005-05-15', 'M', 3.75);
insert into Students(StudentID, FirstName, LastName, Birthdate, Gender, GPA) VALUES (2, '나', '다라', '1999-05-21', 'F', 3.9);
insert into Students(StudentID, FirstName, LastName, Birthdate, Gender, GPA) VALUES (3, '다', '마바', '2001-02-10', 'M', 3.2);
insert into Students(StudentID, FirstName, LastName, Birthdate, Gender, GPA) VALUES (4, '라', '사아', '2000-11-30', 'F', 3.6);
insert into Students(StudentID, FirstName, LastName, Birthdate, Gender, GPA) VALUES (5, '마', '자차', '2002-07-18', 'M', 3.45);

# 1. 학점이 높은 순서대로 학생들의 이름을 조회
select FirstName, LastName from Students order by GPA DESC;

# 2. 학생들의 평균 학점을 조회
select AVG(GPA) from Students;

# 3. 학점이 가장 은 학생의 이름을 조회
select FirstName, LastName from Students order	by GPA limit 1;