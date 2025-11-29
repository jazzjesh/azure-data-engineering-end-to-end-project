# Azure Data Engineering End-to-End Project  
## AdventureWorks Lakehouse using Medallion Architecture

**By Jeshwanth Premkumar**  
[![GitHub](https://img.shields.io/badge/GitHub-jazzjesh-181717?style=flat&logo=github)](https://github.com/jazzjesh) 
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Jeshwanth%20Premkumar-0077B5?style=flat&logo=linkedin)](https://linkedin.com/in/jeshwanth-premkumar)

**Technologies Used**  
![Azure Data Factory](https://img.shields.io/badge/Azure%20Data%20Factory-0078D4?style=flat&logo=microsoftazure) 
![ADLS Gen2](https://img.shields.io/badge/ADLS%20Gen2-0078D4?style=flat&logo=microsoftazure) 
![Databricks](https://img.shields.io/badge/Databricks-E1351E?style=flat&logo=databricks) 
![Synapse](https://img.shields.io/badge/Azure%20Synapse-0078D4?style=flat&logo=microsoftazure) 
![Parquet](https://img.shields.io/badge/Parquet-FF6F61?style=flat) 
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=flat&logo=powerbi)

---

### Project Overview

This project demonstrates a **complete, production-ready Azure Data Engineering Lakehouse pipeline** using the **Medallion Architecture (Bronze → Silver → Gold) on the classic **AdventureWorks** dataset.

End-to-end flow covers:
- Ingestion & orchestration
- Data transformation (CSV → Clean Parquet)
- ADLS Gen2 as the lakehouse storage
- Synapse Serverless SQL for analytical modeling
- Power BI for dashboards

---

### High-Level Architecture

```mermaid
graph TD
    A[Source CSVs] --> B[Azure Data Factory<br/>Dynamic Ingestion]
    B --> C[BRONZE<br/>Raw Data in ADLS Gen2]
    C --> D[Databricks<br/>PySpark Transformations]
    D --> E[SILVER<br/>Cleaned & Optimized Parquet]
    E --> F[Synapse Serverless SQL<br/>Star Schema Modeling]
    F --> G[GOLD<br/>Fact & Dimension Tables]
    G --> H[Power BI<br/>Interactive Dashboards]
