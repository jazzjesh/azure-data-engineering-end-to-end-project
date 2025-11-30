# 📘 Architecture Explanation – AdventureWorks Lakehouse

This document explains the overall architecture used in the AdventureWorks Azure Data Engineering Project.  
It highlights how the system moves data from **raw CSVs → cleaned parquet → analytics-ready tables** using the **Medallion Architecture (Bronze → Silver → Gold)**.

---

## 🏗️ High-Level Architecture Overview

The project follows a modern **Lakehouse architecture** deployed on Azure:

1. **Azure Data Factory (ADF)**
   - Performs ingestion of CSV data
   - Parameterized pipelines for dynamic loading
   - Stores raw files in ADLS Gen2

2. **Azure Data Lake Storage Gen2 (ADLS)**
   - Holds the three-layer storage:
     - **Bronze**: raw CSV files
     - **Silver**: cleaned Parquet files
     - **Gold**: aggregated tables for analytics

3. **Azure Databricks**
   - Executes PySpark transformations
   - Cleans and enriches data
   - Creates normalized and analytics datasets

4. **Azure Synapse Serverless SQL**
   - Uses OPENROWSET to read Parquet from ADLS
   - Exposes Gold layer via SQL Views
   - Power BI connects to Synapse endpoint

5. **Power BI**
   - Final reporting layer
   - Uses Gold tables for dashboard visuals

---

## 🔄 End-to-End Flow

### **1. Ingestion**
- ADF reads CSVs from GitHub/external source
- Loads them into **Bronze zone**

### **2. Transformation**
- Databricks applies schema, fixes data types
- Performs joins & business rules
- Writes cleaned data to **Silver zone**

### **3. Modeling**
- Databricks creates fact & dimension tables
- Synapse exposes them using SQL views
- This becomes the **Gold zone**

---

## 💡 Why This Architecture?

### ✔ Decoupled storage + compute  
    Synapse and Databricks query ADLS without duplication  
### ✔ Scalable for future datasets  
### ✔ Parquet reduces cost and increases performance  
### ✔ Follows modern DE best practices  
### ✔ Easy integration with analytics tools like Power BI  

---

## 📌 Summary

This architecture enables:
- Robust ingestion  
- Clean & validated transformations  
- Optimized data modeling  
- Enterprise-level analytics  

This layered approach ensures data is **accurate**, **clean**, and **ready for reporting**, following best practices used in real-world Azure Data Engineering projects.

