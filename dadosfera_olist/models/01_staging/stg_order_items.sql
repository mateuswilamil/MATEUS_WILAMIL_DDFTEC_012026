select
    cast(order_id as string) as order_id
    , order_item_id
    , cast(product_id as string) as product_id
    , cast(seller_id as string) as seller_id
    , cast(shipping_limit_date as timestamp) as shipping_limit_date
    , price
    , freight_value
from {{ source('raw', 'olist_order_items') }}
