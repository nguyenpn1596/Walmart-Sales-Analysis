/*
Business and Data Exploratory Analysis
*/

SELECT *
FROM walmart_sales
;

-- Sales per store
SELECT Store, 
    ROUND(SUM(Weekly_Sales), 2) AS Total_Sales
FROM walmart_sales
GROUP BY Store
ORDER BY Total_Sales DESC
;

-- Holiday Impact
SELECT Holiday_Flag, 
    ROUND(SUM(Weekly_Sales), 2) AS Total_Sales
FROM walmart_sales
GROUP BY Holiday_Flag
ORDER BY Total_Sales DESC
;


-- Fuel vs Sales Corelation
SELECT Fuel_Price, 
    ROUND(SUM(Weekly_Sales), 2) AS Total_Sales
FROM walmart_sales
GROUP BY Fuel_Price
ORDER BY Total_Sales DESC
;


-- Sales based on month
SELECT MONTH(Date) AS Month, 
    ROUND(SUM(Weekly_Sales), 2) AS Total_Sales
FROM walmart_sales
GROUP BY Month
ORDER BY Total_Sales DESC
;