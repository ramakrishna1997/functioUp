use hicouselor;
CREATE TABLE Employee2 
(
    EmpID	VARCHAR(512),
    EmpPosition	VARCHAR(512),
    DateOfJoining	VARCHAR(512),
    Salary	INT
);

INSERT INTO Employee2 (EmpID, EmpPosition, DateOfJoining, Salary) VALUES ('1', 'Manager', '01/05/2022', '500000');
INSERT INTO Employee2 (EmpID, EmpPosition, DateOfJoining, Salary) VALUES ('2', 'Executive', '02/05/2022', '75000');
INSERT INTO Employee2 (EmpID, EmpPosition, DateOfJoining, Salary) VALUES ('3', 'Manager', '01/05/2022', '90000');
INSERT INTO Employee2 (EmpID, EmpPosition, DateOfJoining, Salary) VALUES ('2', 'Lead', '02/05/2022', '85000');
INSERT INTO Employee2 (EmpID, EmpPosition, DateOfJoining, Salary) VALUES ('1', 'Executive', '01/05/2022', '300000');

select * from Employee2;

-- Q6. Write a query to find all the employees whose salary is between 50000 to 100000
SELECT COUNT(*) FROM Employee2 
where Salary between 50000 AND 100000;
-- Q8. Write a query to fetch top 3 Salary from EmployeePosition Table (by using limit)
SELECT SALARY FROM Employee2
ORDER BY SALARY DESC LIMIT 3;

SELECT MAX(Salary) From Employee2
LIMIT 3;

SELECT * FROM EMPLOYEE2
WHERE SALARY=(SELECT MAX(SALARY) FROM EMPLOYEE2);

select *from employee 
group by salary 
order by  salary desc limit 1,1;
-- Q20. Write a query to retrieve EmpPostion along with total salaries paid for each of them
SELECT EmPosition FROM Employee2
