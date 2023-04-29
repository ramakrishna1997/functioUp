
----RECOMENDATION SYSTEM-------
with c1 as
(select a.product_id as p1,b.product_id as p2 from orders2 a
join orders2 b on a.order_id = b.order_id
where a.product_id != b.product_id and a.product_id <b.product_id)

select c.name,d.name,count(*) as freq
from c1
join products c on c1.p1 = c.id
join products d on c1.p2 = d.id
group by c.name,d.name 


-----AMAZON PRIME SUBSCRITION-----
SELECT
count(distinct u.user_id) as total_users,
count(distinct case when DATEDIFF(day,u.join_date,e.access_date) <=30 then u.user_id end),
1.0*count(distinct case when DATEDIFF(day,u.join_date,e.access_date) <=30 then u.user_id end)/count(distinct u.user_id)*100
from users2 u
left join events e on u.user_id=e.user_id and e.type='p'
where u.user_id in(select user_id from events where type ='music')