-- 07_location_analytics.sql
-- Demand analysis by pickup location

SELECT
    ROUND(pickup_lat, 2) AS pickup_lat_grid,
    ROUND(pickup_lng, 2) AS pickup_lng_grid,

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
GROUP BY
    ROUND(pickup_lat,2),
    ROUND(pickup_lng,2)

ORDER BY total_rides DESC;
