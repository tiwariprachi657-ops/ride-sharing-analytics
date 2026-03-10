# 📚 Data Dictionary

This document describes the schema used in the **Ride Sharing Analytics
Platform**.

------------------------------------------------------------------------

# Fact Table

## Fact_Ride_Transactions

  Column              Description
  ------------------- ----------------------------------------
  ride_id             Unique identifier for each ride
  user_id             Foreign key referencing the rider
  driver_id           Foreign key referencing the driver
  requested_at        Timestamp when ride was requested
  pickup_time         Time when driver picked up rider
  dropoff_time        Time when ride ended
  pickup_lat          Pickup latitude coordinate
  pickup_lng          Pickup longitude coordinate
  drop_lat            Drop location latitude
  drop_lng            Drop location longitude
  distance_km         Distance travelled during ride
  fare_amount         Total fare charged
  ride_status         Completed / Cancelled
  cancellation_flag   Binary flag indicating cancellation
  fraud_flag          Binary flag for abnormal fare patterns

------------------------------------------------------------------------

# Dimension Tables

## Dim_User

  Column        Description
  ------------- --------------------------------
  user_id       Unique user identifier
  name          Rider name
  email         Rider email
  signup_date   Date when user joined platform
  city          City of user

------------------------------------------------------------------------

## Dim_Driver

  Column         Description
  -------------- -----------------------------
  driver_id      Unique driver identifier
  name           Driver name
  vehicle_type   Vehicle category
  rating         Average driver rating
  join_date      Date driver joined platform
  city           Operating city

------------------------------------------------------------------------

## Dim_Location

  Column         Description
  -------------- -------------------------------
  location_key   Surrogate location identifier
  pickup_lat     Pickup latitude
  pickup_lng     Pickup longitude
  drop_lat       Drop latitude
  drop_lng       Drop longitude
  pickup_zone    Clustered pickup region
  drop_zone      Clustered drop region

------------------------------------------------------------------------

# Relationships

  Relationship       Type
  ------------------ ----------
  User → Rides       1 : Many
  Driver → Rides     1 : Many

This dimensional model follows a **Star Schema**, optimized for
analytical queries and BI reporting.
