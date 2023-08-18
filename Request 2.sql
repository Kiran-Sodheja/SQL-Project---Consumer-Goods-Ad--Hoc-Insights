/*2. What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields,
unique_products_2020
unique_products_2021
percentage_chg*/

with my_cte1 as(
select count(distinct(product_code)) as pc
 from fact_sales_monthly 
where fiscal_year=2020),
 my_cte2 as(
select count(distinct(product_code)) as dpc
 from fact_sales_monthly 
where fiscal_year=2021)
select my_cte1.pc as unique_product_2020,my_cte2.dpc as unique_product_2021,round((dpc-pc) *100/pc,2)as percentage_chg
from my_cte1,my_cte2;