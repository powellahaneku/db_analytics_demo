select
    cast(TRAILER_ID as varchar(45))              as TRAILER_ID,
    cast(TRAILER_NUMBER as varchar(45))          as TRAILER_NUMBER,
    cast(TRAILER_TYPE as varchar(45))            as TRAILER_TYPE,
    try_cast(LENGTH_FEET as number(5,0))         as LENGTH_FEET,
    try_cast(MODEL_YEAR as number(4,0))          as MODEL_YEAR,
    cast(VIN as varchar(45))                     as VIN,
    try_cast(ACQUISITION_DATE as date)           as ACQUISITION_DATE,
    cast(STATUS as varchar(45))                  as STATUS,
    cast(CURRENT_LOCATION as varchar(45))        as CURRENT_LOCATION,
    cast(CreatedDate as timestamp) as CreatedDate,
cast(SourceSystem as varchar) as SourceSystem
from {{ source('sap', 'sap_logistics_trailers') }}
cross join (select current_timestamp() as CreatedDate) c
cross join (select 'SAP' as SourceSystem) s