with base as (
    select
        cast(min(order_purchase_timestamp) as date) as min_date
        , cast(max(order_purchase_timestamp) as date) as max_date
    from {{ ref('int_orders') }}
)

, dates as (
    select
        (min_date + cast(i as integer)) as date_day
    from base
    cross join range(date_diff('day', min_date, max_date) + 1) as t(i)
)

select
    cast(strftime(date_day, '%Y%m%d') as integer) as date_key
    , date_day
    , cast(strftime(date_day, '%Y') as integer) as year
    , cast(strftime(date_day, '%m') as integer) as month
    , strftime(date_day, '%Y-%m') as year_month
    , cast(strftime(date_day, '%d') as integer) as day_of_month
    , cast(strftime(date_day, '%w') as integer) as day_of_week_num
    , cast(strftime(date_day, '%W') as integer) as week_of_year
from dates
