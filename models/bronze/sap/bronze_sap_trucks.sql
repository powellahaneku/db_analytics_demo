select
    cast(TRUCK_ID as varchar(45))                     as TRUCK_ID,
    cast(UNIT_NUMBER as varchar(45))                  as UNIT_NUMBER,
    cast(MAKE as varchar(45))                         as MAKE,
    try_cast(MODEL_YEAR as number(4,0))               as MODEL_YEAR,
    cast(VIN as varchar(45))                          as VIN,
    try_cast(ACQUISITION_DATE as date)                as ACQUISITION_DATE,
    try_cast(ACQUISITION_MILEAGE as number(10,0))     as ACQUISITION_MILEAGE,
    cast(FUEL_TYPE as varchar(45))                    as FUEL_TYPE,
    try_cast(TANK_CAPACITY_GALLONS as number(10,2))   as TANK_CAPACITY_GALLONS,
    cast(STATUS as varchar(45))                       as STATUS,
    cast(HOME_TERMINAL as varchar(45))                as HOME_TERMINAL,
    cast(CreatedDate as timestamp) as CreatedDate,
cast(SourceSystem as varchar) as SourceSystem
from {{ source('sap', 'sap_logistics_trucks') }}
cross join (select current_timestamp() as CreatedDate) c
cross join (select 'SAP' as SourceSystem) s