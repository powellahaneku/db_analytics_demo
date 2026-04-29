SELECT 
row_number() over (order by FacilityId) as FacilityKey,
*
FROM (
select
facility_id as FacilityId,
facility_name as FacilityName,
facility_type as FacilityType,
NULL AS AddressLine1,
city as City,
state as State,
NULL AS ZipCode,
NULL AS Country,
latitude as Latitude,
longitude as Longitude,
NULL AS Region,
NULL AS Timezone,
NULL AS OperatingHours,
DOCK_DOORS AS DockDoorCount,
NULL AS YardCapacity,
NULL AS WarehouseCapacitySqft,
NULL AS RefrigerationAvailableFlag,
NULL AS HazmatStorageFlag,
NULL AS SecurityLevel,
CreatedDate,
SourceSystem
--select *
from {{ ref('bronze_sap_facilities') }}) f