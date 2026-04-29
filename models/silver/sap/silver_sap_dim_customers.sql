
select 
row_number() over (order by CustomerId) as CustomerKey,
*
from
(
select 
customer_id as CustomerId,
customer_name as CustomerName,
customer_type as CustomerType,
primary_freight_type AS Industry,
NULL AS AccountTier,
NULL AS ContractType,
contract_start_date as ContractStartDate,
NULL AS ContractEndDate,
credit_terms_days as  PaymentTerms,
NULL CreditLimit,
NULL SalesRep,
NULL Region,
annual_revenue_potential as EstimatedAnnualRevenue,
NULL AS ActualAnnualRevenueBand,
ROW_NUMBER() OVER (ORDER BY annual_revenue_potential DESC) as  PriorityLevel,
NULL AS ServiceLevelAgreement,
CASE WHEN lower(PRIMARY_FREIGHT_TYPE) in ('Consumer Goods','Food/Beverage') then True else false end AS TemperatureControlRequiredFlag,
null as HazmatCustomerFlag
from {{ ref('bronze_sap_customers') }} WHERE ACCOUNT_STATUS = 'Active'
) c
