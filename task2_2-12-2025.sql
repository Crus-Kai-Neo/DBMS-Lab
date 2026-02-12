-- Create tables
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);



-- Insert data into employees
INSERT INTO employees VALUES
(1, 'Swodesh Singh', 1),
(2, 'Adarsha chaulagai', 2),
(3, 'Himal Adhikari', 2),
(4, 'Himal pahad', 3),
(5, 'Sita Rai', NULL);

-- Insert data into departments
INSERT INTO departments VALUES
(1, 'Sales'),
(2, 'Engineering'),
(3, 'Human Resources'),
(4, 'Customer Service'),
(5, 'Research And Development');

-- Join both tables (show all employees)
SELECT 
    employees.employee_id,
    employees.employee_name,
    departments.department_name
FROM employees
LEFT JOIN departments
ON employees.department_id = departments.department_id; 