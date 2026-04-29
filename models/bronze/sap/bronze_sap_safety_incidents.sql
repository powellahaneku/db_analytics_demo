select
    cast(INCIDENT_ID as varchar(45))                    as INCIDENT_ID,
    cast(TRIP_ID as varchar(45))                        as TRIP_ID,
    cast(TRUCK_ID as varchar(45))                       as TRUCK_ID,
    cast(DRIVER_ID as varchar(45))                      as DRIVER_ID,
    try_cast(INCIDENT_DATE as date)                     as INCIDENT_DATE,
    cast(INCIDENT_TYPE as varchar(45))                  as INCIDENT_TYPE,
    cast(LOCATION_CITY as varchar(45))                  as LOCATION_CITY,
    cast(LOCATION_STATE as varchar(2))                 as LOCATION_STATE,
    try_cast(AT_FAULT_FLAG as boolean)                  as AT_FAULT_FLAG,
    try_cast(INJURY_FLAG as boolean)                    as INJURY_FLAG,
    try_cast(VEHICLE_DAMAGE_COST as number(12,2))       as VEHICLE_DAMAGE_COST,
    try_cast(CARGO_DAMAGE_COST as number(12,2))         as CARGO_DAMAGE_COST,
    try_cast(CLAIM_AMOUNT as number(12,2))              as CLAIM_AMOUNT,
    try_cast(PREVENTABLE_FLAG as boolean)               as PREVENTABLE_FLAG,
    cast(DESCRIPTION as varchar(255))                   as DESCRIPTION,
    cast(CreatedDate as timestamp) as CreatedDate,
cast(SourceSystem as varchar) as SourceSystem
from {{ source('sap', 'sap_logistics_safety_incidents') }}
cross join (select current_timestamp() as CreatedDate) c
cross join (select 'SAP' as SourceSystem) s