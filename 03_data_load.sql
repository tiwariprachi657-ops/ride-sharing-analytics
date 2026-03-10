-- ============================================================
-- Ride Sharing Analytics Project
-- File: 03_data_load.sql
-- Purpose: Load CSV data into MySQL tables
-- Note: LOCAL INFILE must be enabled in MySQL config
-- ============================================================


-- Enable only if required (local development)
SET GLOBAL local_infile = 1;


/* ============================================================
   1️⃣ Load Rides Fact Table
============================================================ */

LOAD DATA LOCAL INFILE 'data/processed/rides_cleaned.csv'
INTO TABLE rides
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    ride_id,
    user_id,
    driver_id,
    requested_at,
    ride_status,
    pickup_lat,
    pickup_lng,
    drop_lat,
    drop_lng,
    distance_km,
    duration_sec,
    fare
);



/* ============================================================
   2️⃣ Load Users Dimension
============================================================ */

LOAD DATA LOCAL INFILE 'data/raw/users.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(user_id, name, signup_date, city);



/* ============================================================
   3️⃣ Load Drivers Dimension
============================================================ */

LOAD DATA LOCAL INFILE 'data/raw/drivers.csv'
INTO TABLE drivers
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
(driver_id, name, signup_date, is_active);