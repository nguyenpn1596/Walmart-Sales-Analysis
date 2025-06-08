/*
Cleanning and Preparing Dataset
*/

SELECT Date,
  STR_TO_DATE(Date, '%d-%m-%Y') AS sale_date
FROM walmart_sales
;

UPDATE walmart_sales
SET Date =  STR_TO_DATE(Date, '%d-%m-%Y')
;

-- Check Invalid Value -> No invalid value
SELECT *
FROM walmart_sales
WHERE Weekly_Sales <= 0
OR Fuel_Price <= 0
OR CPI <= 0
OR Unemployment <= 0
;

-- New Cleaned Table. Adding total weekly sales for comparison purpose
SELECT *,
    ROUND(SUM(Weekly_Sales) OVER(PARTITION BY DATE),2) AS Total_Weekly_Sales 
FROM walmart_sales
ORDER BY Date DESC, Weekly_Sales DESC
;