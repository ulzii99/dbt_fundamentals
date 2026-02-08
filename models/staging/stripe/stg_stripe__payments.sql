select 
    id payment_id
    ,orderid order_id
    ,paymentmethod as payment_method
    ,status

    --amount is stored in cents, convert it to dollars
    ,amount / 100 as amount 
    ,created create_at 
    
from {{source('stripe', 'payment')}}