/*8. In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity*/

select
case
when date between '2019-09-01' and '2019-11-01' then 1
when date between '2019-12-01' and  '2020-02-01' then 2
when date between '2020-03-01' and  '2020-05-01'  then 3
when date between '2020-06-01' and  '2020-08-01' then 4
End as Quarters,
sum(sold_quantity)as Total_Sold_Quantity from fact_sales_monthly
where fiscal_year=2020

Group by Quarters 
order by Total_Sold_Quantity desc;

select
case
when date between '2019-09-01' and '2019-11-01' then  concat(' (',1,')' ,monthname (date))
 when date between '2019-12-01' and  '2020-02-01' then  concat(' (',2,')' ,monthname(date))
when date between '2020-03-01' and  '2020-05-01'  then concat(' (',3,')',monthname(date))
when date between '2020-06-01' and  '2020-08-01' then concat(' (',4,')',monthname(date))
end as Quarters,
sum(sold_quantity)as total_sales_quantity from fact_sales_monthly
where fiscal_year=2020
group by Quarters;


SELECT 
  CASE 
    WHEN date BETWEEN '2019-09-01' AND '2019-11-01' then MONTHNAME(date) 
    WHEN date BETWEEN '2019-12-01' AND '2020-02-01' then MONTHNAME(date)
    WHEN date BETWEEN '2020-03-01' AND '2020-05-01' then MONTHNAME(date)
    WHEN date BETWEEN '2020-06-01' AND '2020-08-01' then MONTHNAME(date)
    END AS Quarters,
    SUM(sold_quantity) AS total_sold_quantity
  from fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY Quarters;