select
row_number() over (order by RouteId) as RouteKey,
*
from 
(
select 
route_id as RouteId,
null as RouteCode,
null as OriginFacilityId,
null as DestinationFacilityId,
origin_city as OriginCity,
Origin_State as OriginState,
destination_city as DestinationCity,
destination_state as DestinationState,
null as RouteType,
null as LaneCategory,
typical_distance_miles as PlannedDistanceMiles,
null as StandardDriveHours,
typical_distance_miles as StandardTransitDays,
true as TollRoadFlag,
false as MountainRouteFlag,
null as  BorderCrossingFlag,
null as WeatherRiskLevel,
null as TrafficRiskLevel,
null as FuelStopPattern,
null as BaseRate,
fuel_surcharge_rate as FuelSurchargeMethod,
createddate,
sourcesystem
--select *
from {{ ref('bronze_sap_facilities') }}
) r