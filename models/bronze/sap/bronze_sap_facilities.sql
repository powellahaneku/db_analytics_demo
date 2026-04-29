select
    cast(FACILITY_ID as varchar(45))         as FACILITY_ID,
    cast(FACILITY_NAME as varchar(45))       as FACILITY_NAME,
    cast(FACILITY_TYPE as varchar(45))       as FACILITY_TYPE,
    cast(CITY as varchar(45))                as CITY,
    cast(STATE as varchar(45))               as STATE,
    try_cast(LATITUDE as number(9,6))        as LATITUDE,
    try_cast(LONGITUDE as number(9,6))       as LONGITUDE,
    try_cast(DOCK_DOORS as number(10,0))     as DOCK_DOORS,
    cast(OPERATING_HOURS as varchar(45))     as OPERATING_HOURS,
    cast(CreatedDate as timestamp) as CreatedDate,
cast(SourceSystem as varchar) as SourceSystem
from {{ source('sap', 'sap_logistics_facilities') }}
cross join (select current_timestamp() as CreatedDate) c
cross join (select 'SAP' as SourceSystem) s