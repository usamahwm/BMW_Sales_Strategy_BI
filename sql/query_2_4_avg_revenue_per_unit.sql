-- Query 2.4: Model Commercial Success - Average Revenue Per Unit
-- Purpose: Identify the models most efficient at generating customer spend (upsell potential).
SELECT
    Model,
    SUM(Sales_Volume) AS Total_Sales_Volume,
    -- Avg_Revenue_Per_Unit is the proxy for upselling profitability
    SUM(Price_USD * Sales_Volume) / SUM(Sales_Volume) AS Avg_Revenue_Per_Unit
FROM
    raw_sales_data
GROUP BY
    Model
ORDER BY
    Avg_Revenue_Per_Unit DESC
LIMIT 10;
