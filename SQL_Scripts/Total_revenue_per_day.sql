select 
    date_id,
    sum(PRICE + coalesce(freight_value, 0)) as total_revenue
from fact_sales
group by date_id
order by date_id;
