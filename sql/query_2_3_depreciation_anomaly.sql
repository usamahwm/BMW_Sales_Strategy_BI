-- Query 2.3: The Flawed Depreciation Query (Used for Anomaly Detection)
-- Purpose: Intended to track value retention, but revealed a critical data anomaly.
SELECT
    (2024 - Year) AS Car_Age,
    AVG(Price_USD) AS Avg_Price,
    AVG(Mileage_KM) AS Avg_Mileage
FROM
    raw_sales_data
GROUP BY 1
ORDER BY Car_Age;
-- NOTE: This query's output was nonsensical, leading to the necessary pivot
-- away from depreciation analysis and toward commercial success metrics (Query 2.4).
