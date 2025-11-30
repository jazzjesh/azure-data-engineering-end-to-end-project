CREATE DATABASE SCOPED CREDENTIAL jesh_ade
WITH IDENTITY = 'Managed Identity';

CREATE EXTERNAL DATA SOURCE source_silver WITH
(
    Location ='https://adeprodatalake.blob.core.windows.net/silver',
    CREDENTIAL=jesh_ade
)
CREATE EXTERNAL DATA SOURCE source_gold WITH
(
    Location ='https://adeprodatalake.blob.core.windows.net/gold',
    CREDENTIAL=jesh_ade
)
CREATE EXTERNAL FILE FORMAT ParquetFormat
WITH (
    FORMAT_TYPE = PARQUET
);

CREATE EXTERNAL TABLE gold.extsales
with(
    LOCATION='extsales',
    DATA_SOURCE= source_gold,
    FILE_FORMAT=ParquetFormat
) as Select * from gold.sales