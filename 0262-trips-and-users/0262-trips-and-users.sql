# Write your MySQL query statement below

SELECT request_at AS Day,
ROUND(SUM(IF(status<>"completed",1,0))/COUNT(status),2) as "Cancellation Rate"
FROM Trips 
WHERE request_at BETWEEN "2013-10-01" AND "2013-10-03"
AND client_id not in (SELECT users_id from Users where banned = "Yes")
AND driver_id not in (SELECT users_id from Users where banned = "Yes")
group by request_at;