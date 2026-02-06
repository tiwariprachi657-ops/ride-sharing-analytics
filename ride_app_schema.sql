CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50),
    created_at TIMESTAMP
);

CREATE TABLE drivers (
    driver_id INT PRIMARY KEY,
    name VARCHAR(100),
    vehicle_type VARCHAR(50),
    city VARCHAR(50),
    rating DECIMAL(2,1),
    created_at TIMESTAMP
);

CREATE TABLE rides (
    ride_id INT PRIMARY KEY,
    user_id INT,
    driver_id INT,
    request_time TIMESTAMP,
    pickup_time TIMESTAMP,
    drop_time TIMESTAMP,
    status VARCHAR(20),
    fare DECIMAL(10,2),
    city VARCHAR(50),

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);
