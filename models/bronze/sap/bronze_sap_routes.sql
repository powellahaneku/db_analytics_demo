select
    cast(ROUTE_ID as varchar(45))                        as ROUTE_ID,
    cast(ORIGIN_CITY as varchar(45))                     as ORIGIN_CITY,
    cast(ORIGIN_STATE as varchar(45))                    as ORIGIN_STATE,
    cast(DESTINATION_CITY as varchar(45))                as DESTINATION_CITY,
    cast(DESTINATION_STATE as varchar(2))               as DESTINATION_STATE,
    try_cast(TYPICAL_DISTANCE_MILES as number(10,2))     as TYPICAL_DISTANCE_MILES,
    try_cast(BASE_RATE_PER_MILE as number(10,4))         as BASE_RATE_PER_MILE,
    try_cast(FUEL_SURCHARGE_RATE as number(10,4))        as FUEL_SURCHARGE_RATE,
    try_cast(TYPICAL_TRANSIT_DAYS as number(5,2))        as TYPICAL_TRANSIT_DAYS,
    cast(CreatedDate as timestamp) as CreatedDate,
cast(SourceSystem as varchar) as SourceSystem
from {{ source('sap', 'sap_logistics_routes') }}
cross join (select current_timestamp() as CreatedDate) c
cross join (select 'SAP' as SourceSystem) s