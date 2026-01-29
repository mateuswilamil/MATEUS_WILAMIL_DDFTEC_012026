select
    cast(order_id as string) as order_id
    , payment_sequential
    , payment_type
    , payment_installments
    , payment_value
from {{ source('raw', 'olist_order_payments') }}
