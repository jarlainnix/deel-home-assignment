{% set currencies = ["CAD", "EUR", "MXN", "USD", "SGD", "AUD", "GBP"] %}
with acceptance as (

    select * from {{ ref('stg_globepay__acceptance_report')}}

),

chargeback as (

    select * from {{ ref('stg_globepay__chargeback_report')}}

),

final as (

    select
        *,
        case
        {% for currency in currencies -%}
        when currency = '{{ currency }}' then amount * {{ currency }}_currency_rate
        {% endfor %}
        end as amount_usd
    from acceptance
    left join chargeback
    using(external_ref)

)

select * from final