SELECT user_id as buyer_id, join_date,  COALESCE(a.orders_in_2019, 0) AS orders_in_2019
FROM Users
LEFT JOIN
(
    SELECT buyer_id, coalesce(count(*), 0) as orders_in_2019
    from Orders o
    join Users u
    on u.user_id = o.buyer_id
    WHERE extract(year from order_date) = 2019
    Group by buyer_id) a
    On users.user_id = a.buyer_id