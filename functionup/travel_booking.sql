USE Py;
CREATE TABLE booking_table(
   Booking_id       VARCHAR(3) NOT NULL 
  ,Booking_date     date NOT NULL
  ,User_id          VARCHAR(2) NOT NULL
  ,Line_of_business VARCHAR(6) NOT NULL
);
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b1','2022-03-23','u1','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b2','2022-03-27','u2','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b3','2022-03-28','u1','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b4','2022-03-31','u4','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b5','2022-04-02','u1','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b6','2022-04-02','u2','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b7','2022-04-06','u5','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b8','2022-04-06','u6','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b9','2022-04-06','u2','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b10','2022-04-10','u1','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b11','2022-04-12','u4','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b12','2022-04-16','u1','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b13','2022-04-19','u2','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b14','2022-04-20','u5','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b15','2022-04-22','u6','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b16','2022-04-26','u4','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b17','2022-04-28','u2','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b18','2022-04-30','u1','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b19','2022-05-04','u4','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b20','2022-05-06','u1','Flight');
;
CREATE TABLE user_table(
   User_id VARCHAR(3) NOT NULL
  ,Segment VARCHAR(2) NOT NULL
);
INSERT INTO user_table(User_id,Segment) VALUES ('u1','s1');
INSERT INTO user_table(User_id,Segment) VALUES ('u2','s1');
INSERT INTO user_table(User_id,Segment) VALUES ('u3','s1');
INSERT INTO user_table(User_id,Segment) VALUES ('u4','s2');
INSERT INTO user_table(User_id,Segment) VALUES ('u5','s2');
INSERT INTO user_table(User_id,Segment) VALUES ('u6','s3');
INSERT INTO user_table(User_id,Segment) VALUES ('u7','s3');
INSERT INTO user_table(User_id,Segment) VALUES ('u8','s3');
INSERT INTO user_table(User_id,Segment) VALUES ('u9','s3');
INSERT INTO user_table(User_id,Segment) VALUES ('u10','s3');

SELECT * FROM booking_table;

SELECT * FROM user_table

--Return a table which has user sement, total user count, users who booked flights in April 2022
--user Segment, #users, #users who booked flight in Apr 2022

SELECT a.segment, COUNT( DISTINCT a.user_id) AS Total_user_count, 
COUNT (DISTINCT case when b.line_of_business = 'Flight' AND booking_date BETWEEN '2022-04-01' AND '2022-04-30' then b.user_id end) AS user_flight_april
FROM user_table a LEFT JOIN booking_table b ON a.user_id = b.user_id
GROUP BY a.segment


--Alternate solution
with c1 AS
(SELECT a.segment, COUNT( DISTINCT a.user_id) AS Total_user_count
FROM user_table a
GROUP BY a.segment),
c2 AS
(
	SELECT a.segment, COUNT(DISTINCT a.user_id) AS user_april_flight
	FROM user_table a LEFT JOIN booking_table b ON a.user_id = b.user_id
	WHERE line_of_business = 'Flight' 
	AND booking_date BETWEEN '2022-04-01' AND '2022-04-30'
	GROUP BY a.segment
)
SELECT c1.segment, c1.Total_user_count, c2.user_april_flight
FROM c1 INNER JOIN c2 ON c1.segment = c2.segment

--Write a query to find users whose first booking is a hotel booking

SELECT DISTINCT user_id
FROM (SELECT *, DENSE_RANK() OVER (PARTITION BY user_id ORDER BY booking_date) AS rnk
FROM booking_table) a
WHERE rnk=1 AND line_of_business = 'Hotel'

--Alternative soln

--First booking
WITH c1 AS
(SELECT user_id,  MIN(booking_date) AS first_booking
FROM booking_table
GROUP BY user_id)
, c2 AS
(SELECT a.user_id, line_of_business, booking_date , CASE WHEN booking_date = first_booking then 1 end AS first_booking_flag
FROM booking_table a INNER JOIN c1 ON a.user_id=c1.user_id)

SELECT user_id FROM c2
WHERE line_of_business = 'Hotel' AND first_booking_flag = 1

--Write a query to find the no. of days between first an last order for all users

SELECT user_id, MIN(booking_date) AS first_order_date, MAX(booking_date) AS last_order_date, 
MAX(booking_date) :: timestamp - MIN(booking_date) :: timestamp AS days_difference
FROM booking_table
GROUP BY user_id

SELECT user_id, MIN(booking_date) AS first_order_date, MAX(booking_date) AS last_order_date, 
DATEDIFF(MIN(booking_date), MAX(booking_date)) AS days_difference
FROM booking_table
GROUP BY user_id

--DATEDIFF(unit, start_date, end_date)

--Write a query to count the number of flight and hotel bookings in each of the user segment for the year 2022
--Segment, #hotel_bookings, #flight_bookings

SELECT b.segment, COUNT(case when line_of_business = 'Hotel' then a.user_id end) AS hotel_count,
COUNT(case when line_of_business = 'Flight' then a.user_id end) AS flight_count
FROM booking_table a INNER JOIN user_table b ON a.user_id = b.user_id
WHERE EXTRACT(year FROM booking_date) = '2022'
GROUP BY b.segment


-- --Use the output from the query above(c1) to generate the final output for this question


WITH c1 AS (
  SELECT b.segment, line_of_business, COUNT(a.user_id)
  FROM booking_table a 
  INNER JOIN user_table b ON a.user_id = b.user_id
  GROUP BY b.segment, line_of_business
)

SELECT user_id, TIMESTAMPDIFF(SECOND, MIN(booking_date), MAX(booking_date)) as booking_duration
FROM booking_table
GROUP BY user_id;


