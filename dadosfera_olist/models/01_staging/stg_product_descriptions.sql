with source as (
    select *
    from {{ source('raw', 'product_descriptions') }}
),

renamed as (
    select
        cast(product_id as varchar) as product_id
        , title
        , description
    from source
)

select *
from renamed
