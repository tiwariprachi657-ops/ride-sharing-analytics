
-- 04_data_validation.sql (Refactored)
-- Purpose: Centralized data quality validation checks
-- Each check returns a failure count for governance visibility

WITH duplicate_ride_ids AS (
    SELECT COUNT(*) AS failed_count
    FROM (
        SELECT ride_id
        FROM rides
        GROUP BY ride_id
        HAVING COUNT(*) > 1
    ) t
),

negative_fare_check AS (
    SELECT COUNT(*) AS failed_count
    FROM rides
    WHERE fare < 0

),

null_critical_fields AS (
    SELECT COUNT(*) AS failed_count
    FROM rides
    WHERE ride_id IS NULL
       OR user_id IS NULL
       OR driver_id IS NULL
       OR ride_status IS NULL
       OR requested_at IS NULL
),

invalid_hour_check AS (
    SELECT COUNT(*) AS failed_count
    FROM rides
    WHERE HOUR(requested_at) NOT BETWEEN 0 AND 23
),

negative_distance_check AS (
    SELECT COUNT(*) AS failed_count
    FROM rides
    WHERE distance_km <= 0
),

fare_logic_check AS (
    SELECT COUNT(*) AS failed_count
    FROM rides
    WHERE ride_status = 'completed' AND fare <= 0
)

SELECT 'Duplicate Ride IDs' AS check_name, failed_count FROM duplicate_ride_ids
UNION ALL
SELECT 'Negative Fare Amount', failed_count FROM negative_fare_check
UNION ALL
SELECT 'Null Critical Fields', failed_count FROM null_critical_fields
UNION ALL
SELECT 'Invalid Request Hour', failed_count FROM invalid_hour_check
UNION ALL
SELECT 'Non-Positive Distance', failed_count FROM negative_distance_check
UNION ALL
SELECT 'Completed Ride with Non-Positive Fare', failed_count FROM fare_logic_check;
