
-- 05_core_kpis_refactored.sql
-- Centralized KPI CTE to avoid repetition across scripts

WITH base_metrics AS (
    SELECT
        COUNT(*) AS total_requests,
        SUM(CASE WHEN ride_status = 'completed' THEN 1 ELSE 0 END) AS completed_rides,
        SUM(CASE WHEN ride_status LIKE '%cancelled%' THEN 1 ELSE 0 END) AS cancelled_rides,
        SUM(CASE WHEN ride_status = 'completed' THEN fare ELSE 0 END) AS total_revenue
    FROM rides
)

SELECT
    total_requests,
    completed_rides,
    cancelled_rides,
    ROUND(completed_rides / total_requests * 100, 2) AS completion_rate_pct,
    total_revenue,
    ROUND(total_revenue / NULLIF(completed_rides,0), 2) AS avg_fare_completed
FROM base_metrics;
