select 
ROW_NUMBER() OVER (ORDER BY TruckId) AS TruckKey,
* 
FROM(
SELECT
TRUCK_ID AS TruckId,
VIN AS Vin,
UNIT_NUMBER AS UnitNumber,
MAKE AS  Make,
NULL AS Model,
MODEL_YEAR ModelYear,
NULL AS TruckType,
FUEL_TYPE FuelType,
NULL AS EngineType,
NULL AS TransmissionType,
ACQUISITION_DATE AS AcquisitionDate,
'Commercial' AS AcquisitionType,
NULL AS PurchasePrice,
NULL AS DepreciationClass,
NULL as OwnershipStatus,
NULL AS AssignedTerminal,
NULL AS GrossVehicleWeightRating,
NULL AS MileageBand,
NULL AS CurrentOdometer,
NULL AS WarrantyExpirationDate,
NULL AS ServiceStatus,
NULL AS InsurancePolicyNumber,
NULL AS InsuranceExpirationDate,
NULL AS GpsEnabledFlag,
NULL AS EldEnabledFlag,
CreatedDate,
SourceSystem
from {{ ref('bronze_sap_trucks') }} ) t