-- 1. Row count
SELECT COUNT(*) FORM FROM cafe_sales_data


-- 2. Peek at data
SELECT * FROM cafe_sales_data
LIMIT 20


-- 3. COUNT of 'ERROR' values per column
SELECT 
    SUM(CASE WHEN CAST(transaction_id AS CHAR) = 'ERROR' THEN 1 ELSE 0 END) AS bad_id,
    SUM(CASE WHEN CAST(item AS CHAR) = 'ERROR' THEN 1 ELSE 0 END) AS bad_item,
    SUM(CASE WHEN CAST(quantity AS CHAR) = 'ERROR' THEN 1 ELSE 0 END) AS bad_qty,
    SUM(CASE WHEN CAST(price_per_unit AS CHAR) = 'ERROR' THEN 1 ELSE 0 END) AS bad_price,
    SUM(CASE WHEN CAST(total_spent AS CHAR) = 'ERROR' THEN 1 ELSE 0 END) AS bad_total,
    SUM(CASE WHEN CAST(payment_method AS CHAR) = 'ERROR' THEN 1 ELSE 0 END) AS bad_payment,
    SUM(CASE WHEN CAST(location AS CHAR) = 'ERROR' THEN 1 ELSE 0 END) AS bad_location,
    SUM(CASE WHEN CAST(transaction_date AS CHAR) = 'ERROR' THEN 1 ELSE 0 END) AS bad_date
FROM cafe_sales_data;


-- 4. Count Nulls and empties
SELECT * AS NULLS
FROM cafe_sales_data
WHERE
    item IS Null OR CAST(item AS CHAR) = ''