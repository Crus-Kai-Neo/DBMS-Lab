CREATE DATABASE BankDB;
USE BankDB;

-- Accounts table
CREATE TABLE accounts(
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(100),
    balance DECIMAL(10,2)
);

INSERT INTO accounts VALUES
(1, 'Ram', 50000),
(2, 'Shyam', 30000),
(3, 'Sita', 20000);

SELECT * FROM accounts;

-- Transaction: Transfer 5000
START TRANSACTION;
UPDATE accounts SET balance = balance - 5000 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 5000 WHERE account_id = 2;
COMMIT;

-- Transaction with rollback
START TRANSACTION;
UPDATE accounts SET balance = balance - 10000 WHERE account_id = 2;
UPDATE accounts SET balance = balance + 10000 WHERE account_id = 3;
ROLLBACK;

-- Savepoint example
START TRANSACTION;
UPDATE accounts SET balance = balance - 3000 WHERE account_id = 1;
SAVEPOINT sp1;
UPDATE accounts SET balance = balance + 3000 WHERE account_id = 2;
SAVEPOINT sp2;
ROLLBACK TO sp1;
COMMIT;

-- Employees table (FIXED NAME)
CREATE TABLE employees(
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2)
);

-- Salary log (AUTO_INCREMENT FIX)
CREATE TABLE salary_log(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM salary_log;

-- Trigger: Check salary
DELIMITER $$

CREATE TRIGGER check_salary
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary < 10000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary must be atleast 10000';
    END IF;
END$$

DELIMITER ;

-- Trigger: Log salary update
DELIMITER $$

CREATE TRIGGER log_salary_update 
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO salary_log(emp_id, old_salary, new_salary)
        VALUES (OLD.emp_id, OLD.salary, NEW.salary);
    END IF;
END$$

DELIMITER ;

-- Procedure: Get employees
DELIMITER $$

CREATE PROCEDURE getEmployees()
BEGIN
    SELECT * FROM employees;
END$$

DELIMITER ;

CALL getEmployees();

-- Procedure: Add employee
DELIMITER $$

CREATE PROCEDURE addEmployee(
    IN p_id INT, 
    IN p_name VARCHAR(100), 
    IN p_salary DECIMAL(10,2)
)
BEGIN
    INSERT INTO employees VALUES (p_id, p_name, p_salary);
END$$

DELIMITER ;

SELECT * FROM employees;


# create a stored procedure that updates the salary of an employee based on employee id

delimiter $$
create procedure updateSalary(in p_id int, in new_salary decimal(10,2))
begin 
update employees
set salary = new_salary
where emp_id = p_id;
end
$$
delimiter ;

call updateSalary(2,20000.67);

# create a stored procedure that transfers money between two accounts using transaction

delimiter $$
create procedure transferMoney(in from_account int, in to_account int, in amount decimal(10,2))
begin 
start transaction;
update accounts
set balance = balance - amount
where account_id = from_account;
update accounts
set balance = balance + amount
where account_id = to_account;
commit;
end
$$
delimiter ;

call TransferMoney(1,2,23000);