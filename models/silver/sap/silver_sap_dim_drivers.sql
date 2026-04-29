
select 
CAST(ROW_NUMBER() OVER (ORDER BY DriverId) AS BIGINT) AS DriverKey,
*
FROM
(
select
driver_id as DriverId,
first_name as FirstName,
last_name as LastName,
concat_ws(' ',first_name,last_name) as FullName,
date_of_birth as DateOfBirth,
datediff(YEAR,date_of_birth,current_date()) AS Age,
NULL AS Gender,
hire_date as HireDate,
termination_date as TerminationDate,
CASE WHEN TERMINATION_DATE IS NULL THEN 'ACTIVE' ELSE 'TERMINATED' END AS EmploymentStatus,
NULL as EmploymentType,
case
    when termination_date is not null then datediff(YEAR,hire_date,termination_date) else datediff(YEAR,hire_date,current_date())
end AS YearsOfExperience,
cdl_class as CdlClass,
NULL AS Endorsements,
license_state as LicenseState,
NULL as LicenseExpirationDate,
NULL AS MedicalCertExpiration,
True as HazmatCertFlag,
True as UnionFlag,
NULL AS HomeTerminal,
NULL AS ManagerName,
'Paycheck' as PayType,
NULL AS SafetyScore,
NULL AS PerformanceRating,
CASE WHEN TERMINATION_DATE IS NULL THEN True ELSE False END as ActiveFlag,
True as CurrentFlag,
CreatedDate,
SourceSystem
from {{ ref('bronze_sap_drivers') }}) d
