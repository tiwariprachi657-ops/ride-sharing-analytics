
-- 06_hourly_analysis_refactored.sql
-- Uses consistent KPI logic and avoids recalculating revenue logic differently

SELECT
    HOUR(requested_at) AS request_hour,
    COUNT(*) AS total_requests,
    SUM(CASE WHEN ride_status = 'completed' THEN 1 ELSE 0 END) AS completed_rides,
    ROUND(
        SUM(CASE WHEN ride_status = 'completed' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2
    ) AS completion_rate_pct,
    SUM(CASE WHEN ride_status = 'completed' THEN fare ELSE 0 END) AS hourly_revenue
FROM rides
GROUP BY request_hour
ORDER BY request_hour;
