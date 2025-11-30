# 🥉🥈🥇 Medallion Architecture Overview  
### AdventureWorks Azure Data Engineering Project

The Medallion Architecture is a **multi-layered data design pattern** used in lakehouse systems to improve **data quality, reliability, and business value**.  
This project implements the architecture using:

- Azure Data Factory  
- Azure Data Lake Storage Gen2  
- Azure Databricks  
- Azure Synapse Serverless SQL  
- Power BI  

---

# 🥉 Bronze Layer — Raw Data

## 📌 Purpose
The Bronze layer stores **raw, unprocessed data** exactly as it was ingested.

## 📁 Source Examples  
- Raw CSV files extracted from AdventureWorks  
- Data copied into ADLS via Azure Data Factory  
- Files directly from public GitHub repo or storage source  

## 🧩 Characteristics
- No transformations  
- Contains duplicates, nulls, messy columns  
- Serves as the **single source of truth**  
- Allows reprocessing if needed  

## ✔ What this project uses in Bronze
- AdventureWorks_Calendar  
- AdventureWorks_Customers  
- AdventureWorks_Products  
- AdventureWorks_Sales (2015–2017)

Stored as raw CSV files inside ADLS Gen2.

---

# 🥈 Silver Layer — Cleaned & Enriched Data

## 📌 Purpose
The Silver layer contains **cleaned, standardized, and validated** datasets.

## 🧼 Transformations performed
- Remove null/invalid rows  
- Standardize column names  
- Cast data types  
- Join reference tables  
- Deduplicate  
- Normalize fields  

## 🧩 Why Silver exists
- Ensures consistency  
- Reduces errors  
- Creates business-ready entities  

## ✔ Example outputs in this project
- Cleaned Customer dataset (Parquet)  
- Cleaned Product dimension  
- Clean Calendar dimension  

Written as optimized **Parquet files** in ADLS.

---

# 🥇 Gold Layer — Analytics & Star Schema

## 📌 Purpose
The Gold layer provides **analytics-ready** data for BI, reporting, and machine learning.

## ⭐ What Gold includes
- Fact tables (FactSales)  
- Dimension tables (DimCustomer, DimProduct, DimDate)  
- Aggregated metrics  
- Keys and relationships for dashboards  

## 📊 Consumption Layer
- Azure Synapse Serverless SQL  
- Power BI dashboards  
- External analytics tools  

## ✔ Benefits
- Fast query performance  
- Business-friendly models  
- Supports complex reporting  

---

# 🎯 Summary

| Layer | Description | Format | Used By |
|-------|-------------|--------|---------|
| **Bronze** | Raw ingested data | CSV | Internal processing |
| **Silver** | Clean, typed, validated | Parquet | Modeling & enrichment |
| **Gold** | Star schema + analytics tables | Parquet/Views | Power BI & reporting |

The Medallion Architecture ensures **data reliability, scalability, and clarity**, allowing analysts and engineers to work efficiently while maintaining data quality.

This structure mirrors **real-world enterprise Azure Data Engineering** systems.

