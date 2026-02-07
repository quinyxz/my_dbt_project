select
    order_id,
    customer_id,
    product_id,
    date_id,
    quantity,
    price,
    case
        when price <= 0 then 'price <= 0'
        when quantity <= 0 then 'quantity <= 0'
        when customer_id is null then 'missing customer_id'
    end as anomaly_type
from fact_sales
where 
    price <= 0
    or quantity <= 0
    or customer_id is null
order by anomaly_type, sales_id;
