select
    month(date_id) as month,
    count(distinct customer_id) as active_customers
from fact_sales
group by month(date_id)
order by month ASC;
