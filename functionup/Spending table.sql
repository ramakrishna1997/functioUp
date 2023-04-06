USE py;
create table spending 
(
user_id int,
spend_date date,
platform varchar(10),
amount int
);

insert into spending values(1,'2019-07-01','mobile',100),(1,'2019-07-01','desktop',100),(2,'2019-07-01','mobile',100)
,(2,'2019-07-02','mobile',100),(3,'2019-07-01','desktop',100),(3,'2019-07-02','desktop',100);

/* User purchase platform
-- The table logs the spendings history of users that make purchases from an online shopping 
website which has a desktop and a mobile application.
-- Write an SQL query to find the total number of users and the total amount spent using mobile only, desktop only 
and both mobile and desktop together for each date.
*/

--Categories - Mobile - 2, Desktop - 3, Both - 1
--Final table for Output
--Date, platform, Sum(amount), User Count
--07-01-2019 - Mobile - 100 -1
--07-01-2019 - Desktop - 100 -1
--07-01-2019 - Both - 200 -1
--07-02-2019 - Mobile - 100 -1
--07-02-2019 - Desktop - 100 -1
--07-02-2019 - Both - 0 -0

SELECT * FROM spending

with c1 AS
(SELECT spend_date, user_id, MAX(platform) AS pltfrm, SUM(amount) AS total_amt
FROM spending
GROUP BY spend_date, user_id 
HAVING COUNT(DISTINCT platform)=1
 
UNION ALL 
 
SELECT spend_date, user_id,'BOTH' AS pltfrm , SUM(amount) AS total_amt
FROM spending
GROUP BY spend_date, user_id 
HAVING COUNT(DISTINCT platform)=2
 
UNION ALL
 
SELECT DISTINCT spend_date, NULL as user_id, 'BOTH' as pltfrm, 0 as amount
FROM spending
)

SELECT spend_date, pltfrm, SUM(total_amt), COUNT(user_id)
FROM c1
GROUP BY spend_date, pltfrm











