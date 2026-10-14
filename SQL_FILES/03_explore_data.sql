-- 1. Row count
SELECT COUNT(*) FORM FROM cafe_sales_data


-- 2. Peek at data
SELECT * FROM cafe_sales_data
LIMIT 20


-- Datatype
SELECT data_type
FROM information_schema.columns
WHERE table_name = 'cafe_sales_data'
      AND column_name IN ('quantity', 'price_per_unit', 'total_spent')
ORDER BY ordinal_position



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
SELECT
    COUNT(*) FILTER (WHERE transaction_id IS NULL OR transaction_id = '') AS null_id,
    COUNT(*) FILTER (WHERE item IS NULL OR item = '') AS null_item,
    COUNT(*) FILTER (WHERE quantity IS NULL OR quantity = '') AS null_quantity,
    COUNT(*) FILTER (WHERE price_per_unit IS NULL OR price_per_unit = '') AS null_price,
    COUNT(*) FILTER (WHERE total_spent IS NULL OR price_per_unit = '') AS null_spent,
    COUNT(*) FILTER (WHERE payment_method IS NULL OR payment_method = '') AS null_method,
    COUNT(*) FILTER (WHERE transaction_date IS NULL OR transaction_date = '' ) AS null_date
FROM cafe_sales_data;


-- Check Duplicates  (WHERE filters rows before they are grouped, and HAVING filters groups after they are calculated.)
SELECT transaction_id, COUNT(*)
FROM cafe_sales_data
GROUP BY transaction_id
HAVING COUNT(*) > 1;


-- Check Date formate
SELECT DISTINCT transaction_date 
FROM cafe_sales_data
LIMIT 20;


-- Check Inconsistencies
SELECT 
    DISTINCT item
FROM cafe_sales_data
ORDER BY item;