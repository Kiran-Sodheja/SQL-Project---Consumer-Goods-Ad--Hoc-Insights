/*7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount*/
select concat(monthname(Fs.date),"(", year(Fs.date),")")as month ,Fs.fiscal_year,
Round(sum(fg.gross_price*fs.sold_quantity), 2) as Gross_Sales_Amount 
from fact_sales_monthly as Fs join dim_customer as dc on Fs.customer_code=dc.customer_code join fact_gross_price as fg on 
fg.product_code=Fs.product_code where dc.customer="Atliq Exclusive" group by month,Fs.fiscal_year order by fs.fiscal_year;
