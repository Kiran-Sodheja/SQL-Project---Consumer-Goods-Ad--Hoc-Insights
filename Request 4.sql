/*4.Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference*/

 with my_cte1 as(
select dp.segment as s,count(distinct(fms.product_code)) as pc
 from dim_product as dp,fact_sales_monthly as fms  
where dp.product_code=fms.product_code
group by fms.fiscal_year,dp.segment
having fms.fiscal_year=2020),

my_cte2 as(
select dp.segment as s,count(distinct(fms.product_code)) as dpc
 from dim_product as dp,fact_sales_monthly as fms  
where dp.product_code=fms.product_code
group by fms.fiscal_year,dp.segment
having fms.fiscal_year=2021)

select my_cte1.s as segment,my_cte1.pc as product_count_2020,my_cte2.dpc as product_count_2021,(my_cte2.dpc-my_cte1.pc)
as difference from my_cte1,my_cte2 where my_cte1.s=my_cte2.s;