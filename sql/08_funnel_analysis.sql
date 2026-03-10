
-- 08_funnel_analysis.sql (Refactored)
-- Purpose: Clean funnel representation using standardized KPI logic

WITH funnel_base AS (
    SELECT
        COUNT(*) AS requested_rides,
        SUM(CASE WHEN ride_status = 'completed' THEN 1 ELSE 0 END) AS completed_rides,
        SUM(CASE WHEN ride_status LIKE '%cancelled%' THEN 1 ELSE 0 END) AS cancelled_rides
    FROM rides
)

SELECT
    requested_rides,
    completed_rides,
    cancelled_rides,
    ROUND(completed_rides / requested_rides * 100, 2) AS completion_rate_pct,
    ROUND(cancelled_rides / requested_rides * 100, 2) AS cancellation_rate_pct
FROM funnel_base;
