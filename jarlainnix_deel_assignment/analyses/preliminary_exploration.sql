
select
    count(1) as total_rows,
    count(distinct external_ref) as external_cnt,
    count(distinct acceptance_ref) as ref_cnt,
    min(date_time) as min_data,
    max(date_time) as max_data,
    date_diff(max(date_time),min(date_time), day) as data_range_in_days,
    count(case when acceptance_state = 'ACCEPTED' then 1 end) as accepted_transactions,
    count(case when acceptance_state = 'DECLINED' then 1 end) as declined_transactions,
    safe_divide(count(case when acceptance_state = 'ACCEPTED' then 1 end),count(1)) as global_acceptance_rate,
    count(case when cvv_provided then 1 end) as was_cvv_provided,
    count(case when not cvv_provided then 1 end) as cvv_not_provided,
    count(distinct country) as unique_countries_count,
    min(case when currency = 'USD' then amount end) as min_amount_usd,
    max(case when currency = 'USD' then amount end) as max_amount_usd,

from {{ ref('stg_globepay__acceptance_report')}}