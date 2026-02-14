select
    order_id,
    order_amount
    
from {{source('dbt_learn_jinja', 'orders__amazon')}}