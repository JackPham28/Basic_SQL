select  * --customer_id, Ship_Mode, Order_ID --, count(distinct order_id) count_order
from sales
order by Customer_ID, Ship_Mode
with cte as(
select customer_id, Ship_Mode, count(distinct order_id) count_order
from sales
group by Ship_Mode, Customer_ID)
select customer_id, ship_mode, max(count_order) max_order
from cte
group by Ship_Mode, Customer_ID

SELECT      count (distinct order_id) count_order
, count (distinct product_id) count_product
, sum(sales) sum_sale
, sum(profit) sum_profit
FROM sales
GROUP BY category
ORDER BY sum_sale

SELECT product_id
FROM sales
WHERE category = 'Office Supplies' AND quantity > 3

SELECT order_id, product_id, customer_id, quantity
FROM sales
WHERE Ship_mode = 'Standard Class'


select *
, sum(sales) over (partition by customer_id,order_date ) as totalsalebefore
from sales
order by Customer_ID, Order_Date
