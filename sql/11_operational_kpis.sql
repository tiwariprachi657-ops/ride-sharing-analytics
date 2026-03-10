/* =====================================================
   11_operational_kpis.sql
   Platform Efficiency & Demand Intelligence Layer
   ===================================================== */

WITH base_rides AS (
    SELECT
        ride_id,
        user_id,
        driver_id,
        ride_status,
        requested_at,
        EXTRACT(HOUR FROM requested_at) AS request_hour,
        fare,
        distance_km
    FROM rides
),

/* Completed rides subset */
completed_rides AS (
    SELECT *
    FROM base_rides
    WHERE ride_status = 'completed'
),

/* Platform-level KPIs */
platform_kpis AS (
    SELECT
        COUNT(*) AS total_requests,
        SUM(CASE WHEN ride_status = 'completed' THEN 1 ELSE 0 END) AS completed_rides,
        SUM(CASE WHEN ride_status = 'cancelled_user' THEN 1 ELSE 0 END) AS user_cancellations,
        SUM(CASE WHEN ride_status = 'cancelled_driver' THEN 1 ELSE 0 END) AS driver_cancellations,
        ROUND(SUM(CASE WHEN ride_status = 'completed' THEN fare END),2) AS total_revenue
    FROM base_rides
),

/* Hourly Demand Layer */
hourly_performance AS (
    SELECT
        request_hour,
        COUNT(*) AS total_requests,
        SUM(CASE WHEN ride_status = 'completed' THEN 1 ELSE 0 END) AS completed_rides,
        ROUND(
            SUM(CASE WHEN ride_status = 'completed' THEN 1 ELSE 0 END) * 100.0 
            / COUNT(*), 2
        ) AS completion_rate_pct,
        ROUND(
            SUM(CASE WHEN ride_status = 'completed' THEN fare END),2
        ) AS hourly_revenue
    FROM base_rides
    GROUP BY request_hour
)

/* ================= FINAL OUTPUTS ================= */

/* 1️⃣ Platform Summary */
SELECT
    total_requests,
    completed_rides,
    ROUND(completed_rides * 100.0 / total_requests, 2) AS completion_rate_pct,
    ROUND(user_cancellations * 100.0 / total_requests, 2) AS user_cancel_pct,
    ROUND(driver_cancellations * 100.0 / total_requests, 2) AS driver_cancel_pct,
    total_revenue,
    ROUND(total_revenue / completed_rides, 2) AS avg_fare_per_completed_ride
FROM platform_kpis;

/* 2️⃣ Hourly Intelligence */
SELECT *
FROM hourly_performance
ORDER BY request_hour;
