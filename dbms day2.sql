create database company;
use company;

create table employee (
id int auto_increment primary key,
FirstName varchar(20),
LastName varchar(20),
Gender char(1),
DateOfBirth date,
designation varchar(20),
DepartmentName varchar(20),
Managerid int,
JoinedDate date,
Salary int
);

select * from employee;

insert into employee (FirstName,LastName,Gender,DateOfBirth,designation,DepartmentName,Managerid,JoinedDate,Salary)
values
('Swodesh','Singh','M','2009-03-03','CEO','Headquaters', 0,'2000-01-01',1000000),
('Ram','Yadav','M','1999-07-23','employee','software management', 001,'2008-11-21',20000),
('Adarsha','Chaulagai','M','1988-03-03','manager','software management', 00,'2000-01-01',1000);

update employee 
set Gender = 'F' 
where id = 2;






