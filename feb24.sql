create database newdata;
use newdata;

create table Dept(
DEPTNO int primary key,
DNAME varchar(50),
LOC char
);

RENAME TABLE Dept TO department;

ALTER TABLE department
ADD COLUMN PINCODE int not null default 0;


ALTER TABLE department
CHANGE DNAME DEPT_NAME varchar(50);

alter table department
modify LOC char(20);

drop table department;




