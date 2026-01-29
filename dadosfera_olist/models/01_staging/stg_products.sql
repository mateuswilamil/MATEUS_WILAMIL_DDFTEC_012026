select
    cast(product_id as varchar) as product_id
    , cast(product_category_name as varchar) as product_category_name
    , cast(product_name_lenght as integer) as product_name_length
    , cast(product_description_lenght as integer) as product_description_length
    , product_photos_qty
    , product_weight_g
    , product_length_cm
    , product_height_cm
    , product_width_cm
from {{ source('raw', 'olist_products') }}
