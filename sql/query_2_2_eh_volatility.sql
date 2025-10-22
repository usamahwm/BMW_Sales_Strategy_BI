-- Query 2.2: E/H Sales Volume and Year-over-Year Growth Calculation
-- Purpose: Track the trend and volatility of Electric/Hybrid adoption over time.
WITH EH_Volume AS (
    SELECT
        Year,
        SUM(CASE WHEN Fuel_Type IN ('Electric', 'Hybrid') THEN Sales_Volume ELSE 0 END) AS EH_Volume
    FROM
        raw_sales_data
    GROUP BY
        Year
)
SELECT
    t1.Year,
    t1.EH_Volume,
    -- Calculate YOY Growth as a percentage
    ((t1.EH_Volume - t2.EH_Volume) / t2.EH_Volume) * 100 AS YOY_Growth_Percentage
FROM
    EH_Volume t1
LEFT JOIN
    EH_Volume t2 ON t1.Year = t2.Year + 1
ORDER BY
    t1.Year DESC;
