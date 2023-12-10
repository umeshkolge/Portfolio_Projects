                             -- Total revnue kpi --
select * from pizza_sales;
select round(sum(total_price),2) as total_revenue from pizza_sales;
						
				              -- average order value kpi --
select * from pizza_sales; 
select round(sum(total_price)/count(distinct order_id),2) as average_order_value from pizza_sales;      

                              -- Total pizza sold kpi --        
 select sum(quantity) as total_pizza_sold from pizza_sales;
 
                              -- average pizza per order  kpi --
select round(sum(quantity)/count(distinct order_id),2)
 as average_pizza_per_order from pizza_sales;					
					
	                             -- weekly trend for total pizzas sold --
select * from pizza_sales;
select weekofyear(order_date) as week_num,year(order_date) as year, sum(quantity) as Total_quantity
from pizza_sales
group by weekofyear(order_date), year(order_date);

                                             -- percentage of sales by pizza category --
select pizza_category, 
concat(round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2), "%")as sale_percent
from pizza_sales
group by pizza_category;

                                          -- percentage of sales by pizza size --
select pizza_size, 
concat(round(sum(total_price)*100/(select sum(total_price) from pizza_sales),2), "%")as sale_percent
from pizza_sales
group by pizza_size;

                                       -- TOTAL PIZZA SOLD BY CATEGORY --
                                       
select * from pizza_sales;
SELECT pizza_category, sum(quantity) as total_pizza_sold from pizza_sales
group by pizza_category;

                                       -- top 5 best selling pizza by revenue-
select pizza_name , sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by sum(total_price) desc
limit 5;			

                                       -- bottom 5 selling pizza by revenue -
select pizza_name , round(sum(total_price),2) as total_revenue from pizza_sales
group by pizza_name
order by sum(total_price) asc
limit 5;			
                                       
                                        -- top 5 best pizza by quantity -
select pizza_name , sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by sum(quantity)desc
limit 5;			

                                       -- bottom 5 pizza by quantity -
select pizza_name , sum(quantity) as total_quantity
 from pizza_sales
group by pizza_name
order by sum(quantity) asc
limit 5;			

                                           -- top 5 best pizza by orders -
select pizza_name , count(distinct order_id) as Total_Orders from pizza_sales
group by pizza_name
order by sum(quantity)desc
limit 5;			

                                       -- bottom 5 pizza by orders -
select pizza_name , count(distinct order_id) as total_orders
 from pizza_sales
group by pizza_name
order by count(distinct order_id)  asc
limit 5;			
