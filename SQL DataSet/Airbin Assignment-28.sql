use ruby;
select * from airbin;

-- 1)Top neighbourhoods in NYC with respect to average price/day of Airbnb listings
SELECT neighbourhood , AVG(price) as average  FROM airbin
GROUP BY neighbourhood
ORDER BY average desc
LIMIT 10;
-- 2)RoomType Vs price on different neighbourhood_group?
SELECT neighbourhood_group,room_type,AVG(price) as Average FROM airbin
GROUP BY neighbourhood_group,room_type
ORDER BY Average DESC
LIMIT 0,1000;
-- 3) On an average for how many nights people stayed in each room_types
SELECT * FROM airbin;

SELECT host_name,room_type ,Avg(minimum_nights) as nights FROM airbin
GROUP BY host_name,room_type
ORDER BY nights DESC
LIMIT 1000;

-- 4) How monthly reviews varies with room_types in each neighbourhood groups?
SELECT neighbourhood room_type, AVG(reviews_per_month) AS avg_monthly_reviews
FROM airbin
WHERE reviews_per_month > 0
GROUP BY neighbourhood,room_type;

-- 5)Top 10 reviewed hosts on the basis of review/month

SELECT host_name,reviews_per_month from airbin
GROUP BY host_name,reviews_per_month
order by reviews_per_month desc
LIMIT 10;

-- 6) Room_types and their relation with available in different neighbourhood groups
SELECT * FROM airbin;

SELECT room_type,neighbourhood_group,count(availability_365) as availability from airbin
GROUP BY room_type,neighbourhood_group
ORDER BY availability DESC;

-- 7) Explore relationships between the location and neighbourhood group 

SELECT host_name,neighbourhood_group,latitude,longitude FROM airbin
GROUP BY neighbourhood_group,latitude,longitude,host_name


