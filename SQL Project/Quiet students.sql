use py;
create table students
(
student_id int,
student_name varchar(20)
);
insert into students values
(1,'Daniel'),(2,'Jade'),(3,'Stella'),(4,'Jonathan'),(5,'Will');

create table exams
(
exam_id int,
student_id int,
score int);

insert into exams values
(10,1,70),(10,2,80),(10,3,90),(20,1,80),(30,1,70),(30,3,80),(30,4,90),(40,1,60)
,(40,2,70),(40,4,80);

--Find the Student_id and Student_name of "Quiet" Students in All Exams
--A quite student is the one who took atlease one exam and scored neither the heighest, nor the lowest in any exam
--Don't return students who didn't take any exam
--Return the final answer ordered by Student_id

--10, 2
--20,NULL
--30 , 3
--40 - 2

SELECT * FROM students
SELECT * FROM exams

--MIN & MAX
with c1 AS
(SELECT exam_id, MAX(score), MIN(score)
FROM exams
GROUP BY exam_id),

c2 AS
(SELECT a.*, max, min, 
case when score = min OR score = max THEN 1 else 0 end as flg
FROM exams a INNER JOIN c1 ON a.exam_id = c1.exam_id),

c3 AS
(SELECT student_id, SUM(flg)
FROM c2
GROUP BY student_id
HAVING sum(flg)=0)

SELECT c3.Student_id, b.student_name
FROM c3 INNER JOIN students b ON c3.student_id = b.student_id

--Solution with window function

with c1 AS
(SELECT *, MAX(score) OVER (partition by exam_id) AS max_score, Min(score) OVER (partition by exam_id) AS min_score
FROM exams),

c2 AS
(SELECT *, case when score IN (min_score, max_score) then 1 else 0 end AS flag
FROM c1)

SELECT c2.student_id, student_name
FROM c2 INNER JOIN students b ON c2.student_id = b.student_id
GROUP BY c2.student_id, student_name
HAVING SUM(flag)=0




















