# 🚖 Ride Sharing Analytics Platform

### End-to-End Operational Intelligence & Fraud Detection System

------------------------------------------------------------------------

## 📌 Executive Summary

This project analyzes ride-level transactional data to uncover
operational inefficiencies, detect revenue leakage, and optimize driver
allocation.

Using dimensional modeling (Star Schema), KPI engineering, and SQL-based
analytical logic, the system transforms raw ride data into actionable
business insights suitable for executive dashboards.

------------------------------------------------------------------------

## 🎯 Business Objectives

-   Reduce ride cancellations\
-   Improve completion rates\
-   Detect abnormal fare patterns (fraud signals)\
-   Optimize driver performance and allocation\
-   Identify peak demand windows

------------------------------------------------------------------------

## 🧠 Key Analytical Capabilities

-   Dimensional Data Modeling (Star Schema)
-   KPI Engineering (Completion Rate, Cancellation Rate, Revenue
    Metrics)
-   Funnel Analysis (Request → Completion)
-   Fraud Detection using derived fare-per-km thresholds
-   Driver Performance Benchmarking
-   Hourly & Peak Demand Analysis
-   Grid-Based Location Clustering
-   Pre-aggregated Reporting Layer for BI Optimization

------------------------------------------------------------------------

## 🧱 Dimensional Data Model

### Fact Table

**Fact_Ride_Transactions** - ride_id (PK) - user_id (FK) - driver_id
(FK) - time_key (FK) - location_key (FK) - distance_km - fare_amount -
ride_status - cancellation_flag - fraud_flag

### Dimension Tables

-   Dim_User
-   Dim_Driver
-   Dim_Time
-   Dim_Location

------------------------------------------------------------------------

## 🏗 Data Flow Architecture

Raw CSV Data\
↓\
Data Cleaning (Python)\
↓\
Normalized SQL Tables\
↓\
Dimensional Modeling (Star Schema)\
↓\
Pre-Aggregated KPI Layer\
↓\
Power BI Executive Dashboard

------------------------------------------------------------------------

## 📊 KPI Snapshot (Sample)

  KPI                 Value   Insight
  ------------------- ------- -----------------------------------
  Completion Rate     82%     Peak-hour supply-demand imbalance
  Cancellation Rate   18%     Higher during 8--9 PM
  Fraud Flag Rate     3%      Outlier fare-per-km detected
  Avg Fare per KM     ₹18.4   Zone variance observed

------------------------------------------------------------------------

## 🔎 Fraud Detection Logic

``` sql
CASE 
  WHEN (fare_amount / distance_km) > threshold 
       AND distance_km < minimum_distance
  THEN 1
  ELSE 0
END AS fraud_flag
```

------------------------------------------------------------------------

## ⚡ Performance Optimization

-   Indexed foreign keys\
-   Pre-aggregated KPI tables\
-   CTE-based window functions\
-   Reduced scan cost via grouping strategy

------------------------------------------------------------------------

## 🛠 Tech Stack

-   SQL\
-   Python\
-   Power BI\
-   CSV Structured Data\
-   Dimensional Modeling

------------------------------------------------------------------------

## 🚀 How to Run

1.  Execute schema setup script\
2.  Load cleaned data\
3.  Run KPI queries\
4.  Connect BI layer

------------------------------------------------------------------------

## 🔮 Future Enhancements

-   Add accepted_at timestamp\
-   Implement geohashing\
-   Add statistical anomaly detection\
-   Automate ETL process\
-   Build driver scoring system

------------------------------------------------------------------------

## 📌 Interview Positioning

"I designed a dimensional data model for ride-level analytics to
identify supply-demand mismatches and detect abnormal fare patterns. I
implemented KPI engineering, fraud flag logic, and performance
benchmarking using SQL window functions and pre-aggregation strategies."
