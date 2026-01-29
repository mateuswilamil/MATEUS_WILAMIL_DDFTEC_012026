with 
    order_items as (
        select
            order_id
            , order_item_id
            , product_id
            , price
            , freight_value
        from {{ ref('stg_order_items') }}
    )

    , orders as (
        select
            order_id
            , customer_id
            , order_status
        from {{ ref('int_orders') }}
    )

select
    order_items.order_id
    , order_items.order_item_id
    , order_items.product_id
    , orders.customer_id
    , orders.order_status
    , order_items.price
    , order_items.freight_value
from order_items
left join orders
    on order_items.order_id = orders.order_id
