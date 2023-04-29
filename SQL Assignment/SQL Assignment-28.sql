CREATE DATABASE yash1;
USE yash1;

CREATE TABLE EmployeeDetails 
(
    EmpId	INT,
    FullName	VARCHAR(512),
    ManagerId	INT,
    DateOfJoining	VARCHAR(512),
    City	VARCHAR(512)
);

INSERT INTO EmployeeDetails (EmpId, FullName, ManagerId, DateOfJoining, City) VALUES ('121', 'John Snow', '321', '31-01-2019', 'Toronto');
INSERT INTO EmployeeDetails (EmpId, FullName, ManagerId, DateOfJoining, City) VALUES ('321', 'Walter White', '986', '30-01-2020', 'California');
INSERT INTO EmployeeDetails (EmpId, FullName, ManagerId, DateOfJoining, City) VALUES ('421', 'Kuldeep Rana', '876', '27/11/2021', 'New Delhi');

SELECT * FROM EmployeeDetails;

CREATE TABLE EmployeeSalary 
(
    EmpId	INT,
    Project	VARCHAR(512),
    Salary	INT,
    Variable	VARCHAR(512)
);

INSERT INTO EmployeeSalary (EmpId, Project, Salary, Variable) VALUES ('121', 'P1', '8000', '500');
INSERT INTO EmployeeSalary (EmpId, Project, Salary, Variable) VALUES ('321', 'P2', '10000', '1000');
INSERT INTO EmployeeSalary (EmpId, Project, Salary, Variable) VALUES ('421', 'P1', '12000', '0');

SELECT * FROM EmployeeSalary;
SELECT * FROM EmployeeDetails;
-- 1)SQL Query to fetch records that are present in one table but not in another table.
SELECT * FROM EmployeeDetails;
SELECT * FROM EmployeeSalary;
-- or
SELECT a.Empid,a.FullName,a.ManagerId,a.DateOfJoining , a.city,b.Project,b.Salary,b.Variable from EmployeeDetails a
LEFT JOIN EmployeeSalary b ON b.Empid=a.Empid;

-- 2)SQL query to fetch all the employees who are not working on any project.
SELECT * FROM EmployeeDetails
WHERE Empid NOT IN (SELECT  Empid From EmployeeSalary);

-- 3)SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.
SELECT * FROM EmployeeDetails;

SELECT * FROM EmployeeDetails
WHERE DateOfJoining="30-01-2020";

-- 4)Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.
SELECT a.Empid,a.FullName,b.Salary from EmployeeDetails a
LEFT JOIN EmployeeSalary b ON b.Empid=a.Empid;





















