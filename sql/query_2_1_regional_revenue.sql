-- Query 2.1: Total Estimated Revenue by Region and Model Contribution
-- Purpose: Identify regional revenue drivers and the highest-contributing models.
-- Estimated_Revenue is calculated as (Price_USD * Sales_Volume)
SELECT
    Region,
    SUM(Price_USD * Sales_Volume) AS Total_Estimated_Revenue
FROM
    raw_sales_data
GROUP BY
    Region
ORDER BY
    Total_Estimated_Revenue DESC;
