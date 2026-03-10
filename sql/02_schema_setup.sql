-- ============================================================
-- Ride Sharing Analytics Project
-- File: 02_schema_setup.sql
-- Purpose:
-- Create database schema for ride-sharing analytics
-- Includes fact and dimension tables with performance indexing
-- ============================================================


-- ============================================================
-- 1️⃣ Database Initialization
-- ============================================================

CREATE DATABASE IF NOT EXISTS ride_sharing;
USE ride_sharing;


-- Clean restart
DROP TABLE IF EXISTS rides;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS drivers;


-- ============================================================
-- 2️⃣ Dimension Tables
-- ============================================================

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    signup_date DATE,
    city VARCHAR(50)
);


CREATE TABLE drivers (
    driver_id INT PRIMARY KEY,
    name VARCHAR(100),
    signup_date DATE,
    is_active TINYINT
);


-- ============================================================
-- 3️⃣ Fact Table (rides)
-- Grain: One row = One ride request
-- ============================================================

CREATE TABLE rides (
    ride_id INT PRIMARY KEY,

    user_id INT,
    driver_id INT,

    requested_at DATETIME NOT NULL,
    ride_status VARCHAR(30),

    pickup_lat DECIMAL(9,6),
    pickup_lng DECIMAL(9,6),
    drop_lat DECIMAL(9,6),
    drop_lng DECIMAL(9,6),

    distance_km DECIMAL(10,2),
    duration_sec INT,
    fare DECIMAL(10,2),

    -- Derived columns (created during preprocessing for analytics efficiency)
    hour INT,
    day DATE,
    fifteen_min_bucket VARCHAR(20),

    -- Foreign Key Constraints
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id),

    CONSTRAINT fk_driver
        FOREIGN KEY (driver_id)
        REFERENCES drivers(driver_id)
);


-- ============================================================
-- 4️⃣ Performance Indexes
-- ============================================================

-- Status + time filtering (most common analytics filter)
CREATE INDEX idx_status_time
ON rides (ride_status, requested_at);

-- Driver-level performance analysis
CREATE INDEX idx_driver_status
ON rides (driver_id, ride_status);

-- User behavior analysis
CREATE INDEX idx_user_time
ON rides (user_id, requested_at);

-- Hour-based aggregations
CREATE INDEX idx_hour
ON rides (hour);
