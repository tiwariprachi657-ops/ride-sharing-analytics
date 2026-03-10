-- 10_fare_anomaly_detection.sql
-- Identify rides with unusually high fare per km

WITH fare_data AS (

    SELECT
        ride_id,
        driver_id,
        fare,
        distance_km,
        ROUND(fare / NULLIF(distance_km,0),2) AS fare_per_km

    FROM rides
    WHERE ride_status = 'completed'

),

ranked_rides AS (

    SELECT
        ride_id,
        driver_id,
        fare,
        distance_km,
        fare_per_km,
        NTILE(20) OVER (ORDER BY fare_per_km DESC) AS fare_group

    FROM fare_data

)

SELECT
    ride_id,
    driver_id,
    fare,
    distance_km,
    fare_per_km,

    CASE
        WHEN fare_group = 1
        THEN 'Top 5% Fare Outlier'
        ELSE 'Normal'
    END AS anomaly_flag

FROM ranked_rides
ORDER BY fare_per_km DESC;
