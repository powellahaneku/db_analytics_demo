select
    cast(LOAD_ID as varchar(45))                     as LOAD_ID,
    cast(CUSTOMER_ID as varchar(45))                 as CUSTOMER_ID,
    cast(ROUTE_ID as varchar(45))                    as ROUTE_ID,
    try_cast(LOAD_DATE as date)                      as LOAD_DATE,
    cast(LOAD_TYPE as varchar(45))                   as LOAD_TYPE,
    try_cast(WEIGHT_LBS as number(12,2))             as WEIGHT_LBS,
    try_cast(PIECES as number(10,0))                 as PIECES,
    try_cast(REVENUE as number(12,2))                as REVENUE,
    try_cast(UEL_SURCHARGE as number(12,2))          as UEL_SURCHARGE,
    try_cast(ACCESSORIAL_CHARGES as number(12,2))    as ACCESSORIAL_CHARGES,
    cast(LOAD_STATUS as varchar(45))                 as LOAD_STATUS,
    cast(BOOKING_TYPE as varchar(45))                as BOOKING_TYPE,
    cast(CreatedDate as timestamp) as CreatedDate,
    cast(SourceSystem as varchar) as SourceSystem
from {{ source('sap', 'sap_logistics_loads') }}
cross join (select current_timestamp() as CreatedDate) c
cross join (select 'SAP' as SourceSystem) s