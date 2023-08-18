/*6. Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage*/

with my_cte1 as(
select customer_code as x,avg(pre_invoice_discount_pct) as y from fact_pre_invoice_deductions
where fiscal_year='2021'
group by customer_code),

my_cte2 as(
select customer_code as cc,customer as c from dim_customer
where market='India')

select my_cte1.x as customer_code,my_cte2.c as customer,round(my_cte1.y *100,2) as average_discount_percentage
from my_cte1 join my_cte2 on my_cte1.x=my_cte2.cc order by average_discount_percentage desc limit 5;
