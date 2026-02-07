select
    customer_id,
    avg(price + coalesce(freight_value, 0)) as avg_order_value
from fact_sales
group by customer_id
order by avg_order_value desc;
