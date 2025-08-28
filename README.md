# Air-Quality-Analysis
Project on Air Quality Analysis using SQL Server &amp; Power BI 🌍

📊 Project Report: Air Quality Insights – Identifying Critical Pollutants
1. Introduction

Air pollution is one of the most pressing environmental challenges, impacting both human health and climate. This project leverages government-provided air quality datasets to analyze pollutant levels across different regions and identify the critical pollutants responsible for deteriorating air quality.

The project integrates SQL Server (SSMS) for data normalization and cleaning, and Power BI for visualization and analysis.

2. Data Collection

Source: Open Government Data (OGD) Platform India – Air Quality Data.

Format: CSV files containing daily pollutant measurements across multiple monitoring stations.

Key attributes:

StationID – Unique ID for each air quality monitoring station.

State – Name of the state.

PollutantCode – Type of pollutant (PM10, PM2.5, SO2, NO2, CO, Ozone, NH3, etc.).

PollutantMin, PollutantMax, PollutantAvg – Minimum, maximum, and average concentrations of pollutants recorded.

Date – Recording date.

3. Data Preprocessing & Normalization (SQL Server)

The raw dataset was first loaded into SQL Server Management Studio (SSMS) for preprocessing.

Steps:

Import data into SQL Server using SQL Server Import Wizard.

Data Cleaning:

Removed null and duplicate records.

Handled inconsistent pollutant codes (e.g., PM-10 vs PM10).

Data Normalization:

To ensure clean and optimized reporting, the dataset was normalized and structured in a star schema.

Fact Table:

Dim_Measurement → Information about states/regions (MeasurementID, Date, PollutantMin, PollutantMax, PollutantAvg, StationID, etc).

Dimension Tables:

Dim_Stations → Details of monitoring stations (StationID, StationName, LocationID, etc.).

Fact_Location → Stores pollutant measurement values (LocationID, City, States).

Dim_Pollutants → Metadata of pollutants (PollutantCode, PollutantName).

This 1 fact + 3 dimensions structure (total 4 tables) ensures efficient querying and seamless integration with Power BI.

4. Power BI – Data Modeling

The SQL Server database was connected to Power BI using the DirectQuery method to ensure real-time data access.

The following relationships were established to maintain a proper star schema:

Fact_Pollutants[PollutantID] → Dim_Measurement[PollutantID]

Dim_Stations[StationID] → Dim_Measurement[StationID]

Fact_Locations[LocationID] → Dim_Stations[LocationID]

This relational structure enabled hierarchical filtering, cross-report drill-downs, and accurate aggregation of pollutants across stations and states.

5. Dashboard Development
Dashboard Title:

“Air Quality Insights: Identifying Critical Pollutants”

Key Visuals & Outcomes:
1️⃣ KPI Cards

Sum of PollutantAvg = 141.19K

Count of Stations = 483

Sum of PollutantMax = 249.06K

📌 Insight: This shows the scale of data analyzed and provides a quick overview of pollution severity.

2️⃣ 100% Stacked Column Chart

Comparing PollutantMin, PollutantMax, PollutantAvg across pollutants.

📌 Insight: PM10 and PM2.5 consistently dominate pollution levels compared to gases like SO2, NO2, NH3.

3️⃣ Key Influencer Visual

Analyzes “What influences PollutantAvg to increase”.

When PollutantCode = PM10 → PollutantAvg increases by 27.83.

When PollutantCode = PM2.5 → PollutantAvg increases by 12.99.

📌 Insight: PM10 and PM2.5 are the most critical pollutants influencing poor air quality.

4️⃣ Pie Chart (Pollutant-wise Severity)

PM10: 28.5%

PM2.5: 23.9%

CO: 16.68%

Ozone: 11.64%

NO2: 11.07%

Others: Minor contributions.

📌 Insight: PM10 & PM2.5 together contribute over 50% of overall pollution.

5️⃣ Bar Chart (Station-wise Pollution Levels)

Displays average pollution levels across different stations.

📌 Insight: Certain stations consistently record higher levels of pollutants, indicating local hotspots requiring intervention.

6. Conclusion

PM10 and PM2.5 are the dominant pollutants impacting air quality.

Certain monitoring stations are hotspots, needing stricter emission control.

The combination of SQL Server + Power BI provided a powerful way to preprocess, normalize, and visualize government data.

This dashboard can assist policymakers in targeted interventions for pollution control.

7. Future Scope

Automate daily/weekly data refresh from government APIs.

Add forecasting models in Power BI to predict future pollution trends.

Integrate health impact data (e.g., hospital visits due to respiratory issues).

✅ This project demonstrates end-to-end data analytics workflow: Data Collection → SQL Cleaning & Normalization → Power BI Modeling → Interactive Dashboard.
