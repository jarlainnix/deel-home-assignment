
{% set acceptance_columns = ["ref", "status", "source", "state"] %}
{% set currencies = ["CAD", "EUR", "MXN", "USD", "SGD", "AUD", "GBP"] %}

with src as (
      select * from {{ source('globepay', 'globepay_acceptance_report') }}
),
renamed as (
    select
        external_ref,
        {% for col in acceptance_columns %}
        {{ col }} as acceptance_{{ col }},
        {% endfor %}
        cvv_provided,
        country,
        currency,
        amount,
        rates,
        {% for currency in currencies %}
        cast(json_query(rates, '$.{{ currency }}') as float64) as {{ currency }}_currency_rate,
        {% endfor %}
        date_time

    from src
)
select * from renamed
  