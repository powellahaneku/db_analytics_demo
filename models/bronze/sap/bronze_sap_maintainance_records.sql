select
    cast(MAINTENANCE_ID as varchar(45))                 as MAINTENANCE_ID,
    cast(TRUCK_ID as varchar(45))                       as TRUCK_ID,
    try_cast(MAINTENANCE_DATE as date)                  as MAINTENANCE_DATE,
    cast(MAINTENANCE_TYPE as varchar(45))               as MAINTENANCE_TYPE,
    try_cast(ODOMETER_READING as number(10,0))          as ODOMETER_READING,
    try_cast(LABOR_HOURS as number(10,2))               as LABOR_HOURS,
    try_cast(LABOR_COST as number(12,2))                as LABOR_COST,
    try_cast(PARTS_COST as number(12,2))                as PARTS_COST,
    try_cast(TOTAL_COST as number(12,2))                as TOTAL_COST,
    cast(FACILITY_LOCATION as varchar(45))              as FACILITY_LOCATION,
    try_cast(DOWNTIME_HOURS as number(10,2))            as DOWNTIME_HOURS,
    cast(SERVICE_DESCRIPTION as varchar(255))           as SERVICE_DESCRIPTION,
    cast(CreatedDate as timestamp) as CreatedDate,
cast(SourceSystem as varchar) as SourceSystem,
from {{ source('sap', 'sap_logistics_maintainance_records') }}
cross join (select current_timestamp() as CreatedDate) c
cross join (select 'SAP' as SourceSystem) s