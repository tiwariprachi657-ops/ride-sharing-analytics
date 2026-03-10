
-- 06_hourly_analysis.sql
-- Ride performance by request hour

SELECT
    HOUR(requested_at) AS request_hour,
    COUNT(*) AS total_rides,
    SUM(CASE 
        WHEN ride_status = 'completed' 
        THEN 1 ELSE 0 
        END) AS completed_rides,

    SUM(CASE 
        WHEN ride_status LIKE 'cancelled%' 
        THEN 1 ELSE 0 
    END) AS cancelled_rides,

    ROUND(
        SUM(CASE WHEN ride_status = 'completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS completion_rate_pct,

    ROUND(
        SUM(CASE WHEN ride_status = 'completed' THEN fare ELSE 0 END),
        2
    ) AS total_revenue

FROM rides
GROUP BY request_hour
ORDER BY request_hour;
