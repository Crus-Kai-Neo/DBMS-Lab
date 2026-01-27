update employee 
set Gender ='F'
where EmployeeID ='0009';

select Firstname, curdate() as CurrentDate,
DateofBirth,

timestampdiff(year, DateofBirth, CURDATE()) as Age
from Employee where 
timestampdiff(YEAR, DateofBirth,CURDATE())
>25;

select * from employee 
where 
DateofBirth  = (select MAX(DateofBirth)
from employee);



select * from employee
where
salary = (select max(salary) from employee);


select DepartmentName, max(Salary) as MaxSALARY
from Employee Group by DepartmentName;

#9 list the employee who act as manager.

select * from employee
where 