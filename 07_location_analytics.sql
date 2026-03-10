
-- 07_location_analytics.sql (Refactored)
-- Purpose: Clean, consistent location-based performance analysis
-- Ensures KPI consistency with core metrics (completed rides drive revenue)

WITH location_base AS (
    SELECT
        ROUND(pickup_lat, 2) AS grid_lat,
        ROUND(pickup_lng, 2) AS grid_lng,
        ride_status,
        fare
    FROM rides
),

location_metrics AS (
    SELECT
        grid_lat,
        grid_lng,
        COUNT(*) AS total_requests,
        SUM(CASE WHEN ride_status = 'completed' THEN 1 ELSE 0 END) AS completed_rides,
        SUM(CASE WHEN ride_status = 'completed' THEN fare ELSE 0 END) AS total_revenue
    FROM location_base
    GROUP BY grid_lat, grid_lng
)

SELECT
    grid_lat,
    grid_lng,
    total_requests,
    completed_rides,
    ROUND(completed_rides / total_requests * 100, 2) AS completion_rate_pct,
    total_revenue,
    RANK() OVER (ORDER BY total_requests DESC) AS demand_rank,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM location_metrics
ORDER BY total_requests DESC;
