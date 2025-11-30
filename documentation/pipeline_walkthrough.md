# Full ETL Documentation – AdventureWorks Azure Lakehouse  
## Bronze → Silver → Gold Medallion Architecture

### ETL Pipeline Summary  
| Layer  | Purpose                              | Tool Used                     | Input     | Output              | Format   | Consumed By          |
|--------|--------------------------------------|-------------------------------|-----------|---------------------|----------|----------------------|
| Bronze | Raw ingestion – exact copy of source | Azure Data Factory            | CSVs      | Raw files           | CSV      | Re-processing only   |
| Silver | Cleansing, standardization, schema enforcement | Azure Databricks (PySpark) | Bronze CSVs | Clean tables        | Parquet  | Gold layer & analysts|
| Gold   | Business-ready star schema (facts & dimensions) | Databricks + Synapse Serverless | Silver Parquet | Fact/Dim tables + Views | Parquet + SQL Views | Power BI, SQL queries|

### 1. Bronze Layer – Raw Data Ingestion  
Purpose: Land raw files exactly as received – full auditability and re-playability  
Tool: Azure Data Factory (single dynamic pipeline)  
Key Activities:  
- Lookup activity reads parameters.json  
- ForEach loop iterates over all datasets  
- Copy Activity writes files to ADLS Gen2 Bronze container  
- Zero transformation applied  
### 2. Silver Layer – Clean & Standardized Data  
Purpose: Produce high-quality, analysis-ready datasets  
Tool: Databricks PySpark notebooks  
Transformations applied (common across all tables):  
- Remove exact duplicates  
- Convert column names to snake_case  
- Trim whitespace, lowercase emails/text  
- Correct data types (String → Date, Decimal, Int)  
- Parse dates (various source formats → standard DATE)  
- Clean phone numbers (remove non-numeric)  
- Flag/filter invalid records  
- Write as snappy Parquet (partitioned where beneficial)
