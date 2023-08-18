/*9.Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage*/


with my_cte as
(
select dc.channel,round(sum(fg.gross_price   *fs.sold_quantity   )/1000000,2) as Gross_Sales_mln

from fact_sales_monthly as fs join dim_customer as dc on Fs.customer_code=dc.customer_code join fact_gross_price as fg on 
fg.product_code=Fs.product_code where fs.fiscal_year=2021 group by channel order by Gross_Sales_mln desc
)

SELECT channel,  CONCAT(Gross_sales_mln,' M') AS Gross_sales_mln ,CONCAT(ROUND(Gross_sales_mln*100/Total_Sales, 2), ' %') AS percentage
FROM 
(
(select sum(Gross_Sales_mln) as Total_Sales from my_cte) as x,
(select * from my_cte) as y
);