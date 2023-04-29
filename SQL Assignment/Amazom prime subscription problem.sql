USE func;
create table users2
(
user_id integer,
name varchar(20),
join_date date
);
INSERT INTO users2 VALUES (1, 'Jon', CAST('2020-02-14' AS date));
INSERT INTO users2 VALUES (2, 'Jane', CAST('2020-02-14' AS date));
INSERT INTO users2 VALUES (3, 'Jill', CAST('2020-02-15' AS date));
INSERT INTO users2 VALUES (4, 'Josh', CAST('2020-02-15' AS date));
INSERT INTO users2 VALUES (5, 'Jean', CAST('2020-02-16' AS date));
INSERT INTO users2 VALUES (6, 'Justin', CAST('2020-02-17' AS date));
INSERT INTO users2 VALUES (7, 'Jeremy', CAST('2020-02-18' AS date));

create table events
(
user_id integer,
type varchar(10),
access_date date
);
truncate events;
INSERT INTO events values(1, 'Pay', CAST('2020-03-01' AS date)); 
INSERT INTO events values(2, 'Music', CAST('2020-03-02' AS date)); 
INSERT INTO events values(2, 'P', CAST('2020-03-12' AS date));
INSERT INTO events values(3, 'Music', CAST('2020-03-15' AS date));
INSERT INTO events values(4, 'Music', CAST('2020-03-15' AS date));
INSERT INTO events values(1, 'P', CAST('2020-03-16' AS date)); 
INSERT INTO events values(3, 'P', CAST('2020-03-22' AS date));

SELECT * FROM users2;
SELECT * FROM events;
-- q1
SELECT o.name,p.type,p.access_date FROM users2 o
INNER JOIN events p ON p.user_id=o.user_id
where p.access_date='2020-03-01'
GROUP BY o.name,p.type,p.access_date
