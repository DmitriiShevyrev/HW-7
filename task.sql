-- 1
CREATE VIEW samsBills
AS
(SELECT W.first_name, W.surname, B.bill_date, C.cust_name, B.bill_total
FROM waiter W
INNER JOIN bill B ON W.waiter_id = B.waiter_id
INNER JOIN customer C ON B.customer_id = C.customer_id
WHERE W.first_name = 'Sam' AND W.surname = 'Pitt');

-- 2
SELECT *
FROM samsBills
WHERE bill_total > 400;

-- 3
CREATE VIEW roomTotals
AS
(SELECT R.room_name, SUM(B.bill_total) AS total_sum
FROM room R
INNER JOIN table T ON R.room_id = T.room_id
INNER JOIN bill B ON T.table_id = B.table_id
GROUP BY R.room_name);

-- 4
CREATE VIEW teamTotals
AS
(SELECT CONCAT(W.first_name, ' ', W.surname) AS headwaiter_name, SUM(B.bill_total) AS total_sum
FROM waiter W
INNER JOIN bill B ON W.waiter_id = B.waiter_id
GROUP BY W.first_name, W.surname);
