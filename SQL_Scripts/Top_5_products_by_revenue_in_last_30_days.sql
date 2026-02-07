select
    p.product_category_name,
    sum(f.PRICE + coalesce(f.freight_value, 0)) as revenue,
    date_id
from fact_sales f
LEFT join DIM_PRODUCTS p on f.product_id = p.product_id
where f.date_id >= (SELECT (max(date_id) - 30) AS MAX_DATE FROM FACT_SALES)
group by p.product_category_name, date_id
order by revenue desc
LIMIT 5
