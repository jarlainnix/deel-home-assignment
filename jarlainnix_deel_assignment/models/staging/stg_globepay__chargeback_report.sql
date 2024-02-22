with src as (
      select * from {{ source('globepay', 'globepay_chargeback_report') }}
),
renamed as (
    select
        external_ref,
        status as chargeback_status,
        source as chargeback_source,
        chargeback as is_chargeback

    from src
)
select * from renamed
  