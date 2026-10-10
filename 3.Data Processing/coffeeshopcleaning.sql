--USE AND SELECT A SPECIFIC SCHEMA
USE casestudy.brightlearn;

--Confirm DATA 
SELECT *
FROM sales;

--Checking for Revenue
SELECT SUM(transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DOUBLE)) AS Revenue
FROM sales;

--checking for Revenue per store
SELECT SUM(transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DOUBLE)) AS Revenue,
        store_location
FROM sales
GROUP BY store_location;

--Checking Total Units sold per Store
SELECT SUM(transaction_qty) AS Units_sold,
        store_location
FROM sales
GROUP BY store_location;


--CHECKING FOR MONTH REVENUE AND UNITS SOLD
SELECT SUM(transaction_qty) AS Units_sold,
        SUM(transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DOUBLE)) AS Revenue,
        MONTHNAME(transaction_date) AS Month_name
FROM sales
GROUP BY MONTHNAME(transaction_date);

--Checking For 5 Most selling Products
SELECT SUM(transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DOUBLE)) AS Revenue,
        product_detail,
        SUM(transaction_qty) AS UNITS_SOLD
FROM sales
GROUP BY product_detail
ORDER BY UNITS_SOLD DESC
LIMIT 5

--Checking For 5 least selling Products
SELECT SUM(transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DOUBLE)) AS Revenue,
        product_detail,
        SUM(transaction_qty) AS UNITS_SOLD
FROM sales
GROUP BY product_detail
ORDER BY UNITS_SOLD ASC
LIMIT 5;

--Checking Opening and Closing time
SELECT transaction_date,
        MIN(transaction_time) AS OPENNIG,
        MAX(transaction_time) AS CLOSING
FROM sales
GROUP BY transaction_date;

-- --Filtering Hourly Buckets revenue
SELECT SUM(transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DOUBLE)) AS Revenue,
        CASE
        WHEN HOUR(transaction_time) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN HOUR(transaction_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN HOUR(transaction_time) BETWEEN 18 AND 21 THEN 'Evening'
        END AS time_buckets
FROM sales
GROUP BY ALL;

---CHECKING FOR DAILY REVENUE UNITS SOLD (ADD ALL SUNDAYS INTO ONE SUNDAY FOR EVERY MONTH ECT.)
SELECT DAYNAME(transaction_date) AS day_name,
        SUM(transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DOUBLE)) AS Revenue,
        SUM(transaction_qty) AS units_sold
FROM sales
GROUP BY day_name;

--CHECKING NUMBER OF PRODUCTS AVAILABE AND NUMBER OF SALE PER STORE
SELECT  DISTINCT store_location,
        COUNT(DISTINCT product_id) as NUMBER_OF_PRODUCTS,
        COUNT(transaction_id) AS No_of_Sales
FROM sales
GROUP BY store_location;

--DATA LOOKUP
SELECT *
FROM sales;

--Cleaning And Filtering DATA
SELECT transaction_date,
        transaction_time,
        store_id,
        MONTHNAME(transaction_date) AS Month_name,
        DAYNAME(transaction_date) AS Day_name,
        COUNT(DISTINCT product_id) as NUMBER_OF_PRODUCTS,
        SUM(transaction_qty * CAST(REPLACE(unit_price, ',', '.') AS DOUBLE)) AS Revenue,
        SUM(transaction_qty) AS units_sold,
        CASE 
        WHEN HOUR(transaction_time) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN HOUR(transaction_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN HOUR(transaction_time) BETWEEN 18 AND 21 THEN 'Evening'
        END AS Time_buckets,
        CASE
        WHEN DAYNAME(transaction_date) IN ('Sat', 'Sun') THEN 'Weekend'
        ELSE 'Weekday'
        END AS Day_classification,
        store_location,
        product_category,
        product_type,
        product_detail


FROM sales
GROUP BY transaction_date,
        transaction_time,
        store_id,
        MONTHNAME(transaction_date),
        DAYNAME(transaction_date),
        CASE 
                WHEN HOUR(transaction_time) BETWEEN 6 AND 11 THEN 'Morning'
                WHEN HOUR(transaction_time) BETWEEN 12 AND 17 THEN 'Afternoon'
                WHEN HOUR(transaction_time) BETWEEN 18 AND 21 THEN 'Evening'
        END,
        CASE 
                WHEN DAYNAME(transaction_date) IN ('Sat', 'Sun') THEN 'Weekend'
                ELSE 'Weekday'
        END,
        store_location,
        product_category,
        product_type,
        product_detail;
