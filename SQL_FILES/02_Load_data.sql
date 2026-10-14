COPY cafe_sales_data
FROM 'E:\PORTFOLIO_PROJECTS\PYTHON-PROJECTS\02-Cafe-Sales\DATA\raw_data\dirty_cafe_sales.csv'
DELIMITER ','
CSV HEADER
ENCODING 'latin1';

SELECT * FROM cafe_sales_data
