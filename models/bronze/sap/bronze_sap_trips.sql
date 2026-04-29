select
    cast(TRIP_ID as varchar(45))                         as TRIP_ID,
    cast(LOAD_ID as varchar(45))                         as LOAD_ID,
    cast(DRIVER_ID as varchar(45))                       as DRIVER_ID,
    cast(TRUCK_ID as varchar(45))                        as TRUCK_ID,
    cast(TRAILER_ID as varchar(45))                      as TRAILER_ID,
    try_cast(DISPATCH_DATE as timestamp)                 as DISPATCH_DATE,
    try_cast(ACTUAL_DISTANCE_MILES as number(10,2))      as ACTUAL_DISTANCE_MILES,
    try_cast(ACTUAL_DURATION_HOURS as number(10,2))      as ACTUAL_DURATION_HOURS,
    try_cast(FUEL_GALLONS_USED as number(10,2))          as FUEL_GALLONS_USED,
    try_cast(AVERAGE_MPG as number(10,2))                as AVERAGE_MPG,
    try_cast(IDLE_TIME_HOURS as number(10,2))            as IDLE_TIME_HOURS,
    cast(TRIP_STATUS as varchar(45))                     as TRIP_STATUS,
    cast(CreatedDate as timestamp) as CreatedDate,
cast(SourceSystem as varchar) as SourceSystem
from {{ source('sap', 'sap_logistics_trips') }}
cross join (select current_timestamp() as CreatedDate) c
cross join (select 'SAP' as SourceSystem) s