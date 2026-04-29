select
    cast(EVENT_ID as varchar(45))                        as EVENT_ID,
    cast(LOAD_ID as varchar(45))                         as LOAD_ID,
    cast(TRIP_ID as varchar(45))                         as TRIP_ID,
    cast(EVENT_TYPE as varchar(45))                      as EVENT_TYPE,
    cast(FACILITY_ID as varchar(45))                     as FACILITY_ID,
    try_cast(SCHEDULED_DATETIME as timestamp)            as SCHEDULED_DATETIME,
    try_cast(ACTUAL_DATETIME as timestamp)               as ACTUAL_DATETIME,
    try_cast(DETENTION_MINUTES as number(10,0))          as DETENTION_MINUTES,
    try_cast(ON_TIME_FLAG as boolean)                    as ON_TIME_FLAG,
    cast(LOCATION_CITY as varchar(45))                   as LOCATION_CITY,
    cast(LOCATION_STATE as varchar(2))                  as LOCATION_STATE,
    cast(CreatedDate as timestamp) as CreatedDate,
cast(SourceSystem as varchar) as SourceSystem
from {{ source('sap', 'sap_logistics_delivery_events') }}
cross join (select current_timestamp() as CreatedDate) c
cross join (select 'SAP' as SourceSystem) s