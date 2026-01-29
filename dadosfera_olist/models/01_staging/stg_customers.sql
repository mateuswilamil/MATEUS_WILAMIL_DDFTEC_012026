select
    cast(customer_id as string) as customer_id
    , cast(customer_unique_id as string) as customer_unique_id
    , customer_zip_code_prefix
    , customer_city
    , customer_state
from {{ source('raw', 'olist_customers') }}
