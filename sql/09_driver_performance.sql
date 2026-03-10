
-- 09_driver_performance_refactored.sql
-- Removes duplicate KPI logic and standardizes performance calculation

WITH driver_metrics AS (
    SELECT
        driver_id,
        COUNT(*) AS total_rides,
        SUM(CASE WHEN ride_status = 'completed' THEN 1 ELSE 0 END) AS completed_rides,
        SUM(CASE WHEN ride_status = 'completed' THEN fare ELSE 0 END) AS driver_revenue
    FROM rides
    GROUP BY driver_id
)

SELECT
    driver_id,
    total_rides,
    completed_rides,
    ROUND(completed_rides / total_rides * 100, 2) AS completion_rate_pct,
    driver_revenue,
    RANK() OVER (ORDER BY driver_revenue DESC) AS revenue_rank
FROM driver_metrics;
