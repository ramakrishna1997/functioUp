USE Py;

CREATE TABLE empl(
 emp_id int NULL,
 emp_name varchar(50) NULL,
 salary int NULL,
 manager_id int NULL,
 emp_age int NULL,
 dep_id int NULL,
 dep_name varchar(20) NULL,
 gender varchar(10) NULL
) ;
insert into empl values(1,'Ankit',14300,4,39,100,'Analytics','Female');
insert into empl values(2,'Mohit',14000,5,48,200,'IT','Male');
insert into empl values(3,'Vikas',12100,4,37,100,'Analytics','Female');
insert into empl values(4,'Rohit',7260,2,16,100,'Analytics','Female');
insert into empl values(5,'Mudit',15000,6,55,200,'IT','Male');
insert into empl values(6,'Agam',15600,2,14,200,'IT','Male');
insert into empl values(7,'Sanjay',12000,2,13,200,'IT','Male');
insert into empl values(8,'Ashish',7200,2,12,200,'IT','Male');
insert into empl values(9,'Mukesh',7000,6,51,300,'HR','Male');
insert into empl values(10,'Rakesh',8000,6,50,300,'HR','Male');
insert into empl values(11,'Akhil',4000,1,31,500,'Ops','Male');

DROP TABLE empl;

SELECT * FROM empl;

-- --Write a sql query to find the details of employee with 3rd highest salary in each dept
-- --If there are less than 3 employees in a dept, return the details of emp with the lowest salary
-- You can't make multiple CTEs and do union
SELECT ABC.EMP_NAME, ABC.SALARY, ABC.DEP_NAME FROM 
	(WITH CT AS 
			(SELECT EMP_NAME, SALARY,DEP_NAME, dense_rank() OVER (partition by DEP_NAME ORDER BY SALARY DESC)AS RANKING  FROM EMPL)

						SELECT *, MAX(RANKING) OVER (partition by DEP_NAME) AS DIM FROM CT WHERE RANKING between 1 AND 3 ) ABC WHERE RANKING = DIM;






