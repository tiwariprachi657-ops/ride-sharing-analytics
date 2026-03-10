
-- 10_fraud_detection_refactored.sql
-- Consolidated fraud signals into one unified query

WITH fare_metrics AS (
    SELECT
        ride_id,
        driver_id,
        fare,
        distance_km,
        ROUND(fare / NULLIF(distance_km, 0),2) AS fare_per_km
    FROM rides
    WHERE ride_status = 'completed'
),
percentiles AS (
    SELECT
        ride_id,
        driver_id,
        fare,
        distance_km,
        fare_per_km,
        NTILE(20) OVER (ORDER BY fare_per_km DESC) AS fare_tile
    FROM fare_metrics
)

SELECT
    ride_id,
    driver_id,
    fare,
    distance_km,
    fare_per_km,
    CASE 
        WHEN fare_tile = 1 THEN 'Top 5% Fare Outlier'
        ELSE 'Normal'
    END AS fraud_flag
FROM percentiles;
