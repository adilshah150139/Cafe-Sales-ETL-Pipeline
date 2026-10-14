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
    COUNT(*) FILTER (WHERE transaction_id = 'ERROR') AS bad_id,
    COUNT(*) FILTER (WHERE item = 'ERROR') AS bad_item,
    COUNT(*) FILTER (WHERE quantity = 'ERROR') AS bad_qty,
    COUNT(*) FILTER (WHERE price_per_unit = 'ERROR') AS bad_price,
    COUNT(*) FILTER (WHERE total_spent = 'ERROR') AS bad_total,
    COUNT(*) FILTER (WHERE payment_method = 'ERROR') AS bad_payment,
    COUNT(*) FILTER (WHERE location = 'ERROR') AS bad_location,
    COUNT(*) FILTER (WHERE transaction_date = 'ERROR') AS bad_date
FROM cafe_sales_data;



-- 4. Count Nulls and empties
SELECT
    COUNT(*) FILTER (WHERE transaction_id IS NULL OR transaction_id = '') AS null_id,
    COUNT(*) FILTER (WHERE item IS NULL OR item = '') AS null_item,
    COUNT(*) FILTER (WHERE quantity IS NULL OR quantity = '') AS null_qty,
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
ORDER BY transaction_date
LIMIT 20;


-- Check Inconsistencies
SELECT 
    DISTINCT item
FROM cafe_sales_data
ORDER BY item;