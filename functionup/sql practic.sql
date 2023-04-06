USE dev;

CREATE TABLE Employee
(
		EmpID int,
    	EmpFname VARCHAR(512),
    	EmpLname VARCHAR(512),
    	Department VARCHAR(512),
    	Project VARCHAR(512),
    	Address VARCHAR(512),
    	DOB VARCHAR(512),
        Gender varchar(512)
);

INSERT INTO Employee  VALUES ('1', 'Sanjay', 'Mehra', 'HR', 'P1', 'Hyderabad(HYD)', '01/12/1976', 'M');
INSERT INTO Employee  VALUES ('2', 'Ananya', 'Mishra', 'Admin', 'P2', 'Delhi(DEL)', '02/05/1968', 'F');
INSERT INTO Employee  VALUES ('3', 'Rohan', 'Diwan', 'Account', 'P3', 'Mumbai(BOM)', '01/01/1980', 'M');
INSERT INTO Employee  VALUES ('4', 'Sonia', 'Kulkarni', 'HR', 'P1', 'Hyderabad(HYD)', '02/05/1992', 'F');
INSERT INTO Employee  VALUES ('5', 'Ankit', 'Kapoor', 'Admin', 'P2', 'Delhi(DEL)', '03/07/1994', 'M');

SELECT * FROM Employee;
-- Write a query to fetch the number of employees working in the department ‘HR’
select count(*) from Employee
where Department='HR';
-- Q1. Write a query to fetch the EmpFname from the EmployeeInfo table in upper case and use the ALIAS name as EmpName
SELECT UPPER(EmpFname) as EmpName FROM Employee;
-- Q3. Write a query to retrieve the first four characters of EmpLname from the EmployeeInfo table
SELECT substr(EmpLname,2) FROM Employee;
-- Q4. Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table
SELECT SUBSTRING(Address, 1, CHARINDEX('(',Address)) FROM Employee;
-- Q7. Write a query to find the names of employees that begin with ‘S’
SELECT CONCAT(EmpFname,EmpLname) AS EmpName FROM Employee
WHERE EmpFname LIKE 'S%';

-- Q9. Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”
SELECT CONCAT(EmpFname,' ',EmpLname) AS FullName  FROM Employee;

-- Q10. Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender
SELECT Gender,count(DOB) FROM Employee
WHERE DOB BETWEEN '02/05/1970' AND '31/12/1975'
group by gender;

-- Q11. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order

SELECT * FROM Employee as e
ORDER BY e.EmpLname DESC,e.Department ASC;

-- Q12. Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets

SELECT EmpLname FROM Employee 
WHERE EmpLname LIKE '%A';

-- Q13. Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table

SELECT EmpFname FROM Employee 
WHERE EmpFname NOT IN ( 'Sanjay','Sonia');

-- Q14. Write a query to fetch details of employees with the address as “DELHI(DEL)”
SELECT * FROM Employee 
WHERE Address='Delhi(DEL)';

-- Q15. Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order

SELECT Department,Count(*) FROM Employee
GROUP BY  Department;

-- Q16. Write a query to calculate the even and odd records from a table

SELECT * FROM Employee 
WHERE EmpID%2=0;

SELECT * FROM Employee
WHERE EmpID%2<>0;
-- Q17. Write a query to retrieve duplicate records from a table

SELECT Department,Project,Address,count(*) From Employee
Group by Department,Project,Address
HAVING count(*)>1;

-- Q19. create a "NewEmpID" by taking first 2 letter of Department,EmpID,last 2 letter of EmpFname
Alter table Employee Add NewEmpID varchar(50) 
UPDATE Employee Set NewEmpID=CONCAT(SUBSTRING(DEPARTMENT,1,2),EmpId,substring(EmpFname,len(EmpFname)-1,len(empFname)))

