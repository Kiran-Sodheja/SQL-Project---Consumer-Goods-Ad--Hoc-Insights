/*10. Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,
division
product_code
product
total_sold_quantity
rank_order*/


with my_cte as(
select fs.product_code,dp.division,dp.product,dp.variant,sum(fs.sold_quantity)as Total_Sold_Quantity 
from dim_product as dp join fact_sales_monthly as fs on fs.product_code=dp.product_code
where fiscal_year=2021 group by fs.product_code,dp.division,dp.product,dp.variant),

my_cte2 as(
select division,product_code,product,variant,Total_Sold_Quantity,
Rank() over (partition by division order by Total_Sold_Quantity desc)as "Rank_Order"
from my_cte)

select my_cte.division,my_cte.product_code,concat(my_cte.product,"  ",'[',my_cte.variant,']') as product,my_cte.Total_Sold_Quantity,my_cte2.Rank_Order
 from my_cte join my_cte2 on my_cte.product_code=my_cte2.product_code
where my_cte2.Rank_Order in (1,2,3);