with order_items as (
    select
        order_id
        , order_item_id
        , product_id
        , price
        , freight_value
    from {{ ref('int_order_items') }}
    ),

    orders as (
        select
            order_id
            , customer_id
            , order_purchase_timestamp
        from {{ ref('int_orders') }}
    ),

    payments as (
        select
            order_id
            , total_payment_value
        from {{ ref('int_order_payments') }}
    )

select
    order_items.order_id
    , order_items.order_item_id
    , orders.customer_id
    , order_items.product_id
    , cast(strftime(cast(orders.order_purchase_timestamp as date), '%Y%m%d') as integer) as date_key
    , order_items.price
    , order_items.freight_value
    , payments.total_payment_value
from order_items
left join orders
    on order_items.order_id = orders.order_id
left join payments
    on order_items.order_id = payments.order_id
