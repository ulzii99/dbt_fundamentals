{{ config(
    schema='analytics'
)}}

select * 
from {{ref('stg_jaffle_shop__customers')}}

