# 🌍 Global Seismic Risk Profiler

An end‑to‑end data pipeline built on **Microsoft Fabric** that transforms raw earthquake telemetry from the **USGS API** into actionable business insights. Using the **Medallion Architecture (Bronze → Silver → Gold)**, the pipeline ingests, cleans, and enriches seismic data to produce **risk‑ready datasets** for insurance, urban planning, and disaster preparedness.

---

## 📋 Business Problem (Summary)
Insurance and disaster‑management firms struggle to use raw USGS earthquake data because it is too granular, inconsistent, and not business‑ready. This project solves that by building a pipeline that delivers **severity scores, geospatial bins, and risk categories**, enabling actuaries, planners, and analysts to make informed decisions on **premium pricing, urban safety, and disaster response**.

👉 [Read the full Business Problem]([BUSINESS_PROBLEM.md](https://github.com/Mru017/Global-Seismic-Risk-Profiler/blob/danger-zone/Buniness%20Problem.pdf))

---

## 🏗️ Project Architecture
- **Bronze Layer**: Ingest raw USGS earthquake data in its original format for traceability.  
- **Silver Layer**: Clean, transform, and consolidate data to ensure schema consistency and remove duplicates.  
- **Gold Layer**: Apply business logic (risk scoring, severity classification, geospatial aggregation) to create business‑ready datasets.  
- **SQL Queries**: Enable ad‑hoc risk analysis and feed into Power BI dashboards.  

---

## 🚀 Tech Stack
- **Microsoft Fabric** (Data Engineering, Lakehouse, Power BI)  
- **Python / PySpark** (data ingestion & transformation)  
- **SQL** (analytical queries)  
- **Power BI** (reporting & visualization)  

---

## 📊 Outputs
- Cleaned and consolidated earthquake datasets.  
- Risk‑ready tables with severity categories and geospatial bins.  
- Power BI dashboards for seismic risk insights.  

---

## 🏆 Impact
- **Insurance**: Accurate premium pricing in earthquake‑prone zones.  
- **Urban Planning**: Identify high‑risk regions for infrastructure development.  
- **Disaster Preparedness**: Support agencies in resource allocation and response strategies.  

---

## 📸 Visuals
(Add screenshots of your architecture diagram, lineage view, and Power BI dashboard here.)

---

## 🔗 Next Steps
- Expand pipeline to include other natural hazards (floods, hurricanes).  
- Automate CI/CD with GitHub Actions.  
- Enhance dashboards with predictive analytics.  

