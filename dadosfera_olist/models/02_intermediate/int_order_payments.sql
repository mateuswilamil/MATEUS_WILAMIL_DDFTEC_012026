with int_order_payments as (
    select
        order_id
        , sum(payment_value) as total_payment_value
    from {{ ref('stg_order_payments') }}
    group by order_id
)

select
    *
from int_order_payments
