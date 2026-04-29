select 
cast(customer_id as varchar(45)) as customer_id,
cast(customer_name as varchar(45)) as customer_name,
cast(customer_type as varchar(45)) as customer_type,
cast(credit_terms_days as int) as credit_terms_days,
cast(primary_freight_type as varchar(45)) as primary_freight_type,
cast(account_status as varchar(45)) as account_status,
cast(contract_start_date as date) as contract_start_date,
cast(annual_revenue_potential as decimal(18,2)) as annual_revenue_potential,
cast(CreatedDate as timestamp) as CreatedDate,
cast(SourceSystem as varchar) as SourceSystem
from {{ source('sap', 'sap_logistics_customers') }}
cross join (select current_timestamp() as CreatedDate) c
cross join (select 'SAP' as SourceSystem) s