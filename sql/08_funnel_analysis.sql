-- 08_funnel_analysis.sql
-- Ride funnel analysis

SELECT
    COUNT(*) AS requested_rides,

    SUM(CASE 
        WHEN ride_status = 'completed' 
        THEN 1 ELSE 0 
    END) AS completed_rides,

    SUM(CASE 
        WHEN ride_status = 'cancelled_user' 
        THEN 1 ELSE 0 
    END) AS user_cancelled_rides,

    SUM(CASE 
        WHEN ride_status = 'cancelled_driver' 
        THEN 1 ELSE 0 
    END) AS driver_cancelled_rides,

    ROUND(
        SUM(CASE WHEN ride_status = 'completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS completion_rate_pct

FROM rides;
