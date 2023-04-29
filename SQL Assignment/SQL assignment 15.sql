use SAMPLE

--Spotify Case study

CREATE table activity
(
user_id varchar(20),
event_name varchar(20),
event_date date,
country varchar(20)
);


insert into activity values (1,'app-installed','2022-01-01','India')
,(1,'app-purchase','2022-01-02','India')
,(2,'app-installed','2022-01-01','USA')
,(3,'app-installed','2022-01-01','USA')
,(3,'app-purchase','2022-01-03','USA')
,(4,'app-installed','2022-01-03','India')
,(4,'app-purchase','2022-01-03','India')
,(5,'app-installed','2022-01-03','SL')
,(5,'app-purchase','2022-01-03','SL')
,(6,'app-installed','2022-01-04','Pakistan')
,(6,'app-purchase','2022-01-04','Pakistan');


SELECT * FROM activity

--Q1
--Find the total active users each day

SELECT event_date, COUNT(DISTINCT user_id)
FROM activity
GROUP BY event_date

--Q2
--Find total active users for each week/month
SELECT EXTRACT('month' FROM event_date) as month_num, COUNT(DISTINCT user_id)
FROM activity
GROUP BY EXTRACT('month' FROM event_date)

SELECT EXTRACT('week' FROM event_date) as month_num, COUNT(DISTINCT user_id)
FROM activity
GROUP BY EXTRACT('week' FROM event_date)

--Q3
--Date wise total number of users who made the purchase same day they installed the app

with c1 AS 
(SELECT user_id, event_date, CASE WHEN COUNT(event_name) =2 then user_id else null end as new_user
FROM activity
GROUP BY user_id, event_date
)
SELECT event_date, COUNT(new_user)
FROM c1
GROUP BY event_date


--Q4
--Percentage of paid users in India, USA and 'Other' for any other country
--India - 40
--USA - 20
--Other - 40

with c1 AS(
SELECT CASE WHEN country IN ('India', 'USA') then country else 'Others' end as country1, 
COUNT(DISTINCT user_id) AS cnt_user
FROM activity
WHERE event_name = 'app-purchase'
group by CASE WHEN country IN ('India', 'USA') then country else 'Others' end
)
, cnt_total as (
SELECT SUM(cnt_user) as total_count FROM c1)

SELECT country1, 100*(cnt_user/total_count) as paid_user_perc
FROM c1, cnt_total


--Q5
--Among all users who have installed the app on a given day, find how many of them purchased on the very next day
--01/01 - 0
--01/02 - 1
--01/03 - 0
--01/04 - 0
--01/05 - 0
--01/06 - 0

--Date level output

with ctes as 
(SELECT *
,LAG(event_name,1) over(partition by user_id order by event_date) as pre_event_name
,LAG(event_date,1) over(partition by user_id order by event_date) as pre_event_date
from activity)
select event_date,count(distinct user_id) from 
ctes
where event_name='app-installed' and pre_event_name='app-installed'  and DATEDIFF(day,pre_event_date,event_date)=1
group by event_date
-----
with ctes as(SELECT *
,LAG(event_name,1) over(partition by user_id order by event_date) as pre_event_name
,LAG(event_date,1) over(partition by user_id order by event_date) as pre_event_date
from activity)
select * from ctes
where event_name='app-installed' and pre_event_name='app-installed'  and DATEDIFF(day,pre_event_date,event_date)=1

-----ANOTHER METHOD
SELECT a.event_date, COUNT(DISTINCT a.user_id) AS next_day_purchase_count
FROM activity a
JOIN (
  SELECT user_id, event_date
  FROM activity
  WHERE event_name = 'app-installed'
) i ON a.user_id = i.user_id AND a.event_date = DATEADD(DAY, 1, i.event_date)
WHERE a.event_name = 'app-purchase'
GROUP BY a.event_date;