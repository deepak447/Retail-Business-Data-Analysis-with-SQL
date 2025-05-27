-- Question: What is the total sales amount  region wise?

select region, sum(sales) as sales from store
group by region;

-- Find the average profit per segment.

select segment,round(avg(net_profit),2 )as profit from store
group by segment;

-- Question: Count the number of unique customer_ids.

select count(distinct(customer_id)) from store;

-- Question: Determine the maximum quantity ordered in a single transaction.
select max(quantity) from store;

-- Question: List the total sales and profit for each category
select category , round(sum(sales),2) as sales, sum(net_profit) as profit
from store
group by category;

-- Question: Retrieve all sales records with sales greater than 1000, ordered by profit in descending order.

select * from store
where sales > 1000 
order by net_profit desc;

-- Question: Find product_names that contain the word 'Table' and have profit greater than 0.
select distinct(product_name) from store
where product_name like '%Table%' and net_profit > 0;

-- Question: List customer_names who placed orders in 'New York City' or 'Los Angeles'.

select customer_name from store
where city in ('New York City' , 'Los Angeles');

-- Get the top 10 product_names by total sales.
select product_name, round(sum(sales),2) as sales
from store
group by product_name
order by sales desc
limit 10;

-- Show all orders from the 'South' region placed in '2020'.
select * from store
where region = 'South' and extract(year from order_date) = '2020';

-- Identify regions where the total profit is less than 50000.
select region, sum(net_profit) as profit
from store
group by region
having sum(net_profit) < 50000;


select extract('month' from order_date) from store;

select to_char(order_date,'month') as month, sum(sales) as sales
from store
group by month,extract('month' from order_date)
order by to_char(order_date,'month'),
extract('month' from order_date);

-- Find customer_names who have made more than 5 orders.
select  customer_name,
COUNT(DISTINCT order_id) AS order_count
from store
group by customer_name
having count(distinct(order_id)) > 5
order by COUNT(DISTINCT order_id) desc;

-- For each category, calculate the total sales of returned items vs. non-returned items
alter table store
alter column returns type int USING returns::integer;

select distinct category ,
sum(case when returns = 1 then sales else 0 end) as total_sales_returned_items,
sum(case when returns = 0 then sales else 0 end) as total_sales_nonreturned_items
from store
group by category;

-- Which states have an average sales amount greater than the overall average sales?
select state, round(avg(sales),2) as avg_sales
from store
group by state
having round(avg(sales),2) > (select round(avg(sales),2) from store);

-- Question: Count the number of distinct product_ids in each sub_category that have at least 10 products.
select sub_category , count(distinct product_id) as prduct_count
from store
group by sub_category 
having count(distinct product_id) >=10;

select * from store;

-- Calculate the average ship_days (difference between ship_date and order_date) for each ship_mode.
select ship_mode,round( avg(ship_date-order_date)) as days
from store
group by ship_mode;

-- Question: How many orders were placed each month?
select to_char(order_date,'month') as month,
count(distinct order_id) as count_of_order
from store
group by month;

select extract(year from order_date) as year,
count(distinct order_id) as count_of_order
from store
group by year;

-- Find the order_ids that took more than 7 days to ship.
select order_id, (ship_date- order_date) as days
from store
where (ship_date- order_date) >  7

select now() - interval '2 days'


-- Identify the customer_id who placed an order on their first ordering date.

select min(order_date)from store;

select distinct customer_id, customer_name, order_date
from store s1
where order_date = (select min(order_date)from store s2
where s1.customer_id = s2.customer_id)
order by customer_id, order_date

-- Which year had the highest total sales?
select extract(year from order_date) as years, sum(sales)
from store
group by years
order by sum(sales) desc
limit 1;


-- Count products whose product_name starts with 'Sta'.
select  count(distinct product_id) as count
from store
where product_name like 'Sta%';

select product_name, count(distinct product_id) as count
from store
group by product_name
having product_name like 'Sta%'
order by count desc;

 -- List citys where the city name is exactly 8 characters long.
select distinct city
from store
where length(city) = 8;


-- Find customer_names that contain a space.
select customer_name
from store
where customer_name like '% %';

-- Question: Extract the first two characters of product_id and count occurrences.

select left(product_id,2) as prefix,
count(*) as count_prefix
from store
group by product_id
order by 2 desc;

-- Question: Group sales by the initial letter of category.
select substring(category from 1 for 1),
sum(sales)
from store
group by 1
order by 1 desc;
















































