# 🏭 Azure Data Factory (ADF) – Ingestion Pipeline Documentation  
## AdventureWorks Azure Data Engineering Project

This document explains how Azure Data Factory (ADF) is used in the pipeline to ingest raw AdventureWorks CSV files into the **Bronze Layer** of the Lakehouse.

ADF serves as the **orchestration and ingestion engine** for the project.

---

# 1️⃣ Purpose of Azure Data Factory in This Pipeline

Azure Data Factory is responsible for:

- Extracting raw CSV files from GitHub or external storage  
- Copying them into **ADLS Gen2 Bronze Layer**  
- Automating ingestion through pipelines  
- Supporting future scheduling / triggers  
- Acting as the first step in the Medallion Architecture workflow  

ADF ensures **reliable, repeatable ingestion** of raw data.

---

# 2️⃣ Pipeline Architecture

 ADF pipeline follows this pattern:

Components used:
- **Linked Service (HTTP)** → connects to source CSV URLs  
- **Linked Service (ADLS Gen2)** → connects to lake storage  
- **Datasets** → parameterized for dynamic file paths  
- **Copy Activity** → moves files from source to ADLS  
- **Pipeline Parameters** → allows dynamic ingestion  

---

# 3️⃣ Dynamic Parameterized Pipeline

The ingestion pipeline supports **dynamic loading**, meaning:

- Any new CSV file in the source  
- Any new year or table  
- Any change in file names  

…can be ingested **without changing the pipeline**.

### Key Parameters:
- `fileName`
- `sourcePath`
- `destinationPath`

Example:

