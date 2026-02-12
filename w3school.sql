create database school;
use school;

create table teachers (
teacherID int primary key,
first_name varchar(50),
last_name varchar(50),
DOB date,
salary real,
address varchar(50),
phone_no bigint
);

create table students (
studentID int primary key,
first_name varchar(50),
last_name varchar(50),
DOB date,
address varchar(50),
phone_no bigint,
section char,
levels int
);

insert into teachers (
teacherID,
first_name,
last_name,
DOB,
salary,
address,
phone_no 
)
values (
2,'Suryash','Rai','2004-08-16', 60000.69,'Koteshwor', 748950934353
);



insert into students (
studentID,
first_name,
last_name,
DOB,
address,
phone_no,
section,
levels
)
values (
2,'Samar','Shakya','2003-11-22','Sundhara', 7495762375, 'A', 17
);


SELECT first_name, last_name
FROM students
WHERE levels = 17;

SELECT 
    teachers.first_name,
    teachers.last_name,
    students.first_name,
    students.last_name
FROM teachers
INNER JOIN students
ON teachers.teacherID = students.studentID;




