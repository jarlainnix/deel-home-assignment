select
date(date_time) as date,
sum(case when acceptance_state = 'ACCEPTED' then 1 end) as accepted_transactions,
sum(case when acceptance_state = 'DECLINED' then 1 end) as declined_transactions,
count(1) as transaction_count,
safe_divide(sum(case when acceptance_state = 'ACCEPTED' then 1 end), count(1)) as acceptance_rate
from {{ ref('payments') }}
group by 1
order by 1 desc
;