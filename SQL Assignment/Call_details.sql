USE Py;

create table call_details  (
call_type varchar(10),
call_number varchar(12),
call_duration int
);
insert into call_details
values ('OUT','181868',13),('OUT','2159010',8)
,('OUT','2159010',178),('SMS','4153810',1),('OUT','2159010',152),('OUT','9140152',18),('SMS','4162672',1)
,('SMS','9168204',1),('OUT','9168204',576),('INC','2159010',5),('INC','2159010',4),('SMS','2159010',1)
,('SMS','4535614',1),('OUT','181868',20),('INC','181868',54),('INC','218748',20),('INC','2159010',9)
,('INC','197432',66),('SMS','2159010',1),('SMS','4535614',1);

SELECT * FROM call_details;

-- Write a sql query to identify phone numbers that satisfy below conditions
-- The numbers have both incoming and outgoing calls
-- The sum of duration of outgoing calls should be greater than sum of duration of incoming calls

WITH CTE AS (
 WITH CT AS 
	(SELECT A.CALL_TYPE , A.CALL_NUMBER, A.CALL_DURATION AS OUTGOING_CALL, ifnull(B.CALL_TYPE, "INC") AS INN , ifnull(B.CALL_DURATION,0) AS INCOMING FROM
 
		(SELECT CALL_TYPE, CALL_NUMBER , CALL_DURATION FROM CALL_DETAILS WHERE CALL_TYPE = 'OUT') A 
 
			LEFT JOIN
 
		(SELECT * FROM CALL_DETAILS WHERE CALL_TYPE = 'INC') B ON A.CALL_NUMBER = B.CALL_NUMBER )
 
								SELECT CALL_NUMBER, SUM(OUTGOING_CALL) AS OUTGOING_DURATION, SUM(INCOMING) AS INCOMING_DURATION FROM CT GROUP BY CALL_NUMBER)
 
																SELECT CALL_NUMBER , OUTGOING_DURATION, INCOMING_DURATION FROM CTE WHERE OUTGOING_DURATION > INCOMING_DURATION;
