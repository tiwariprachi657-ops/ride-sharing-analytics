
-- 09_driver_performance.sql
-- Driver level performance with driver details

SELECT
    r.driver_id,
    d.name AS driver_name,
    d.signup_date,
    d.is_active,
    COUNT(*) AS total_rides,

    SUM(CASE 
        WHEN r.ride_status = 'completed' 
        THEN 1 ELSE 0 END) AS completed_rides,
    SUM(CASE 
        WHEN r.ride_status LIKE 'cancelled%' 
        THEN 1 ELSE 0 END) AS cancelled_rides,

    ROUND(
        SUM(CASE WHEN r.ride_status = 'completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2
    ) AS completion_rate_pct,

    ROUND(
        SUM(CASE WHEN r.ride_status = 'completed' THEN r.fare ELSE 0 END), 2
    ) AS total_revenue,

    ROUND(
        AVG(CASE WHEN r.ride_status = 'completed' THEN r.fare END), 2 
        ) AS avg_fare_completed

FROM rides r
JOIN drivers d
    ON r.driver_id = d.driver_id

GROUP BY
    r.driver_id,
    d.name,
    d.signup_date,
    d.is_active
ORDER BY total_revenue DESC;
