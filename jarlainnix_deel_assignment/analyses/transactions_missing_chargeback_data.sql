-- Which transactions are missing chargeback data?
  select * from {{ ref('stg_globepay__acceptance_report')}}
  left join {{ ref('stg_globepay__chargeback_report')}} as chargeback
  using(external_ref)
  where chargeback.external_ref is null