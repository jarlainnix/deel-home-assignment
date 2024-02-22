-- List the countries where the amount of declined transactions went over $25M
select
country,
sum(amount_usd) as total_transactions_amount_usd
from {{ ref('payments') }}
where acceptance_state = 'DECLINED'
group by 1
having sum(amount_usd) >= 25000000
order by 2 desc