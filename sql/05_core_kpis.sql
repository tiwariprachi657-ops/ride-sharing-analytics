-- 05_core_kpis.sql
-- Basic platform KPIs

SELECT
    COUNT(*) AS total_rides,

    SUM(CASE 
        WHEN ride_status = 'completed' 
        THEN 1 ELSE 0 END) AS completed_rides,

    SUM(CASE 
        WHEN ride_status LIKE 'cancelled%' 
        THEN 1 ELSE 0 END) AS cancelled_rides,

    ROUND(
        SUM(CASE WHEN ride_status = 'completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS completion_rate_pct,

    ROUND(
        SUM(CASE WHEN ride_status LIKE 'cancelled%' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS cancellation_rate_pct,

    ROUND(
        SUM(CASE WHEN ride_status = 'completed' THEN fare ELSE 0 END), 2
    ) AS total_revenue,

    ROUND(
        AVG(CASE WHEN ride_status = 'completed' THEN fare END), 2
    ) AS avg_fare_completed

FROM rides;
