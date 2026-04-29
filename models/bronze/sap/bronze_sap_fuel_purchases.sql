select
    cast(FUEL_PURCHASE_ID as varchar(45))              as FUEL_PURCHASE_ID,
    cast(TRIP_ID as varchar(45))                       as TRIP_ID,
    cast(TRUCK_ID as varchar(45))                      as TRUCK_ID,
    cast(DRIVER_ID as varchar(45))                     as DRIVER_ID,
    try_cast(PURCHASE_DATE as date)                    as PURCHASE_DATE,
    cast(LOCATION_CITY as varchar(45))                 as LOCATION_CITY,
    cast(LOCATION_STATE as varchar(2))                as LOCATION_STATE,
    try_cast(GALLONS as number(10,2))                  as GALLONS,
    try_cast(PRICE_PER_GALLON as number(10,4))         as PRICE_PER_GALLON,
    try_cast(TOTAL_COST as number(12,2))               as TOTAL_COST,
    cast(FUEL_CARD_NUMBER as varchar(45))              as FUEL_CARD_NUMBER,
    cast(CreatedDate as timestamp) as CreatedDate,
cast(SourceSystem as varchar) as SourceSystem
from {{ source('sap', 'sap_logistics_fuel_purchases') }}
cross join (select current_timestamp() as CreatedDate) c
cross join (select 'SAP' as SourceSystem) s