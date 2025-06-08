/*
Quality and Integrity check
*/

SELECT * 
FROM walmart_sales
;

-- Check for NULLs -> no NULLs
SELECT COUNT(*),
    SUM(CASE WHEN Weekly_Sales IS NULL THEN 1 ELSE 0 END) AS null_sales,
    SUM(CASE WHEN Holiday_Flag IS NULL THEN 1 ELSE 0 END) AS null_sales,
    SUM(CASE WHEN Temperature IS NULL THEN 1 ELSE 0 END) AS null_sales,
    SUM(CASE WHEN Fuel_Price IS NULL THEN 1 ELSE 0 END) AS null_sales,
    SUM(CASE WHEN CPI IS NULL THEN 1 ELSE 0 END) AS null_sales,
    SUM(CASE WHEN Unemployment IS NULL THEN 1 ELSE 0 END) AS null_sales
FROM walmart_sales
;

-- Check for duplicates -> No duplicates
SELECT CONCAT(Store, STR_TO_DATE(Date, '%d-%m-%Y')) AS Store_Sales_Date,
    COUNT(CONCAT(Store, STR_TO_DATE(Date, '%d-%m-%Y'))) AS Store_Sales_Date_Count
FROM walmart_sales
GROUP BY CONCAT(Store, STR_TO_DATE(Date, '%d-%m-%Y'))
HAVING COUNT(CONCAT(Store, STR_TO_DATE(Date, '%d-%m-%Y'))) > 1
;

-- Check for invalid values 
SELECT Weekly_Sales
FROM walmart_sales
WHERE Weekly_Sales <= 0
;

SELECT Fuel_Price
FROM walmart_sales
WHERE Fuel_Price <= 0
;