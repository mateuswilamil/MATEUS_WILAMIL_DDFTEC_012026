with products as (
    select
        product_id
        , product_category_name
        , product_weight_g
        , product_length_cm
        , product_height_cm
        , product_width_cm
    from {{ ref('stg_products') }}
),

descriptions as (
    select
        product_id
        , title
        , description
    from {{ ref('stg_product_descriptions') }}
)

select
    products.product_id
    , products.product_category_name
    , descriptions.title
    , descriptions.description
    , products.product_weight_g
    , products.product_length_cm
    , products.product_height_cm
    , products.product_width_cm
from products
left join descriptions
    on products.product_id = descriptions.product_id
