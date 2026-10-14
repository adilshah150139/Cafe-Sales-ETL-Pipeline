-- 1. Remove empty strings → NULL
UPDATE cafe_sales_data SET item = NULL WHERE TRIM(item) = '';
UPDATE cafe_sales_data SET payment_method = NULL WHERE TRIM(payment_method) = '';


-- 2. Standardize text
UPDATE cafe_sales_data SET item = LOWER(TRIM(item));
UPDATE cafe_sales_data SET payment_method = LOWER(TRIM(payment_method));
UPDATE cafe_sales_data SET location = LOWER(TRIM(location));

\d cafe_sales_data