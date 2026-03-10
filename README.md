# 🚖 Ride Sharing Analytics | SQL & Power BI

## Project Overview

This project analyzes ride-level data from a simulated ride-sharing platform to understand operational performance, demand patterns, and driver efficiency.

The objective of the analysis is to explore how ride-sharing platforms monitor key operational metrics such as ride completion rate, cancellations, revenue performance, and driver activity in order to improve service reliability and platform efficiency.

The analysis was performed using **Python for data preparation, SQL for analytical queries, and Power BI for visualization.**

---

## Business Questions

The project focuses on answering several operational questions:

- What percentage of ride requests are successfully completed?
- When does the platform experience peak ride demand?
- How do cancellations affect overall platform efficiency?
- Which drivers contribute the most revenue?
- Are there any rides with unusually high fare relative to distance?

These insights help illustrate how ride-sharing companies can improve **driver allocation, operational efficiency, and revenue performance.**

---

## Project Workflow

The analysis follows a typical analytics workflow:

 1. Raw Data (CSV) 

 2. Data Cleaning (Python)

 3. Structured Tables (SQL)

 4. Analytical Queries
 
 5. Power BI Dashboards



---
## Dataset

The dataset represents simplified operational data for a ride-sharing platform.

### Main Tables

**rides**

- ride_id  
- user_id  
- driver_id  
- requested_at  
- distance_km  
- fare  
- ride_status  

**drivers**

- driver_id  
- name  
- signup_date  
- is_active  

**users**

- user_id  
- signup_date  

---

## SQL Analysis

SQL was used to compute the key operational metrics and perform the main analysis.

Key analyses include:

- Core platform KPIs (rides, completion rate, cancellation rate, revenue)
- Hourly demand analysis to identify peak ride periods
- Ride funnel analysis from request to completion
- Driver performance evaluation
- Fare anomaly detection using fare-per-kilometer calculations

The SQL queries make use of:

- aggregation functions (`COUNT`, `SUM`, `AVG`)
- conditional logic (`CASE`)
- joins between rides and driver data
- window functions for outlier detection

---

### Dashboard Overview

**Executive Overview**

![1](<Executive_Overview Dashboard.png>)
<img width="1332" height="746" alt="Driver_Performance Dashboard" src="https://github.com/user-attachments/assets/871d507a-3bfe-4e1c-b1d1-f6a5248a8d55" />

**Driver Performance**

![2](<Driver_Performance Dashboard.png>)

---

### Executive Overview

This dashboard focuses on overall platform performance.

Key metrics displayed:

- Total rides
- Completion rate
- Cancellation rate
- Total revenue
- Average fare
- Peak demand hour

Visualizations include:

- Hourly ride demand trend
- Hourly revenue trend
- Demand vs completion comparison

This dashboard provides a quick overview of how efficiently the platform is operating.

---

### Driver Performance

The second dashboard focuses on driver-level performance.

Key metrics include:

- Total active drivers
- Average driver completion rate
- Total driver revenue

Visual analysis includes:

- Top drivers by revenue
- Drivers with the lowest completion rates
- Revenue vs completion rate comparison

This helps highlight differences in driver performance and contribution to platform revenue.

---

## Example Insights

Some observations from the analysis include:

- Ride demand is highest during **evening commute hours**, indicating peak platform usage.
- Completion rates decrease slightly during high-demand periods, suggesting potential **driver supply constraints**.
- Driver revenue varies significantly across drivers, indicating differences in ride allocation or driver activity.
- A small number of rides show unusually high **fare-per-kilometer values**, which may indicate pricing anomalies.

---

## Tools Used

- **Python** – data cleaning and preprocessing  
- **SQL** – analytical queries and KPI calculations  
- **Power BI** – dashboard visualization  
- **GitHub** – version control and project documentation  

---

## Key Learnings

Through this project I practiced:

- transforming raw datasets into structured analytical tables
- writing SQL queries for operational KPI analysis
- analyzing ride demand patterns and driver performance
- building dashboards to communicate analytical insights

---

## Author

Data Analyst Portfolio Project  
Ride-Sharing Operational Analytics
