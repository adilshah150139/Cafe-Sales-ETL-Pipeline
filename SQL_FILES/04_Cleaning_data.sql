UPDATE cafe_sales_data SET quantity = NULL WHERE quantity IN ('ERROR', 'UNKNOWN','N/A', '-', '?');
UPDATE cafe_sales_data SET price_per_unit = NULL WHERE price_per_unit IN ('ERROR', 'UNKNOWN','N/A', '-', '?');
UPDATE cafe_sales_data SET total_spent = NULL WHERE total_spent IN ('ERROR', 'UNKNOWN','N/A', '-', '?');
UPDATE cafe_sales_data SET transaction_date = NULL WHERE transaction_date IN ('ERROR', 'UNKNOWN','N/A', '-', '?');



-- 1. Remove empty strings → NULL
UPDATE cafe_sales_data SET item = NULL WHERE TRIM(item) = '';
UPDATE cafe_sales_data SET payment_method = NULL WHERE TRIM(payment_method) = '';



-- 2. Standardize text
UPDATE cafe_sales_data SET item = LOWER(TRIM(item));
UPDATE cafe_sales_data SET payment_method = LOWER(TRIM(payment_method));
UPDATE cafe_sales_data SET location = LOWER(TRIM(location));



-- Managing datatype
ALTER TABLE cafe_sales_data
    ALTER COLUMN quantity TYPE INTEGER USING quantity::INTEGER,
    ALTER COLUMN price_per_unit TYPE REAL USING price_per_unit::REAL,
    ALTER COLUMN total_spent TYPE REAL USING total_spent::REAL,
    ALTER COLUMN transaction_date TYPE DATE USING transaction_date::DATE;



-- Removing Duplicates from table
WITH ranked AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY transaction_id) AS rn
    FROM cafe_sales_data
)
SELECT * FROM ranked Where rn = 1;



-- Recalculate total_spent where missing
UPDATE cafe_sales_data
SET total_spent = quantity * price_per_unit
WHERE total_spent IS NULL AND quantity IS NOT NULL AND price_per_unit IS NOT NULL;

SELECT * FROM cafe_sales_data LIMIT 20;
SELECT COUNT(*) FROM cafe_sales_data;
